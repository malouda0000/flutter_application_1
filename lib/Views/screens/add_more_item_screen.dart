import 'package:flutter/material.dart';
import 'package:flutter_application_1/Controllers/add%20new%20item%20bloc/add_new_item_bloc.dart';
import 'package:flutter_application_1/Controllers/custom_items_bloc/custom_items_bloc.dart';
import 'package:flutter_application_1/Views/widgets/custom_errore_widget.dart';
import 'package:flutter_application_1/Views/widgets/custom_loading_widget.dart';
import 'package:flutter_application_1/core/constants/app_color.dart';
import 'package:flutter_application_1/core/constants/app_routes.dart';
import 'package:flutter_application_1/core/constants/constants.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:go_router/go_router.dart';

final _addItemFormKey = GlobalKey<FormBuilderState>();

class AddMoreItemScreen extends StatefulWidget {
  AddMoreItemScreen({super.key});

  @override
  State<AddMoreItemScreen> createState() => _AddMoreItemScreenState();
}

class _AddMoreItemScreenState extends State<AddMoreItemScreen> {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController itemImgLinkController = TextEditingController();

  @override
  Widget build(BuildContext context) {
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
        title: const Text(
          'add more item',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: AppColor.kPrimaryColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(theDefaultPadding),
        child: BlocConsumer<AddNewItemBloc, AddNewItemState>(
          listener: (context, state) {
            if (state is NewItemAddedSuccessState) {
              context.read<CustomItemsBloc>().add(GetAllItemsEvent());
              context.goNamed(AppRoute.myHomePage);
              ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Item added successfully')));
              context.read<CustomItemsBloc>().add(GetAllItemsEvent());

              // this may cause problem in the futuer
              // context.read<AddNewItemBloc>().close();
              // _addItemFormKey.currentState!.reset();
            } else if (state is AddNewItemErrorState) {
              ScaffoldMessenger.of(context)
                  .showSnackBar(SnackBar(content: Text(state.errorMassage)));
            }
          },
          builder: (context, state) {
            if (state is LoadingNewItemState) {
              return const CustomLoadingWidget();
            }
            if (state is AddNewItemErrorState) {
              return CustomErorreScreen(errorMassage: state.errorMassage);
            } else {
              return _Body(
                  titleController: titleController,
                  descriptionController: descriptionController,
                  itemImgLinkController: itemImgLinkController);
            }
          },
        ),
      ),
    );
  }
}

class _Body extends StatelessWidget {
  const _Body({
    super.key,
    required this.titleController,
    required this.descriptionController,
    required this.itemImgLinkController,
  });

  final TextEditingController titleController;
  final TextEditingController descriptionController;
  final TextEditingController itemImgLinkController;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        FormBuilder(
          key: _addItemFormKey,
          child: Column(children: [
            FormBuilderTextField(
              // key: _titleFieldKey,
              name: 'title',
              controller: titleController,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter value';
                }
                return null;
              },
              cursorColor: AppColor.kPrimaryColor,
              decoration: const InputDecoration(
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
              controller: descriptionController,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter value';
                }
                return null;
              },
              cursorColor: AppColor.kPrimaryColor,
              decoration: const InputDecoration(
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
              controller: itemImgLinkController,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter value';
                }
                return null;
              },
              cursorColor: AppColor.kPrimaryColor,
              decoration: const InputDecoration(
                labelText: 'img link',
                focusColor: AppColor.kPrimaryColor,
              ),
            ),
          ]),
        ),
        const Spacer(),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColor.kPrimaryColor,
          ),
          onPressed: () async {
            // Validate and save the form values
            // _addItemFormKey.currentState?.saveAndValidate();
            // debugPrint(_addItemFormKey.currentState?.value.toString());

            // On another side, can access all field values without saving form with instantValues
            // _addItemFormKey.currentState?.validate();
            // debugPrint(
            //     _addItemFormKey.currentState?.instantValue.toString());
            _addItemFormKey.currentState!.validate();
            if (_addItemFormKey.currentState!.validate()) {
              context.read<AddNewItemBloc>().add(AddNewItemNowEvent(
                    itemTitle: titleController.text,
                    itemDescription: descriptionController.text,
                    itemImgUrl: itemImgLinkController.text,
                  ));
              // context.pop();
            }
          },
          child: const Text(
            'add',
            style: TextStyle(color: Colors.white),
          ),
        ),
        emptySpace,
      ],
    );
  }
}
