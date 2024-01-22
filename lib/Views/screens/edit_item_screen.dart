import 'package:flutter/material.dart';
import 'package:flutter_application_1/Controllers/custom_items_bloc/custom_items_bloc.dart';
import 'package:flutter_application_1/Controllers/item%20details%20bloc/item_details_bloc.dart';
import 'package:flutter_application_1/Models/emer_item_modle.dart';
import 'package:flutter_application_1/Views/widgets/custom_loading_widget.dart';
import 'package:flutter_application_1/core/constants/app_api_links.dart';
import 'package:flutter_application_1/core/constants/app_color.dart';
import 'package:flutter_application_1/core/constants/app_routes.dart';
import 'package:flutter_application_1/core/constants/constants.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:go_router/go_router.dart';

final _editItemFormKey = GlobalKey<FormBuilderState>();

class EditItemScreen extends StatelessWidget {
  final Emeritem emeritem;
  final String userEmail = AppApiLinks.userEmail;

  const EditItemScreen({super.key, required this.emeritem});

  @override
  Widget build(BuildContext context) {
    // final TextEditingController id = TextEditingController();
    final TextEditingController itemTitleController =
        TextEditingController(text: emeritem.title);
    final TextEditingController itemDescriptionController =
        TextEditingController(text: emeritem.description);
    final TextEditingController itemImgUrlController =
        TextEditingController(text: emeritem.imgLink);

    // final String id = emeritem.id.toString();
    // final String itemTitle = emeritem.title;
    // final String itemDescription = emeritem.description;
    // final String itemImgUrl = emeritem.imgLink;

    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                context.pop();
              },
              icon: const Icon(
                Icons.arrow_back_ios_new,
                color: Colors.white,
              )),
          backgroundColor: AppColor.kPrimaryColor,
          title: Text(
            emeritem.title,
            style: const TextStyle(
              color: Colors.white,
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(theDefaultPadding),
          child: BlocConsumer<ItemDetailsBloc, ItemDetailsState>(
              listener: (context, state) {
            if (state is ItemEditedSuccsfluyState) {
              context.read<CustomItemsBloc>().add(GetAllItemsEvent());
              context.read<ItemDetailsBloc>().add(ItemDetailsRsetEvent());
              context.goNamed(AppRoute.myHomePage);
              ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Item edited successfully')));
            }
          }, builder: (context, state) {
            if (state is ItemDetailsLoadingState) {
              return const CustomLoadingWidget();
            } else {
              return _Body(
                  itemTitleController: itemTitleController,
                  emeritem: emeritem,
                  itemDescriptionController: itemDescriptionController,
                  itemImgUrlController: itemImgUrlController);
            }
          }),
        ));
  }
}

class _Body extends StatelessWidget {
  const _Body({
    // super.key,
    required this.itemTitleController,
    required this.emeritem,
    required this.itemDescriptionController,
    required this.itemImgUrlController,
  });

  final TextEditingController itemTitleController;
  final Emeritem emeritem;
  final TextEditingController itemDescriptionController;
  final TextEditingController itemImgUrlController;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        FormBuilder(
          key: _editItemFormKey,
          child: Column(children: [
            FormBuilderTextField(
              // key: _emailFieldKey,
              name: 'title',
              controller: itemTitleController,
              //initialvalue: emeritem.title,
              // validator: customFormValidator(itemTitleController.text),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter value';
                }
                return null;
              },
              cursorColor: AppColor.kPrimaryColor,
              decoration: InputDecoration(
                hintText: emeritem.title,
                labelText: 'title',
                focusColor: AppColor.kPrimaryColor,
              ),
            ),

            //  ####  //
            //  ####  //
            //  ####  //

            FormBuilderTextField(
              // key: _emailFieldKey,
              name: 'discription',
              controller: itemDescriptionController,
              //initialvalue: emeritem.description,
              // validator: customFormValidator(itemDescriptionController.text),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter value';
                }
                return null;
              },
              cursorColor: AppColor.kPrimaryColor,
              decoration: InputDecoration(
                hintText: emeritem.description,
                labelText: 'discription',
                focusColor: AppColor.kPrimaryColor,
              ),
            ),

            //  ####  //
            //  ####  //
            //  ####  //

            FormBuilderTextField(
              // key: _emailFieldKey,
              name: 'img link',
              controller: itemImgUrlController,
              //initialvalue: emeritem.imgLink,
              // validator: customFormValidator(itemImgUrlController.text),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter value';
                }
                return null;
              },
              cursorColor: AppColor.kPrimaryColor,
              decoration: InputDecoration(
                hintText: emeritem.imgLink,
                labelText: 'img link',
                focusColor: AppColor.kPrimaryColor,
              ),
            ),

            //  ####  //
            //  ####  //
            //  ####  //
          ]),
        ),
        const Spacer(),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColor.kPrimaryColor,
          ),
          onPressed: () async {
            // Validate and save the form values
            _editItemFormKey.currentState?.saveAndValidate();
            // debugPrint(_editItemFormKey.currentState?.value.toString());

            // // On another side, can access all field values without saving form with instantValues
            // _editItemFormKey.currentState?.validate();
            // debugPrint(_editItemFormKey.currentState?.instantValue.toString());

            // _editItemFormKey.currentState!.validate();
            // debugPrint(_editItemFormKey.currentState?.value.toString());

            if (_editItemFormKey.currentState!.validate()) {
              // If the form is valid, display a snackbar. In the real world,
              // you'd often call a server or save the information in a database.

              context.read<ItemDetailsBloc>().add(
                    ItemEditeEvent(
                        userEmail: AppApiLinks.userEmail,
                        itemId: emeritem.id.toString(),
                        itemTitle: itemTitleController.text,
                        itemDescription: itemDescriptionController.text,
                        itemImgUrl: itemImgUrlController.text),
                  );

              // if (context.canPop()) {
              //   context.pop;
              // }
            }
          },
          child: const Text(
            'save',
            style: TextStyle(color: Colors.white),
          ),
        ),
        emptySpace,
      ],
    );
  }
}
