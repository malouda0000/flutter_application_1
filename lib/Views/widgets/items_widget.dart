import 'package:flutter/material.dart';
import 'package:flutter_application_1/Controllers/custom_items_bloc/custom_items_bloc.dart';
import 'package:flutter_application_1/Models/emer_item_modle.dart';
import 'package:flutter_application_1/Views/widgets/custom_errore_widget.dart';
import 'package:flutter_application_1/Views/widgets/custom_loading_widget.dart';
import 'package:flutter_application_1/core/constants/app_color.dart';
import 'package:flutter_application_1/core/constants/app_routes.dart';
import 'package:flutter_application_1/core/constants/constants.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

// GlobalKey refreshIndecatorKey = GlobalKey<RefreshIndicatorState>();

class CustomItemsWidget extends StatelessWidget {
  // final List<Emeritem> items;
  const CustomItemsWidget({
    super.key,
    //  required this.items
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: RefreshIndicator(
              // key: const PageStorageKey('custom_items_widget'),
              // key: refreshIndecatorKey,
              onRefresh: () async {
                // GetAllItemsEvent();
                // context.read<CustomItemsBloc>().add(GetAllItemsEvent());
                context.read<CustomItemsBloc>().add(GetAllItemsEvent());
              },
              color: AppColor.kPrimaryColor,
              child: BlocBuilder<CustomItemsBloc, CustomItemsState>(
                  builder: (context, state) {
                if (state is LoadingState) {
                  return const Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      emptySpace,
                      CustomLoadingWidget(),
                      // refreshIndecatorKey.currentState!.widget,
                    ],
                  );
                } else if (state is LoadedState) {
                  return _ItemsList(items: state.emeritem);
                } else if (state is ErrorState) {
                  return CustomErorreScreen(
                    errorMassage: state.errorMassage,
                  );
                } else {
                  return const CustomErorreScreen(
                    errorMassage: 'unknown error',
                  );
                }
              })

              // _ItemsList(items: items),
              ),
        ),
        emptySpace,
        ElevatedButton(
          // style: ButtonStyle(backgroundColor: Colors.green),

          style: ElevatedButton.styleFrom(
            backgroundColor: AppColor.kPrimaryColor,
          ),
          onPressed: () {
            context.pushNamed(AppRoute.addMoreItemsScreen);
          },
          child: const Text(
            'add more',
            style: TextStyle(color: Colors.white),
          ),
        ),
        emptySpace,
        emptySpace,
      ],
    );
  }
}

class _ItemsList extends StatelessWidget {
  const _ItemsList({
    // super.key,
    required this.items,
  });

  final List<Emeritem> items;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (BuildContext context, int index) {
        Emeritem emeritems = items[index];
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Card(
            child: ListTile(
                leading: CircleAvatar(
                  backgroundColor: AppColor.kPrimaryColor,
                  child: Text(
                    // emeritems[index].id.toString(),
                    emeritems.id.toString(),
                    style: const TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
                // title: Text(emeritems[index].title),
                title: Text(emeritems.title),
                subtitle: Text(emeritems.description),
                trailing: const Icon(
                  Icons.arrow_forward_ios,
                  color: AppColor.kPrimaryColor,
                ),
                onTap: () {
                  GoRouter.of(context)
                      .pushNamed(AppRoute.itemDetailsScreen, extra: emeritems);
                }),
          ),
        );
      },
    );
  }
}
