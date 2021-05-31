import 'package:flutter/material.dart';
import 'package:newsappproject/helper/data.dart';
import 'package:newsappproject/views/form.dart';
import 'package:newsappproject/views/home.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      title:'News App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.green[600],
      ),
      home: Home(),
    );
  }
}
