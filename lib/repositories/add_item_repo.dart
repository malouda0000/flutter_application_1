import 'dart:convert';
import 'package:flutter_application_1/core/constants/app_api_links.dart';
import 'package:http/http.dart' as http;

Future<bool> postNewItem({
  required String itemTitle,
  required String itemDescription,
  required String itemImgUrl,
}) async {
  Map<String, String> reqestes = {
    "title": itemTitle,
    "email": AppApiLinks.userEmail,
    // "email": "email=mike.hsch@gmail.com",
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

    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
      // throw 'Error';
    }
  } catch (e) {
    throw 'Errorrrrr: $e ';
  }
}
