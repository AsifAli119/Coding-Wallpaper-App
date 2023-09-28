part of 'wallpaper_bloc.dart';

@immutable
abstract class WallpaperState {}
abstract class WallpaperActionState extends WallpaperState{}
class WallpaperInitial extends WallpaperState {}

class WallpaperFetchSuccessState extends WallpaperState{
  final List<Photo> wallpapers;
  WallpaperFetchSuccessState({required this.wallpapers});
}

class WallpaperLoadingState extends WallpaperState{}
class WallpaperErrorState extends WallpaperState{}
