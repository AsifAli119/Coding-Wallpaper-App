import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter/material.dart';
import 'package:wallpaper_app/src/features/wallpaper/bloc/main_bloc/wallpaper_bloc.dart';
import 'package:wallpaper_app/src/features/wallpaper/ui/pages/main_page/wallpaper_components/wallpaper_grid_component.dart';
import 'package:wallpaper_app/src/features/wallpaper/ui/pages/main_page/wallpaper_components/wallpaper_loading.dart';
import 'package:wallpaper_app/src/repos/wallpaper_repo.dart';

class Wallpaper extends StatefulWidget {
  @override
  State<Wallpaper> createState() => _WallpaperState();
}

class _WallpaperState extends State<Wallpaper> {
  WallpaperBloc wallpaperBloc = WallpaperBloc(postRepo: PostRepo());

  @override
  void initState() {
    super.initState();
    wallpaperBloc.add(WallpaperInitialFetchEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold (
        appBar:AppBar (
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Wallpaper", style: TextStyle(color: Colors.black),),
            Text("Hub", style: TextStyle(color: Colors.blue),),
          ],
        ),

        elevation: 0.0,
        backgroundColor: Colors.transparent,
      ),
      backgroundColor: Colors.white,
        body: BlocConsumer<WallpaperBloc, WallpaperState>(
      bloc: wallpaperBloc,
      listenWhen: (previous, current) => current is WallpaperActionState,
      buildWhen: (previous, current) => current is! WallpaperActionState,
      listener: (context, state) {},
      builder: (context, state) {
        switch (state.runtimeType) {
          case WallpaperLoadingState:
            return Center(child: DoubleCircularProgressIndicator());

          case WallpaperFetchSuccessState:
            final sucessState = state as WallpaperFetchSuccessState;
            return WallpaperGrid(
              sucessState: sucessState,
            );

          case WallpaperErrorState:
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Center(
                  child: Text("Error Loading wallpapers...!", style: TextStyle(color: Colors.black)),
                ),
                const Center(
                  child: Text("Check your network connection and try Again", style: TextStyle(color: Colors.black)),
                ),
                ElevatedButton(
                    onPressed: () {
                      wallpaperBloc.add(WallpaperInitialFetchEvent());
                    },
                    child: const Text("Try Again", style: TextStyle(color: Colors.black),)),
              ],
            );
        }
        return Container();
      },
    ));
  }
}
