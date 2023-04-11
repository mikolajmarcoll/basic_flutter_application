import 'package:flutter/material.dart';
import 'package:flutter_application/models/comments_model.dart';
import 'package:flutter_application/models/user_model.dart';
import 'package:flutter_application/api/api_service.dart';

class CommentsScreen extends StatefulWidget {
  const CommentsScreen({super.key, required this.title});

  final String title; // TODO: remove it

  @override
  State<CommentsScreen> createState() => _CommentsScreenState();
}

class _CommentsScreenState extends State<CommentsScreen> {
  late List<CommentModel>? _comments = [];

  @override
  void initState() {
    super.initState();
    _fetchUsers();
  }

  void _fetchUsers() async {
    final comments = (await ApiService().getComments())!;

    setState(() {
      _comments = comments;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 10, left: 10),
            child: Align(
              alignment: Alignment.topLeft,
              child: Text(
                "All comments",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          _comments == null || _comments!.isEmpty
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : SingleChildScrollView(
                  child: SizedBox(
                    // TODO: handle height
                    height: 470,
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Center(
                            child: Card(
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  const ListTile(
                                    leading: Icon(Icons.album),
                                    title: Text('The Enchanted Nightingale'),
                                    subtitle: Text('Music by Julie Gable. Lyrics by Sidney Stein.'),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
        ],
      ),
    );
  }
}
