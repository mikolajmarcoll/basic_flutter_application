import 'dart:convert';

List<GalleryModal> galleryModelFromJson(String str) =>
    List<GalleryModal>.from(json.decode(str).map((x) => GalleryModal.fromJson(x)));

String galleryModelToJson(List<GalleryModal> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class GalleryModal {
  GalleryModal({
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

  factory GalleryModal.fromJson(Map<String, dynamic> json) => GalleryModal(
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
