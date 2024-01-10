import 'package:flutter/material.dart';
import 'package:flutter_application_1/Models/emer_item_modle.dart';
import 'package:flutter_application_1/core/constants/app_color.dart';
import 'package:flutter_application_1/core/constants/constants.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:motion_toast/motion_toast.dart';

final _formKey = GlobalKey<FormBuilderState>();

class EditItemScreen extends StatelessWidget {
  final Emeritem emeritem;
  const EditItemScreen({super.key, required this.emeritem});

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
        backgroundColor: AppColor.kPrimaryColor,
        title: Text(
          emeritem.title,
          style: TextStyle(
            color: Colors.white,
          ),
        ),
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
//  textDirection: ,

                  decoration: InputDecoration(
                    hintText: emeritem.title,
                    // hintStyle: TextStyle(color: Colors.black),

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

                  decoration: InputDecoration(
                    hintText: emeritem.description,
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

                  decoration: InputDecoration(
                    hintText: emeritem.imgLink,
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
            Spacer(),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColor.kPrimaryColor,
              ),
              onPressed: () async {
                MotionToast(
                  primaryColor: AppColor.kPrimaryColor,
                  description: Text("This featuars is under development"),
                  icon: Icons.code_rounded,
                  width: MediaQuery.of(context).size.width * .8,
                  height: 100,
                  // descriptionStyle: TextStyle(
                  //     fontSize: 14,
                  //     color: Colors.deepOrange
                  // ),
                ).show(context);
                // // Validate and save the form values
                // _formKey.currentState?.saveAndValidate();
                // debugPrint(_formKey.currentState?.value.toString());

                // // On another side, can access all field values without saving form with instantValues
                // _formKey.currentState?.validate();
                // debugPrint(_formKey.currentState?.instantValue.toString());

                // await postItem();
              },
              child: const Text(
                'save',
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
