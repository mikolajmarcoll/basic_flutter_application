import 'package:flutter/material.dart';

import 'package:flutter_application/widgets/text_field.dart';
import 'package:flutter_application/models/user_model.dart';

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
    final user = widget.user?.toJson();
    final initials = user!["name"]?.toString().substring(0, 2).toUpperCase();

    List<Map<String, dynamic>> fieldsList = [
      {"icon": Icons.verified_rounded, "text": user["name"]},
      {"icon": Icons.mail, "text": user["email"]},
      {"icon": Icons.location_city, "text": user["address"]["city"]},
      {"icon": Icons.phone, "text": user["phone"]},
      {"icon": Icons.web, "text": user["website"]},
      {"icon": Icons.view_compact_alt_sharp, "text": user["company"]["name"]}
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text(user["name"]),
      ),
      bottomNavigationBar: null,
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
            child: CircleAvatar(
              radius: 40,
              backgroundColor: Colors.blueAccent,
              child: Text(
                initials!,
                style: const TextStyle(fontSize: 30),
              ),
            ),
          ),
          ...List.generate(
            fieldsList.length,
            (index) => CustomTextField(
              icon: fieldsList[index]["icon"],
              text: fieldsList[index]["text"],
            ),
          ),
        ],
      ),
    );
  }
}
