import 'package:TestApp/data/post..dart';
import 'package:TestApp/screens/post_screen.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

class PostPreview extends StatefulWidget {
  PostPreview({Key key, this.userId, this.username}) : super(key: key);
  final int userId;
  final String username;
  @override
  _PostPreviewState createState() => _PostPreviewState();
}

class _PostPreviewState extends State<PostPreview> {
  Post post;
  Future _getPost() async {
    var data = await http.get(
        "https://jsonplaceholder.typicode.com/posts?userId=${widget.userId}");
    var jsonData = json.decode(data.body);
    List<Post> posts = [];

    for (var u in jsonData) {
      Post post = Post(u["userId"], u["id"], u["title"], u["body"]);
      posts.add(post);
    }
    return posts;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        FutureBuilder(
            future: _getPost(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.data == null) {
                return Container(
                  child: Center(
                      child: CircularProgressIndicator(
                    backgroundColor: Colors.red,
                  )),
                );
              } else {
                return Column(
                  children: [
                    Card(
                      child: ListTile(
                        title: Text('${snapshot.data[1].title}',
                            style: TextStyle(
                                fontSize: 30, fontWeight: FontWeight.w300)),
                        subtitle: Padding(
                          padding: const EdgeInsets.only(top: 20, bottom: 10),
                          child: Text(
                            '${snapshot.data[1].body}',
                            overflow: TextOverflow.ellipsis,
                            style:
                                TextStyle(color: Colors.blueGrey, fontSize: 15),
                          ),
                        ),
                      ),
                    ),
                    Card(
                      child: ListTile(
                        title: Text('${snapshot.data[2].title}',
                            style: TextStyle(
                                fontSize: 30, fontWeight: FontWeight.w300)),
                        subtitle: Padding(
                          padding: const EdgeInsets.only(top: 20, bottom: 10),
                          child: Text('${snapshot.data[2].body}',
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  color: Colors.blueGrey, fontSize: 15)),
                        ),
                      ),
                    ),
                    Card(
                      child: ListTile(
                        title: Text('${snapshot.data[3].title}',
                            style: TextStyle(
                                fontSize: 30, fontWeight: FontWeight.w300)),
                        subtitle: Padding(
                          padding: const EdgeInsets.only(top: 20, bottom: 10),
                          child: Text('${snapshot.data[3].body}',
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  color: Colors.blueGrey, fontSize: 15)),
                        ),
                      ),
                    ),
                    RaisedButton(
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return PostScreen(
                            username: widget.username,
                            post: snapshot.data[1],
                          );
                        }));
                      },
                      textColor: Colors.white,
                      padding: EdgeInsets.all(0.0),
                      child: Container(
                        decoration: BoxDecoration(
                            gradient: LinearGradient(colors: [
                          Color(0xFF0D47A1),
                          Color(0xFF1976D2),
                          Color(0xFF42A5F5)
                        ])),
                        padding: EdgeInsets.only(
                            left: 70, right: 70, top: 10, bottom: 10),
                        child: Text('Посмотреть все посты пользователя'),
                      ),
                    )
                  ],
                );
              }
            })
      ],
    );
  }
}
