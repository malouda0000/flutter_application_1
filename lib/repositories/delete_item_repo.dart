// import 'dart:convert';
// import 'dart:io';

import 'package:flutter_application_1/core/constants/app_api_links.dart';
import 'package:http/http.dart' as http;

class DeletItemRepository {
  Future<http.Response> deletItemRepository({
    required final String userEmail,
    required final String itemId,
  }) async {
    Map<String, dynamic> parametres = {
      "email": userEmail,
      "id": itemId,
    };

    final url = Uri.parse(
      "${AppApiLinks.mainTestApi}${AppApiLinks.deleteEndPoint}?email=${parametres['email']}&id=${parametres['id']}",
    );

    try {
      final deletResponse = await http.delete(
        url,
        // headers:reqestes,
        // body: jsonEncode(parametres),
      );

      // if (deletResponse.statusCode == 200) {
      //   // return Future.error("error: status code ${deletResponse.statusCode}");
      //   return true;
      // } else {
      //   return false;
      // }

      return deletResponse;
    } catch (e) {
      // print(e);
      throw 'Errorrr in deleting the item: $e';
    }
  }
}
