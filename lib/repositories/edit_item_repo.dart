import 'dart:convert';
import 'package:flutter_application_1/core/constants/app_api_links.dart';
import 'package:http/http.dart' as http;

class EditItemRepository {
  Future<http.Response> editItemRepository({
    required String userEmail,
    required String itemId,
    required String itemTitle,
    required String itemDescription,
    required String itemImgUrl,
  }) async {
    Map<String, String> reqestes = {
      "email": userEmail,
      // "email": "email=mike.hsch@gmail.com",
      "id": itemId,
      "title": itemTitle,
      "description": itemDescription,
      "img_link": itemImgUrl,
      // "img_link": AppOnlineImage.spaceImgPng,
    };

    final url = Uri.parse(
      "${AppApiLinks.mainTestApi}${AppApiLinks.editEndPoint}?email=${reqestes['email']}&id=${reqestes['id']}&title=${reqestes['title']}&description=${reqestes['description']}&img_link=${reqestes['img_link']}",
    );

    try {
      final http.Response response = await http.put(
        url,
        // body: jsonEncode(reqestes),
      );

      // if (response.statusCode == 200) {
      //   return true;
      // } else {
      //   return false;
      //   // throw 'Error';
      // }
      return response;
    } catch (e) {
      throw 'Errorrrrr: $e ';
    }
  }
}
