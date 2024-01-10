import 'package:flutter/material.dart';
import 'package:flutter_application_1/Controllers/bloc/custom_items_bloc.dart';
import 'package:flutter_application_1/Views/screens/add_more_item_screen.dart';
import 'package:flutter_application_1/Views/widgets/custom_errore_widget.dart';
import 'package:flutter_application_1/Views/widgets/custom_loading_widget.dart';
import 'package:flutter_application_1/Views/widgets/items_widget.dart';
import 'package:flutter_application_1/core/constants/app_color.dart';
import 'package:flutter_application_1/core/repo/list_items_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CustomItemsBloc(customItemsRepo: CustomItemsRepo())
        ..add(
          GetAllItems(),
        ),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        // home: const AddMoreItemScreen(),
        home: const MyHomePage(title: 'Flutter Demo Home Page'),
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
          title: Text(
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
