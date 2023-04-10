import 'package:flutter/material.dart';
import 'package:flutter_application/models/gallery_model.dart';
import 'package:flutter_application/api/api_service.dart';

class GalleryScreen extends StatefulWidget {
  const GalleryScreen({super.key, required this.title});

  final String title; // TODO: remove it

  @override
  State<GalleryScreen> createState() => _GalleryScreenState();
}

class _GalleryScreenState extends State<GalleryScreen> {
  late List<GalleryModel>? _gallery = [];
  final int MAX_IMAGES = 10;

// TODO: download other images
  final List<String> imagesList = [
    "assets/images/nature.jpg",
    "assets/images/lake.jpg",
    // "assets/images/game.jpg",
    "assets/images/nature.jpg",
    "assets/images/vector.jpg",
    "assets/images/crypto.jpg",
    "assets/images/runner.jpg",
    "assets/images/nature.jpg",
    "assets/images/nature.jpg",
    "assets/images/nature.jpg",
    "assets/images/nature.jpg",
  ];

  @override
  void initState() {
    super.initState();
    _fetchImages();
  }

  void _fetchImages() async {
    final images = (await ApiService().getImages())!;

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
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 10, left: 10),
            child: Align(
              alignment: Alignment.topLeft,
              child: Text(
                "All images",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          _gallery == null || _gallery!.isEmpty
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : SingleChildScrollView(
                  child: SizedBox(
                    // TODO: handle height
                    height: 470,
                    child: GridView.builder(
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                      ),
                      shrinkWrap: true,
                      itemCount: MAX_IMAGES,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(bottom: 5),
                                child: Text(
                                  _gallery![index].title,
                                  overflow: TextOverflow.ellipsis,
                                  softWrap: true,
                                  style: const TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ),
                              Image.asset(imagesList[index]),
                            ],
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
