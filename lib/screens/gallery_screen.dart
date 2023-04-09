import 'package:flutter/material.dart';
import 'package:flutter_application/models/user_model.dart';
import 'package:flutter_application/api/api_service.dart';

class GalleryScreen extends StatefulWidget {
  const GalleryScreen({super.key, required this.title});

  final String title; // TODO: remove it

  @override
  State<GalleryScreen> createState() => _GalleryScreenState();
}

class _GalleryScreenState extends State<GalleryScreen> {
  late List<UserModel>? _gallery = [];

  @override
  void initState() {
    super.initState();
    _fetchImages();
  }

  void _fetchImages() async {
    final images = (await ApiService().getUsers())!;

    setState(() {
      _gallery = images;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: const [Text("gallery")],
            ),
          ],
        ),
      ),
    );
  }
}
