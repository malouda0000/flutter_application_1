import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/constants/constants.dart';

class CustomErorreScreen extends StatelessWidget {
  final String errorMassage;
  const CustomErorreScreen({super.key, required this.errorMassage});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(
                theDefaultPadding,
              ),
              child: Text(
                errorMassage,
                style: const TextStyle(
                  fontSize: 18,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            ElevatedButton(
              onPressed: () {},
              child: const Text('try Again'),
            )
          ],
        ),
      ),
    );
  }
}
