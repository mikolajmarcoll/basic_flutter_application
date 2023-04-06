import 'package:flutter/material.dart';
import 'package:flutter_application/widgets/text_field.dart';

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

  // I/flutter ( 2021): {id: 1, name: Leanne Graham, username: Bret, email: Sincere@april.biz, phone: 1-770-736-8031 x56442, website: hildegard.org, company: {name: Romaguera-Crona, catchPhrase: Multi-layered client-server neural-net, bs: harness real-time e-markets}}

  @override
  Widget build(BuildContext context) {
    final user = widget.user?.toJson();
    final initials = user!["name"]?.toString().substring(0, 2).toUpperCase();

    return Scaffold(
      appBar: AppBar(
        title: Text(user["name"]),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
            child: CircleAvatar(
              radius: 40,
              backgroundColor: Colors.blueAccent,
              child: Text(initials!,style: const TextStyle(fontSize: 30),),
            ),
          ),
          CustomTextField(icon: Icons.verified_rounded, text: user!["name"]),
          CustomTextField(icon: Icons.mail, text: user["email"]),
          CustomTextField(icon: Icons.location_city, text: user["address"]["city"]),
          CustomTextField(icon: Icons.phone, text: user["phone"]),
          CustomTextField(icon: Icons.web, text: user["website"]),
          CustomTextField(icon: Icons.view_compact_alt_sharp, text: user["company"]["name"])
        ],
      ),
    );
  }
}
