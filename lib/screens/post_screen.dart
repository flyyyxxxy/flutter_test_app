import 'package:TestApp/data/post..dart';
import 'package:TestApp/screens/post_detail.dart';
import 'package:flutter/material.dart';

class PostScreen extends StatefulWidget {
  final String username;
  final int userId;
  PostScreen({Key key, this.username, this.userId}) : super(key: key);
  @override
  _PostScreenState createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Все посты ${widget.username}"),
      ),
      body: FutureBuilder(
        future: getPost(widget.userId),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.data == null) {
            return Container(
              child: Center(child: CircularProgressIndicator()),
            );
          } else {
            return ListView.builder(
              physics: BouncingScrollPhysics(),
              itemCount: snapshot.data.length,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  child: Card(
                    child: ListTile(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return PostDetailScreen(
                            postId: snapshot.data[index].id,
                            title: snapshot.data[index].title,
                            body: snapshot.data[index].body,
                          );
                        }));
                      },
                      title: Text(snapshot.data[index].title),
                      subtitle: Text(snapshot.data[index].body),
                    ),
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
