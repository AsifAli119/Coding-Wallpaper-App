import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wallpaper_app/src/features/wallpaper/bloc/main_bloc/wallpaper_bloc.dart';
import 'package:wallpaper_app/src/features/wallpaper/bloc/search_bloc/search_bloc.dart';
import 'package:wallpaper_app/src/features/wallpaper/ui/pages/main_page/Wallpaper.dart';
import 'package:wallpaper_app/src/repos/category_repos.dart';
import 'package:wallpaper_app/src/repos/wallpaper_repo.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<SearchBloc>(
          create: (context) => SearchBloc(categoryRepo: CategoryRepo()),
        ),
        BlocProvider<WallpaperBloc>(
          create: (context) => WallpaperBloc(postRepo: PostRepo()),
          child: Wallpaper(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Wallpaper App',
        home: Wallpaper(),
      ),
    );
  }
}
