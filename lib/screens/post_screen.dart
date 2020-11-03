
import 'package:TestApp/data/post..dart';
import 'package:flutter/material.dart';

class PostScreen extends StatelessWidget {
  final String username;
  final Post post;
  PostScreen({Key key, this.username, this.post}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Все посты $username"),
        ),
        body: ListView(
          children: [
            Card(
              child: ListTile(
                title: Text(post.title),
                subtitle: Text(post.body),
              ),
            )
          ],
        ));
  }
}
