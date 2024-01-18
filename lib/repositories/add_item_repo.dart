import 'dart:convert';

import 'package:flutter_application_1/Models/emer_item_modle.dart';
import 'package:http/http.dart' as http;

Future postItem(

    // String title

    ) async {
  Map<String, String> reqestes = {
    "title": "tessst",
    "email": "email=mike.hsch@gmail.com",
    "description":
        "this is just a test from Hummam Mohamed Hamza Ali,this is just a test from Hummam Mohamed Hamza Ali,this is just a test from Hummam Mohamed Hamza Ali",
    "img_link": "new tesst"
  };

  final urlll = Uri.parse(
    'https://emergingideas.ae/test_apis/create.php',

    // 'https://jsonplaceholder.typicode.com/albums',
  );

  final response = await http.post(urlll, body: reqestes);

  try {
    //   Future post = http.post(
    //     Uri.parse(
    //       'https://emergingideas.ae/test_apis/create.php',

    //       // 'https://jsonplaceholder.typicode.com/albums',
    //     ),
    //     // headers: <String, String>{
    //     //   // 'Content-Type': 'application/json; charset=UTF-8',
    //     //   "email": "email=mike.hsch@gmail.com",
    //     //   "description":
    //     //       "this is just a test from Hummam Mohamed Hamza Ali,this is just a test from Hummam Mohamed Hamza Ali,this is just a test from Hummam Mohamed Hamza Ali",
    //     //   "title": "new tesst",
    //     //   "img_link": "new tesst"
    //     // },
    // //     body: jsonEncode(<String, String>{
    // //       "title": "tessst",
    // // "email": "email=mike.hsch@gmail.com",
    // //       "description":
    // //           "this is just a test from Hummam Mohamed Hamza Ali,this is just a test from Hummam Mohamed Hamza Ali,this is just a test from Hummam Mohamed Hamza Ali",
    // //       "img_link": "new tesst"

    // //     }),

    //   );

    if (response.statusCode == 201) {
      print('succccessss pooostttt ');
      // print(post.);

      return Emeritem.fromJson(jsonDecode(response.body));

      //
      //
    } else {
      // print('errrrrororororor');
      throw 'Error';
    }
  } catch (e) {
    // print(e);
    throw 'Error';
  }
}
