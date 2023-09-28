import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:wallpaper_app/src/features/wallpaper/model/wallpaper_ui_model_ui.dart';

class CategoryRepo {
  Future<List<Photo>> getData(String query, String page) async {
    List<Photo> searchedPhotos = [];
    String categoryUrl = 'https://api.pexels.com/v1/search?query=';
    String _url = categoryUrl + '$query&per_page=$page';
    print(_url);
    var response = await http.get(
      Uri.parse(_url),
      headers: {
        'Authorization': 'API-KEY'
      },
    );
    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      final List<dynamic> photoData = jsonData['photos'];
      for (int i = 0; i < photoData.length; i++) {
        final photo = Photo.fromJson(photoData[i]);
        searchedPhotos.add(photo);
      }
    }
    return searchedPhotos;
  }
}
