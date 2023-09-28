import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:wallpaper_app/src/features/wallpaper/ui/pages/main_page/wallpaper_components/wallpaper_grid_component.dart';


class CategoryTile extends StatelessWidget {
  const CategoryTile({
  super.key,
  required this.categoryName,
    required this.widget,
  required this.img,
  });
  final String categoryName;
  final WallpaperGrid widget;
  final String img;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      margin: const EdgeInsets. only(bottom: 6),
      height: 80,
      child:  Container(
              margin: const EdgeInsets.only(right: 8, top: 8),
              child: Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: CachedNetworkImage(
                      imageUrl: img,
                      width: 120,
                      height: 80,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Container(
                    alignment: Alignment.center,
                    width: 120,
                    height: 80,
                    decoration: BoxDecoration(
                        color: Colors.black26,
                        borderRadius: BorderRadius.circular(20)),
                    child: Text(
                      categoryName,
                      style: const TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                          fontWeight: FontWeight.w500),
                    ),
                  )
                ],
              )
            ));
  }
}
