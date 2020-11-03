import 'package:TestApp/data/user.dart';
import 'package:TestApp/screens/userPage.dart';
import 'package:flutter/material.dart';

class CardUssers extends StatelessWidget {
  final User user;
  CardUssers({Key key, this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          ListTile(
            leading: Icon(Icons.account_circle),
            title: Text('${user.username}'),
            subtitle: Text('${user.name}'),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return UserPage(user: user);
              }));
            },
          ),
        ],
      ),
    );
  }
}
