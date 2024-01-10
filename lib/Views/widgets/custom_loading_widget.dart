import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/constants/app_color.dart';

class CustomLoadingWidget extends StatelessWidget {
  const CustomLoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(
        color: AppColor.kPrimaryColor,
      ),
    );
  }
}
