import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

class Comment {
  final int postId;
  final int id;
  final String name;
  final String email;
  final String body;
  Comment(this.postId, this.id, this.name, this.email, this.body);
}

Comment comment;
  Future getComment(int postId) async {
    var data = await http.get(
        'https://jsonplaceholder.typicode.com/comments?postId=$postId');

    var jsonData = json.decode(data.body);

    List comments = [];

    for (var u in jsonData) {
      Comment comment =
          Comment(u["postId"], u["id"], u["name"], u["email"], u["body"]);
      comments.add(comment);
    }

    return comments;
  }
