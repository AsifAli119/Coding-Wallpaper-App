import 'dart:convert';
import 'dart:math';

import 'package:wallpaper_app/src/features/wallpaper/bloc/main_bloc/wallpaper_bloc.dart';
import 'package:wallpaper_app/src/features/wallpaper/model/wallpaper_ui_model_ui.dart';
import 'package:http/http.dart' as http;
class PostRepo {
  static Future<List<Photo>> fetchWallpaper(String page) async {
    List<Photo> wallpapers = [];
    try {
      var response = await http.get(
        Uri.parse('https://api.pexels.com/v1/curated?page=$page&per_page=30'),
        headers: {
          'Authorization': 'YOUR-API-KEY'
        },
      );
      if (response.statusCode == 200) {
        final jsonData = json.decode(response.body);
        final List<dynamic> photoData = jsonData['photos'];
        for (int i = 0; i < photoData.length; i++) {
          final photo = Photo.fromJson(photoData[i]);
          wallpapers.add(photo);
        }
      }
    }
    catch (e) {
      print(e);
    }
    return wallpapers;
  }
}
