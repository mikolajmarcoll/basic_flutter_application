import 'package:flutter/material.dart';

import 'package:flutter_application/screens/user_details_screen.dart';
import 'package:flutter_application/models/user_model.dart';

class UserCard extends StatelessWidget {
  const UserCard({Key? key, required int index, required List<UserModel>? users})
      : _index = index,
        _users = users,
        super(key: key);
  final int _index;
  final List<UserModel>? _users;

  @override
  Widget build(BuildContext context) {
    final String initials = _users![_index].name.substring(0, 2).toUpperCase();

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
                Text(_users![_index].name),
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
                          user: _users![_index],
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
