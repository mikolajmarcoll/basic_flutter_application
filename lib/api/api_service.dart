import 'dart:developer';

import 'package:flutter_application/models/gallery_model.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_application/models/user_model.dart';
import 'package:flutter_application/api/api.dart';

class ApiService {
  Future<List<UserModel>?> getUsers() async {
    try {
      final url = Uri.parse(Api.baseUrl + Api.usersEndpoint);
      final response = await http.get(url);
      if (response.statusCode == 200) {
        List<UserModel> users = userModelFromJson(response.body);
        return users;
      }
    } catch (e) {
      log(e.toString());
    }
    return null;
  }

  Future<List<GalleryModel>?> getImages() async {
    try {
      final url = Uri.parse(Api.baseUrl + Api.imagesEndpoint);
      final response = await http.get(url);
      print(response);
      if (response.statusCode == 200) {
        List<GalleryModel> images = galleryModelFromJson(response.body);
        return images;
      }
    } catch (e) {
      log(e.toString());
    }
    return null;
  }

}
