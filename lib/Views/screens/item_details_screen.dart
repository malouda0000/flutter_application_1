import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Models/emer_item_modle.dart';
import 'package:flutter_application_1/Views/widgets/custom_alert_dialog.dart';
import 'package:flutter_application_1/core/constants/app_api_links.dart';
import 'package:flutter_application_1/core/constants/app_color.dart';
import 'package:flutter_application_1/core/constants/app_routes.dart';
import 'package:flutter_application_1/core/constants/constants.dart';
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
        child: Column(
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
                    progressIndicatorBuilder:
                        (context, url, downloadProgress) => Center(
                      child: CircularProgressIndicator(
                          value: downloadProgress.progress),
                    ),
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.error),
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

                      context.pushNamed(AppRoute.editItemScreen,
                          extra: emeritem);
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
                    onPressed: () {
                      showDialog(
                        barrierColor: Colors.black26,
                        context: context,
                        builder: (context) {
                          return const CustomAlertDialog(
                            title: "Remove item !!",
                            description: "you are about to remove this item",
                          );
                        },
                      );

// Dialog(
//       elevation: 0,
//       backgroundColor: Color(0xffffffff),
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.circular(15.0),
//       ),
// child :
//     );

                      // showDialog(
                      //     context: context,
                      //     builder: (context) {
                      //       return Container(
                      //         width: MediaQuery.of(context).size.width * 0.7,
                      //         height: 100,
                      //         decoration: BoxDecoration(
                      //           color: AppColor.kPrimaryColor,
                      //         ),
                      //         child: Column(
                      //           children: [
                      //             Text(
                      //               'are you sure you want to delete this item?',
                      //               style: TextStyle(),
                      //             ),
                      //           ],
                      //         ),
                      //       );
                      //     });
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
        ),
      ),
    );
  }
}
