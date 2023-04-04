import 'package:flutter/material.dart';

import '../user_model.dart';

class UserDetailScreen extends StatefulWidget {
  const UserDetailScreen({Key? key, required this.user}) : super(key: key);

  final UserModel? user;

  @override
  State<UserDetailScreen> createState() => _UserDetailScreenState();
}

class _UserDetailScreenState extends State<UserDetailScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print(widget.user);
    return Scaffold(
      appBar: AppBar(
        title: Text("USER ID"),
      ),
      body: Text("details"),
    );
  }
}
