import 'dart:convert';

List<CommentModel> commentModelFromJson(String str) =>
    List<CommentModel>.from(json.decode(str).map((x) => CommentModel.fromJson(x)));

String commentModelToJson(List<CommentModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CommentModel {
  CommentModel({
    required this.id,
    required this.postId,
    required this.name,
    required this.email,
    required this.body,
  });

  int id;
  int postId;
  String name;
  String email;
  String body;

  factory CommentModel.fromJson(Map<String, dynamic> json) => CommentModel(
    id: json["id"],
    postId: json["postId"],
    name: json["name"],
    email: json["email"],
    body: json["body"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "postId": postId,
    "name": name,
    "email": email,
    "body": body,
  };
}
