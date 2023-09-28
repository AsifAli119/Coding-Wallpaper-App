
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:wallpaper_app/src/features/wallpaper/bloc/detail_bloc/detial_bloc.dart';
import 'package:wallpaper_app/src/mappers/permisions.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({super.key, required this.imgUrl});

  final String imgUrl;

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  SavedImagesToGallery savedImagesToGallery = SavedImagesToGallery();
  DetialBloc _bloc = DetialBloc();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: CachedNetworkImage(
              imageUrl: widget.imgUrl,
              fit: BoxFit.cover,
            ),
          ),

          //----------------
          Container(
            padding: EdgeInsets.only(bottom: 60),
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            alignment: Alignment.bottomCenter,
            child: Stack(
              children: [
                Container(
                  padding: EdgeInsets.all(10),
                  width: MediaQuery.of(context).size.width * 0.5,
                  height: MediaQuery.of(context).size.height * 0.1,
                  decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.5),
                      borderRadius: BorderRadius.circular(20)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: (){
                          _bloc.add(SavedImageEvent(context: context, img: widget.imgUrl));
                           ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Image Saved!")));
                        },
                        child: Container(
                            child: const Text(
                          "Save Image",
                          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18),
                        )
                        ),
                      ),
                      const SizedBox(height: 10,),
                      GestureDetector(
                        onTap: (){
                          Navigator.pop(context);
                        },
                        child: Container(
                            child: Text(
                              "CANCEL",
                              style: TextStyle(color: Colors.white,),
                            )
                        ),
                      ),

                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
