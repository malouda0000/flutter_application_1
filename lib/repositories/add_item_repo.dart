import 'dart:convert';

import 'package:flutter_application_1/Views/screens/add_more_item_screen.dart';
import 'package:flutter_application_1/core/constants/app_api_links.dart';
import 'package:http/http.dart' as http;

Future<bool> postItem() async {
  final String itemTitle =
      addItemFormKey.currentState!.value['title'] as String;
  final String itemDescription =
      addItemFormKey.currentState!.value['discription'] as String;
  final String itemImgUrl =
      addItemFormKey.currentState!.value['img link'] as String;
  Map<String, String> reqestes = {
    "title": itemTitle,
    // "email": "email=mike.hsch@gmail.com",
    "email": AppApiLinks.userEmail,
    "description": itemDescription,
    // "img_link": AppOnlineImage.spaceImgPng,
    "img_link": itemImgUrl,
  };

  final url = Uri.parse(
    "${AppApiLinks.mainTestApi}${AppApiLinks.createEndPoint}",
  );

  try {
    final http.Response response =
        await http.post(url, body: jsonEncode(reqestes));
    print('response staaaaaaaats code: ${response.statusCode}');
    if (response.statusCode == 200) {
      print('succccessss pooostttting post request ');

      // void _showToast(BuildContext context) {
      //   final scaffold = ScaffoldMessenger.of(context);
      //   scaffold.showSnackBar(
      //     SnackBar(
      //       content: const Text('Added to favorite'),
      //       action: SnackBarAction(
      //           label: 'UNDO', onPressed: scaffold.hideCurrentSnackBar),
      //     ),
      //   );
      // }

      // return Emeritem.fromJson(jsonDecode(response.body)) as List<Emeritem>;

      return true;
    } else {
      print('errrrrororororor in posting post request ');
      return false;
      // throw 'Error';
    }
  } catch (e) {
    print('errrrrororororor  ${e.toString()} ');
    throw 'Errorrrrr: $e ';
  }
}
