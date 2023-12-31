import 'package:flutter/material.dart';
import 'package:loaddash/login.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        debugShowCheckedModeBanner: false,
        // home: Home(id: 'Community', view: 'dash'),
        home: Login());
  }
}
