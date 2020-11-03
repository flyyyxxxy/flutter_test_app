import 'package:TestApp/data/user.dart';
import 'package:TestApp/widgets/cardUssers.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  User user;
  Future<List<User>> _getUsers() async {
    var data = await http.get("https://jsonplaceholder.typicode.com/users");

    var jsonData = json.decode(data.body);

    List<User> users = [];

    for (var u in jsonData) {
      User user = User(
          u["id"],
          u["username"],
          u["name"],
          u["email"],
          u["phone"],
          u["website"],
          u["address"]["city"],
          u["address"]["street"],
          u["company"]["name"],
          u["company"]["bs"],
          u["company"]["catchPhrase"]);
      users.add(user);
    }

    return users;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('${widget.title}'),
        ),
        body: Container(
          child: FutureBuilder(
            future: _getUsers(),
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
                    return CardUssers(
                      user: snapshot.data[index],
                    );
                  },
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
