import 'package:flutter/material.dart';
import 'package:flutter_application/screens/user_details_screen.dart';

import '../models/user_model.dart';

class UserCard extends StatelessWidget {
  const UserCard({Key? key, required this.index, required this.users}) : super(key: key);
  final int index;
  final List<UserModel>? users;

  @override
  Widget build(BuildContext context) {
    final String initials = users![index].name.substring(0, 2).toUpperCase();

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                CircleAvatar(
                  backgroundColor: Colors.blueAccent,
                  child: Text(initials),
                ),
                const SizedBox(
                  width: 20,
                ),
                Text(users![index].name),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
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
          ],
        ),
      ),
    );
  }
}
