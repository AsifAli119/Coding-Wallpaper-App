import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:connectivity/connectivity.dart';
import 'package:meta/meta.dart';
import 'package:wallpaper_app/src/features/wallpaper/model/wallpaper_ui_model_ui.dart';
import 'package:wallpaper_app/src/repos/wallpaper_repo.dart';
part 'wallpaper_event.dart';
part 'wallpaper_state.dart';
List<Photo> addedWallpapers = [];
class WallpaperBloc extends Bloc<WallpaperEvent, WallpaperState> {
  int currentPageNo = 1;
  WallpaperBloc({required PostRepo postRepo}) : super(WallpaperInitial()) {
    on<WallpaperInitialFetchEvent>(wallpaperInitialFetchEvent);
    on<WallpaperLoadMoreEvent>(wallpaperLoadMoreEvent);
  }

  FutureOr<void> wallpaperInitialFetchEvent(WallpaperInitialFetchEvent event,
      Emitter<WallpaperState> emit) async {
    var connectivityResult = await Connectivity().checkConnectivity();
    if (connectivityResult == ConnectivityResult.none) {
      emit(WallpaperLoadingState());
      await Future.delayed(const Duration(seconds: 2));
      emit(WallpaperErrorState()); // No network connection
      return;
    }
    emit(WallpaperLoadingState());
    List<Photo> wallpapers = await PostRepo.fetchWallpaper(currentPageNo.toString());
    addedWallpapers.addAll(wallpapers);
    emit(WallpaperFetchSuccessState(wallpapers: addedWallpapers));
    print(addedWallpapers.length);
  }

  FutureOr<void> wallpaperLoadMoreEvent(WallpaperLoadMoreEvent event,
      Emitter<WallpaperState> emit) async {
    List<Photo> newWallpapers = await PostRepo.fetchWallpaper(event.page!);
    addedWallpapers.addAll(newWallpapers);
    print(addedWallpapers.length);
    emit(WallpaperFetchSuccessState(wallpapers: addedWallpapers));
  }
}

