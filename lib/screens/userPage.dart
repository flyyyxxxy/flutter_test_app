import 'package:TestApp/data/user.dart';
import 'package:TestApp/widgets/informationUser.dart';
import 'package:TestApp/widgets/post_preview.dart';
import 'package:flutter/material.dart';

class UserPage extends StatefulWidget {
  final User user;
  UserPage({Key key, this.user}) : super(key: key);

  @override
  _UserPageState createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.user.username),
        ),
        body: ListView(
          physics: BouncingScrollPhysics(),
          children: [
            
            InformationUser(
              user: widget.user,
            ),
            PostPreview(userId: widget.user.id, username: widget.user.username),
            
          ],
        ));
  }
}
