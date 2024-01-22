// import 'package:flutter/foundation.dart';

class PostItem {
  final int userId;
  final int id;
  final String title;
  final String body;

  PostItem({
    required this.userId,
    required this.id,
    required this.title,
    required this.body,
  });

  factory PostItem.fromJson(Map<String, dynamic> json) {
    return PostItem(
      userId: json['userId'] as int,
      id: json['id'] as int,
      title: json['title'] as String,
      body: json['body'] as String,
    );
  }
}
