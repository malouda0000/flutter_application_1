import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Controllers/custom_items_bloc/custom_items_bloc.dart';
import 'package:flutter_application_1/Controllers/item%20details%20bloc/item_details_bloc.dart';
import 'package:flutter_application_1/Models/emer_item_modle.dart';
import 'package:flutter_application_1/Views/widgets/custom_alert_dialog.dart';
import 'package:flutter_application_1/Views/widgets/custom_errore_widget.dart';
import 'package:flutter_application_1/Views/widgets/custom_loading_widget.dart';
import 'package:flutter_application_1/core/constants/app_api_links.dart';
import 'package:flutter_application_1/core/constants/app_color.dart';
import 'package:flutter_application_1/core/constants/app_routes.dart';
import 'package:flutter_application_1/core/constants/constants.dart';
import 'package:flutter_application_1/repositories/delete_item_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class ItemDetScreen extends StatelessWidget {
  final Emeritem emeritem;
  const ItemDetScreen({super.key, required this.emeritem});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.kPrimaryColor,
        title: Text(
          emeritem.title,
          style: const TextStyle(color: Colors.white),
        ),
        leading: IconButton(
            onPressed: () {
              context.pop();
            },
            icon: const Icon(
              Icons.arrow_back_ios_new,
              color: Colors.white,
            )),
      ),
      body: Padding(
          padding: const EdgeInsets.all(theDefaultPadding),
          child: BlocConsumer<ItemDetailsBloc, ItemDetailsState>(
            listener: (context, state) {
              if (state is ItemDetailsRemovdedState) {
                context.read<CustomItemsBloc>().add(GetAllItemsEvent());

                context.goNamed(AppRoute.myHomePage);
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('item removed successfully'),
                    // backgroundColor: Colors.red,
                  ),
                );
              }
            },
            builder: (context, state) {
              if (state is ItemDetailsInitialState) {
                // return const CustomLoadingWidget();
                return _Body(
                  emeritem: emeritem,
                );
              } else if (state is ItemDetailsLoadingState) {
                return const CustomLoadingWidget();
              } else if (state is ItemDetailsLoadedState) {
                return _Body(emeritem: emeritem);
              } else if (state is ItemDetailsErrorState) {
                return CustomErorreScreen(errorMassage: state.errorMassage);
              } else {
                return const CustomErorreScreen(
                  errorMassage: 'unknown error happend',
                );
              }
            },
          )),
    );
  }
}

class _Body extends StatelessWidget {
  const _Body({
    super.key,
    required this.emeritem,
  });

  final Emeritem emeritem;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Spacer(),
        Center(
            child: Column(
          children: [
            Container(
              clipBehavior: Clip.hardEdge,
              width: MediaQuery.of(context).size.width * .9,
              height: MediaQuery.of(context).size.width * .7,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                    theDefaultRaduis,
                  ),
                  border: Border.all(
                    color: AppColor.kPrimaryColor,
                    width: 2,
                  )),
              child: CachedNetworkImage(
                imageUrl: emeritem.imgLink,
                progressIndicatorBuilder: (context, url, downloadProgress) =>
                    Center(
                  child: CircularProgressIndicator(
                      value: downloadProgress.progress),
                ),
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ),
            ),
            emptySpace,
            Text(
              emeritem.description,
              style: const TextStyle(
                color: AppColor.kPrimaryColor,
              ),
            ),
          ],
        )),
        const Spacer(),
        Row(
          children: [
            Expanded(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColor.kPrimaryColor,
                ),
                onPressed: () {
                  // Navigator.of(context).push(MaterialPageRoute(
                  //     builder: ((context) =>
                  //         EditItemScreen(emeritem: emeritem))));

                  context.pushNamed(AppRoute.editItemScreen, extra: emeritem);
                },
                child: const Text(
                  'edit',
                  style: TextStyle(
                    // color: AppColor.kPrimaryColor,
                    color: Colors.white,

                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            emptySpace,
            emptySpace,
            Expanded(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.redAccent,
                ),
                onPressed: () async {
                  await showDialog(
                    barrierColor: Colors.black26,
                    context: context,
                    builder: (context) {
                      return CustomAlertDialog(
                        title: "Remove item !!",
                        description: "you are about to remove this item",
                        onTap: () async {
                          context.pop();
                          context.read<ItemDetailsBloc>().add(
                                ItemRemoveEvent(
                                  userEmail: AppApiLinks.userEmail,
                                  itemId: emeritem.id.toString(),
                                ),
                              );
                        },
                      );
                    },
                  );
                },
                child: const Text(
                  'remove',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            )
          ],
        ),
        emptySpace,
      ],
    );
  }
}
