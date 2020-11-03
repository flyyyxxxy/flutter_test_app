import 'package:TestApp/data/user.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class InformationUser extends StatelessWidget {
  final User user;
  InformationUser({Key key, this.user}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
                child: Text(' ${user.name}',
                    style:
                        TextStyle(fontSize: 40, color: Colors.indigoAccent))),
            Divider(),
            Text(
              'Email :',
              style: TextStyle(color: Colors.grey),
            ),
            Text(' ${user.email}',
                style: TextStyle(
                    fontSize: 20,
                    fontStyle: FontStyle.italic,
                    color: Colors.brown)),
            Divider(),
            Text('Телефон :', style: TextStyle(color: Colors.grey)),
            Text(' ${user.phone}',
                style: TextStyle(
                    fontSize: 20,
                    fontStyle: FontStyle.italic,
                    color: Colors.brown)),
            Divider(),
            Text('Web-site :', style: TextStyle(color: Colors.grey)),
            Text(' ${user.website}',
                style: TextStyle(fontSize: 20, color: Colors.brown)),
            Divider(),
            Text('Компания :', style: TextStyle(color: Colors.grey)),
            Text(' ${user.companyName}',
                style: TextStyle(fontSize: 20, color: Colors.brown)),
            Divider(),
            Text('BS :', style: TextStyle(color: Colors.grey)),
            Text(' ${user.companyBs}',
                style: TextStyle(fontSize: 20, color: Colors.brown)),
            Divider(),
            Text('Цитата : ', style: TextStyle(color: Colors.grey)),
            Text(' ${user.catchPhrase}',
                style: TextStyle(fontSize: 20, color: Colors.brown)),
            Divider(),
            Text('Адресс :', style: TextStyle(color: Colors.grey)),
            Text(' Город  ${user.city} ул. ${user.street}',
                style: TextStyle(fontSize: 20, color: Colors.brown)),
            Divider()
          ],
        ),
      ),
    );
  }
}
