import 'package:TestApp/screens/home_screen.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return HomeScreen(
      title: 'Список пользователей',
    );
  }
}
