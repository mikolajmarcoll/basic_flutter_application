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
      body: _gallery == null || _gallery!.isEmpty
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : SingleChildScrollView(
              child: SizedBox(
                // TODO: handle height
                height: 500,
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                  ),
                  shrinkWrap: true,
                  itemCount: MAX_IMAGES,
                  itemBuilder: (context, index) {
                    return Container(
                      child: Image.network(_gallery![index].thumbnailUrl),
                    );
                  },
                ),
              ),
            ),
    );
  }
}
