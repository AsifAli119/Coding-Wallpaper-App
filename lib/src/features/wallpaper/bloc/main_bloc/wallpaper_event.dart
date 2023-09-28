part of 'wallpaper_bloc.dart';

@immutable
abstract class WallpaperEvent {}


class WallpaperInitialFetchEvent extends WallpaperEvent{
}
class WallpaperLoadMoreEvent extends WallpaperEvent{
  String? page;
  WallpaperLoadMoreEvent({required this.page});
  // final pagenumber;
  // WallpaperLoadMoreEvent({required this.pagenumber});
}


