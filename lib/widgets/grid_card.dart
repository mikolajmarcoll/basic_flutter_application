import 'package:flutter/material.dart';
import 'package:flutter_application/screens/user_details_screen.dart';

import '../models/user_model.dart';

class GridCard extends StatelessWidget {
  const GridCard({Key? key, required this.index, required this.users}) : super(key: key);
  final int index;
  final List<UserModel>? users;

  @override
  Widget build(BuildContext context) {
    final String initials = users![index].name.substring(0, 2).toUpperCase();

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 30,
              backgroundColor: Colors.blueAccent,
              child: Text(initials),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(users![index].name,style: const TextStyle(fontSize: 15,),),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => UserDetailScreen(
                      user: users![index],
                    ),
                  ),
                );
              },
              child: const Text("details"),
            ),
          ],
        ),
      ),
    );
  }
}
