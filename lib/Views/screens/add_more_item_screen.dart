import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/constants/app_color.dart';
import 'package:flutter_application_1/core/constants/constants.dart';
import 'package:flutter_application_1/repositories/add_item_repo.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

final _formKey = GlobalKey<FormBuilderState>();

class AddMoreItemScreen extends StatelessWidget {
  const AddMoreItemScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
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
        child: Column(
          children: [
            FormBuilder(
              key: _formKey,
              child: Column(children: [
                FormBuilderTextField(
                  // key: _emailFieldKey,
                  name: 'title',

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

                  cursorColor: AppColor.kPrimaryColor,

                  decoration: const InputDecoration(
                    labelText: 'img link',
                    focusColor: AppColor.kPrimaryColor,
                  ),
                  // validator: FormBuilderValidators.compose([
                  //   FormBuilderValidators.required(),
                  //   FormBuilderValidators.email(),
                ),
                //  ####  //
                //  ####  //
                //  ####  //
              ]),
            ),
            // const SizedBox(height: 10),
            // FormBuilderTextField(
            //   name: 'password',

            // cursorColor: AppColor.kPrimaryColor,

            //   decoration: const InputDecoration(labelText: 'Password'),
            //   obscureText: true,
            //   // validator: FormBuilderValidators.compose([
            //   //   FormBuilderValidators.required(),
            //   // ]),
            // ),
            const Spacer(),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColor.kPrimaryColor,
              ),
              onPressed: () async {
                // // Validate and save the form values
                // _formKey.currentState?.saveAndValidate();
                // debugPrint(_formKey.currentState?.value.toString());

                // // On another side, can access all field values without saving form with instantValues
                // _formKey.currentState?.validate();
                // debugPrint(_formKey.currentState?.instantValue.toString());

                await postItem();
              },
              child: const Text(
                'add',
                style: TextStyle(color: Colors.white),
              ),
            ),
            emptySpace,
          ],
        ),
      ),
    );
  }
}
