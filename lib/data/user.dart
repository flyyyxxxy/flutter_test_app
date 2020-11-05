import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

class User {
  final int id;
  final String username;
  final String name;
  final String email;
  final String phone;
  final String website;
  final String city;
  final String street;
  final String companyName;
  final String companyBs;
  final String catchPhrase;

  User(this.id, this.username, this.name, this.email, this.phone, this.website, this.city, this.street, this.companyName,this.companyBs, this.catchPhrase);
}

User user;
  Future<List<User>> getUsers() async {
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