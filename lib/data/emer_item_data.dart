// To parse this JSON data, do
//
//     final emeritem = emeritemFromJson(jsonString);

import 'dart:convert';

List<Emeritem> emeritemFromJson(String str) =>
    List<Emeritem>.from(json.decode(str).map((x) => Emeritem.fromJson(x)));

String emeritemToJson(List<Emeritem> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Emeritem {
  int id;
  String title;
  String description;
  String imgLink;
  String? email;

  Emeritem({
    required this.id,
    required this.title,
    required this.description,
    required this.imgLink,
    required this.email,
  });

  factory Emeritem.fromJson(Map<String, dynamic> json) => Emeritem(
        id: json["id"],
        title: json["title"],
        description: json["description"],
        imgLink: json["img_link"],
        email: json["email"],
      );

  get imageUrl => null;

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "description": description,
        "img_link": imgLink,
        "email": email,
      };
}
