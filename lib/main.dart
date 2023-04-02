import 'package:flutter/material.dart';
import 'package:flutter_application/screens/users_screen.dart';
import 'package:flutter_application/user_model.dart';
import 'api/api_service.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: "/",
      routes: {
        "/": (context) => const UsersScreen(title: "Flutter Demo Home Page"),
      },
    );
  }
}