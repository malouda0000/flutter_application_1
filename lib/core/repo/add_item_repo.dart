import 'dart:convert';

import 'package:http/http.dart' as http;

Future postItem(

    // String title

    ) async {
  try {
    Future post = http.post(
      Uri.parse(
        'https://emergingideas.ae/test_apis/create.php',

        // 'https://jsonplaceholder.typicode.com/albums',
      ),
      headers: <String, String>{
        // 'Content-Type': 'application/json; charset=UTF-8',
        "email": "email=mike.hsch@gmail.com",
        "description":
            "this is just a test from Hummam Mohamed Hamza Ali,this is just a test from Hummam Mohamed Hamza Ali,this is just a test from Hummam Mohamed Hamza Ali",
        "title": "new tesst",
        "img_link": "new tesst"
      },
      body: jsonEncode(<String, String>{
        "title": "tessst",
      }),
    );
    if (post != null) {
      print('succccessss');
      // print(post.);

      return post;
    } else {
      print('errrrrororororor');
      throw 'Error';
    }
  } catch (e) {
    print(e);
    throw 'Error';
  }
}
