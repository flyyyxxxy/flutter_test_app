import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';


class Post {
  final int userId;
  final int id;
  final String title;
  final String body;

  Post(this.userId, this.id, this.title, this.body);
}

Post post;
  Future getPost(int userId) async {
    var data = await http.get(
        "https://jsonplaceholder.typicode.com/posts?userId=$userId");
    var jsonData = json.decode(data.body);
    List<Post> posts = [];

    for (var u in jsonData) {
      Post post = Post(u["userId"], u["id"], u["title"], u["body"]);
      posts.add(post);
    }
    return posts;
  }
