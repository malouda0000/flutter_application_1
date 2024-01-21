import 'package:flutter/material.dart';
import 'package:flutter_application_1/Controllers/add%20new%20item%20bloc/add_new_item_bloc.dart';
import 'package:flutter_application_1/Controllers/custom_items_bloc/custom_items_bloc.dart';
import 'package:flutter_application_1/Controllers/item%20details%20bloc/item_details_bloc.dart';
import 'package:flutter_application_1/Views/widgets/custom_errore_widget.dart';
import 'package:flutter_application_1/Views/widgets/custom_loading_widget.dart';
import 'package:flutter_application_1/Views/widgets/items_widget.dart';
import 'package:flutter_application_1/core/constants/app_color.dart';
import 'package:flutter_application_1/core/constants/app_routes.dart';
import 'package:flutter_application_1/repositories/list_items_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<CustomItemsBloc>(
          create: (context) => CustomItemsBloc(
              // customItemsRepo: CustomItemsRepo()
              )
            ..add(
              GetAllItemsEvent(),
            ),
        ),
        BlocProvider<AddNewItemBloc>(
          create: (context) => AddNewItemBloc(),
        ),
        BlocProvider(
          create: (context) => ItemDetailsBloc(),
        ),
      ],
      // create: (context) => CustomItemsBloc(customItemsRepo: CustomItemsRepo())
      //   ..add(
      //     GetAllItems(),
      //   ),
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        themeMode: ThemeMode.system,
        routerConfig: customGoRouter,
        themeAnimationCurve: Curves.easeOut,

        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        // home: const AddMoreItemScreen(),
        // home: const MyHomePage(title: 'Emerging Ideas'),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Emerging Ideas',
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: AppColor.kPrimaryColor,
        ),
        body: BlocBuilder<CustomItemsBloc, CustomItemsState>(
            builder: (context, state) {
          if (state is LoadedState) {
            return CustomItemsWidget(items: state.emeritem);
          } else if (state is ErrorState) {
            return CustomErorreScreen(
              errorMassage: state.errorMassage,
            );
          } else {
            return const CustomLoadingWidget();
          }
        }));
  }
}
