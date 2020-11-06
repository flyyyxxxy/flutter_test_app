// To parse this JSON data, do
//
//     final commentModel = commentModelFromJson(jsonString);

import 'dart:convert';

CommentModel commentModelFromJson(String str) =>
    CommentModel.fromJson(json.decode(str));

String commentModelToJson(CommentModel data) => json.encode(data.toJson());

class CommentModel {
  CommentModel({
    this.name,
    this.email,
    this.body,
  });

  String name;
  String email;
  String body;

  factory CommentModel.fromJson(Map<String, dynamic> json) => CommentModel(
        name: json["name"],
        email: json["email"],
        body: json["body"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "email": email,
        "body": body,
      };
}
