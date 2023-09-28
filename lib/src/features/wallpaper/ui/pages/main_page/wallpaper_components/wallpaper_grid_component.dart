import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wallpaper_app/src/features/wallpaper/model/category_model.dart';
import 'package:wallpaper_app/src/features/wallpaper/ui/pages/details_page/detail_page.dart';
import 'package:wallpaper_app/src/features/wallpaper/ui/pages/search_page/search_page.dart';
import 'package:wallpaper_app/src/repos/wallpaper_repo.dart';
import '../../../../bloc/main_bloc/wallpaper_bloc.dart';
import 'category_tile.dart';

class WallpaperGrid extends StatefulWidget {
  const WallpaperGrid({
    super.key,
    required this.sucessState,
  });

  final WallpaperFetchSuccessState sucessState;

  @override
  State<WallpaperGrid> createState() => _WallpaperGridState();
}

class _WallpaperGridState extends State<WallpaperGrid> {
  TextEditingController _searchController = TextEditingController();
  int nextPage = 1;
  WallpaperBloc wallpaperBloc = WallpaperBloc(postRepo: PostRepo());
  List<CategoryModel> category = [];

  @override
  void initState() {
    category = getCategory();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      const SizedBox(height: 8),
      Container(
        height: 80,
        child: ListView.builder(
            itemCount: category.length,
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return CategoryTile(
                widget: widget,
                categoryName: category[index].id!,
                img: category[index].img!,
              );
            }),
      ),
      Container(
        decoration: BoxDecoration(
          color: Color(0xffEEEEEE),
          borderRadius: BorderRadius.circular(30),
        ),
        margin: const EdgeInsets.symmetric(horizontal: 16),
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Row(
          children: [
            Expanded(
                child: TextField(
              controller: _searchController,
              decoration: const InputDecoration(
                hintText: "search wallpapers",
                border: InputBorder.none,
                hintStyle: TextStyle(color: Colors.black),
              ),
            )),
            InkWell(
                onTap: () {
                  if (_searchController.text != "") {
                    FocusScope.of(context).requestFocus(FocusNode());
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SearchPage(
                            query: _searchController.text,
                          ),
                        )).then((value) {
                      _searchController.clear();
                    });
                  }
                },
                child: const Icon(
                  Icons.search,
                  color: Colors.black,
                ))
          ],
        ),
      ),
      const SizedBox(
        height: 10,
      ),
      Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text("Developed by ", style: TextStyle(fontWeight: FontWeight.normal),),
          const Text("KashCoder ", style: TextStyle(fontWeight: FontWeight.bold),),
        ],
      ),
      const SizedBox(
        height: 10,
      ),
      Expanded(
          flex: 1,
          child: GridView.builder(
              itemCount: widget.sucessState.wallpapers.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisSpacing: 5,
                  crossAxisCount: 3,
                  childAspectRatio: 2 / 3,
                  mainAxisSpacing: 5),
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => DetailPage(
                                imgUrl: widget.sucessState.wallpapers[index].src
                                    .portrait)));
                  },
                  child: Container(
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        color: Colors.grey),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: CachedNetworkImage(
                        imageUrl: widget.sucessState.wallpapers[index].src.tiny,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                );
              })),
      InkWell(
        onTap: _loadmore,
        child: Container(
          decoration: const BoxDecoration(
            color: Colors.black,
          ),
          height: 70,
          width: double.infinity,
          child: const Center(
              child: Text(
            "Load More",
            style: TextStyle(
                color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
          )),
        ),
      )
    ]);
  }

  _loadmore() {
    setState(() {
      nextPage = nextPage + 1;
    });
    wallpaperBloc.add(WallpaperLoadMoreEvent(page: nextPage.toString()));
  }
}
