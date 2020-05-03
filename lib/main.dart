import 'package:flutter/material.dart';
import 'routes/loginRoute.dart';
import 'routes/homeRoute.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'GithubDemo',
      initialRoute: "/", //初始路由页
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: { //命名路由
        "home_page":(context) => MyHomePage(),
        "/":(context) => LoginRoute(),
      },
      //home: LoginRoute(),
    );
  }
}
