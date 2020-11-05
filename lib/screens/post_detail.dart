import 'package:flutter/material.dart';

import 'package:TestApp/data/comment.dart';

class PostDetailScreen extends StatefulWidget {
  final String title;
  final String body;
  final int postId;
  PostDetailScreen({Key key, this.title, this.body, this.postId})
      : super(key: key);
  @override
  _PostDetailScreenState createState() => _PostDetailScreenState();
}

class _PostDetailScreenState extends State<PostDetailScreen> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: FutureBuilder(
          future: getComment(widget.postId),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.data == null) {
              return Container(
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              );
            } else {
              return ListView.builder(
                physics: BouncingScrollPhysics(),
                itemCount: snapshot.data.length,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    child: Card(
                      child: ListTile(
                        title: Text(snapshot.data[index].email),
                        subtitle: Text(snapshot.data[index].body),
                      ),
                    ),
                  );
                },
              );
            }
          }),
    );
  }
}
