import 'dart:convert';
import 'package:flutter_application_1/Models/emer_item_modle.dart';
import 'package:http/http.dart' as http;

class CustomItemsRepo {
  Future<List<Emeritem>> getAllItems() async {
    try {
      final url = Uri.parse(
          "https://emergingideas.ae/test_apis/read.php?email=<mike.hsch@gmail.com>");

      var response = await http.get(url);

      List<Emeritem> emerItems = (json.decode(response.body))
          .map<Emeritem>((jsonTodo) => Emeritem.fromJson(jsonTodo))
          .toList();

      // print(emerItems[0].imageUrl);
      return emerItems;

      // else if (response.statusCode != 200) {}
    } catch (e) {
      rethrow;
    }
  }
}


//========================================================






// import 'dart:convert';
// import 'package:flutter_application_1/Models/emer_item_modle.dart';
// import 'package:http/http.dart' as http;

// class CustomItemsRepo {
//   // repo
//   Future<List<Emeritem>> getAllItems() async {
//     try {
//       print('starrrrrrrt');

//       const String url =
//           "https://emergingideas.ae/test_apis/read.php?email=mike.hsch@gmail.com";

//       var response = await http.get(Uri.parse(url));
//       print(response.statusCode.toString());

//       if (response.statusCode != 201) {
//         print('succccessss');
//         print(response.body);
//       } else if (response.statusCode != 200) {
//         print('api faiiiiil');
//       }

//       List<Emeritem> emerItems = (json.decode(response.body))
//           .map<Emeritem>((jsonTodo) => Emeritem.fromJson(jsonTodo))
//           .toList();
//       return emerItems;
//     } catch (e) {
//       rethrow;
//     }
//   }
// }
