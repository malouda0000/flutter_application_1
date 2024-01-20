import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CustomTestWidget extends StatelessWidget {
  const CustomTestWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        // child: Text('data'),
        // child: CachedNetworkImage(
        //   errorWidget:  Container(child: Text('error')),
        //     imageUrl:
        //         'https://commondatastorage.googleapis.com/codeskulptor-demos/riceracer_assets/img/car_1.png'),

        child: CachedNetworkImage(
          // imageUrl: "http://via.placeholder.com/350x150",

          imageUrl:
              "https://commondatastorage.googleapis.com/codeskulptor-demos/riceracer_assets/img/car_1.png",
          progressIndicatorBuilder: (context, url, downloadProgress) =>
              CircularProgressIndicator(value: downloadProgress.progress),
          errorWidget: (context, url, error) => Icon(Icons.error),
        ),
      ),
    );
  }
}
