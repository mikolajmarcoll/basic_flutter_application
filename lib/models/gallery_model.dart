import 'dart:convert';

List<GalleryModel> galleryModelFromJson(String str) =>
    List<GalleryModel>.from(json.decode(str).map((x) => GalleryModel.fromJson(x)));

String galleryModelToJson(List<GalleryModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class GalleryModel {
  GalleryModel({
    required this.id,
    required this.albumId,
    required this.title,
    required this.url,
    required this.thumbnailUrl,
  });

  int id;
  int albumId;
  String title;
  String url;
  String thumbnailUrl;

  factory GalleryModel.fromJson(Map<String, dynamic> json) => GalleryModel(
        id: json["id"],
        albumId: json["albumId"],
        title: json["title"],
        url: json["url"],
        thumbnailUrl: json["thumbnailUrl"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "albumId": albumId,
        "title": title,
        "url": url,
        "thumbnailUrl": thumbnailUrl,
      };
}
