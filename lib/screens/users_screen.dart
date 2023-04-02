import 'package:flutter/material.dart';
import 'package:flutter_application/user_model.dart';
import 'package:flutter_application/api/api_service.dart';

class UsersScreen extends StatefulWidget {
  const UsersScreen({super.key, required this.title});

  final String title;

  @override
  State<UsersScreen> createState() => _UsersScreenState();
}

class _UsersScreenState extends State<UsersScreen> {
  late List<UserModel>? _users = [];

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
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      // bottomNavigationBar: BottomNavigationBar, // TODO: add this!!!
      body: _users == null || _users!.isEmpty
          ? const Center(
        child: CircularProgressIndicator(),
      )
          : ListView.builder(
        itemCount: _users!.length,
        itemBuilder: (context, index) {
          return Card(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [Text(_users![index].id.toString()), Text(_users![index].username)],
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [Text(_users![index].email), Text(_users![index].website)],
                )
              ],
            ),
          );
        },
      ),

    );
  }
}
