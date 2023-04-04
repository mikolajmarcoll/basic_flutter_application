import 'package:flutter/material.dart';

import 'package:flutter_application/screens/test_screen.dart';
import 'package:flutter_application/user_model.dart';
import 'package:flutter_application/api/api_service.dart';
import 'package:flutter_application/widgets/toggle_view.dart';
import 'package:flutter_application/widgets/user_card.dart';

const List<Widget> fruits = <Widget>[
  Text('List'),
  Text('Grid'),
];

class UsersScreen extends StatefulWidget {
  const UsersScreen({super.key, required this.title});

  final String title; // TODO: remove it

  @override
  State<UsersScreen> createState() => _UsersScreenState();
}

class _UsersScreenState extends State<UsersScreen> {
  late List<UserModel>? _users = [];
  final List<bool> _selectedView = <bool>[true, false]; // list, grid

  @override
  void initState() {
    super.initState();
    _fetchUsers();
  }

  void _fetchUsers() async {
    final users = (await ApiService().getUsers())!;

    setState(() {
      _users = users;
    });
  }

  @override
  Widget build(BuildContext context) {
    handleToggle(int index) {
      setState(() {
        // The button that is tapped is set to true, and the others to false.
        for (int i = 0; i < _selectedView.length; i++) {
          _selectedView[i] = i == index;
        }
      });
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      // bottomNavigationBar: BottomNavigationBar, // TODO: add this!!!
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              // TODO: remove it later!
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const TestScreen(title: "test")),
                );
              },
              child: const Text("go to test "),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const Text(
                  "All users",
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                ToggleView(
                  onPressed: (index) => handleToggle(index),
                  isSelected: _selectedView,
                  children: fruits,
                ),
              ],
            ),
            const SizedBox(height: 20),
            _users == null || _users!.isEmpty
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : Container(
                    height: 500, // TODO: how to handle this properly
                    width: 500,
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: _users!.length,
                      itemBuilder: (context, index) {
                        return UserCard(index: index, users: _users);
                      },
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
