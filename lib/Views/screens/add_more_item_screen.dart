import 'package:flutter/material.dart';
import 'package:flutter_application_1/Controllers/custom_items_bloc/custom_items_bloc.dart';
import 'package:flutter_application_1/core/constants/app_color.dart';
import 'package:flutter_application_1/core/constants/constants.dart';
import 'package:flutter_application_1/repositories/add_item_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:go_router/go_router.dart';

final addItemFormKey = GlobalKey<FormBuilderState>();

class AddMoreItemScreen extends StatelessWidget {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController imgLinkController = TextEditingController();

  AddMoreItemScreen({super.key});

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
          child: BlocConsumer<CustomItemsBloc, CustomItemsState>(
              listener: (context, state) {
            // TODO: implement listener
          }, builder: (context, state) {
            return Column(
              children: [
                FormBuilder(
                  key: addItemFormKey,
                  child: Column(children: [
                    FormBuilderTextField(
                      // key: _titleFieldKey,
                      name: 'title',
                      controller: titleController,
                      cursorColor: AppColor.kPrimaryColor,
                      decoration: const InputDecoration(
                        labelText: 'title',
                        focusColor: AppColor.kPrimaryColor,
                      ),
                      // validator: FormBuilderValidators.compose([
                      //   FormBuilderValidators.required(),
                      //   FormBuilderValidators.email(),])
                    ),
                    //  ####  //
                    //  ####  //
                    //  ####  //
                    FormBuilderTextField(
                      // key: _emailFieldKey,
                      name: 'discription',
                      controller: descriptionController,
                      cursorColor: AppColor.kPrimaryColor,
                      decoration: const InputDecoration(
                        labelText: 'discription',
                        focusColor: AppColor.kPrimaryColor,
                      ),
                      // validator: FormBuilderValidators.compose([
                      //   FormBuilderValidators.required(),
                      //   FormBuilderValidators.email(),
                    ),
                    //  ####  //
                    //  ####  //
                    //  ####  //

                    FormBuilderTextField(
                      // key: _emailFieldKey,
                      name: 'img link',
                      controller: imgLinkController,
                      cursorColor: AppColor.kPrimaryColor,
                      decoration: const InputDecoration(
                        labelText: 'img link',
                        focusColor: AppColor.kPrimaryColor,
                      ),
                      // validator: FormBuilderValidators.compose([
                      //   FormBuilderValidators.required(),
                      //   FormBuilderValidators.email(),
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
                    // addItemFormKey.currentState?.saveAndValidate();
                    // debugPrint(addItemFormKey.currentState?.value.toString());

                    // On another side, can access all field values without saving form with instantValues
                    // addItemFormKey.currentState?.validate();
                    // debugPrint(
                    //     addItemFormKey.currentState?.instantValue.toString());
                    context.read<CustomItemsBloc>().add(AddNewItemEvent());
                  },
                  child: const Text(
                    'add',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                emptySpace,
              ],
            );
          })),
    );
  }
}
