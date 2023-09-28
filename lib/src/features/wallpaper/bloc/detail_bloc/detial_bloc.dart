import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';
import 'package:wallpaper_app/src/mappers/permisions.dart';

part 'detial_event.dart';
part 'detial_state.dart';
SavedImagesToGallery savedImagesToGallery = SavedImagesToGallery();
class DetialBloc extends Bloc<DetialEvent, DetialState> {
  DetialBloc() : super(DetialInitial()) {
    on<SavedImageEvent>(savedImageEvent);
  }

  FutureOr<void> savedImageEvent(SavedImageEvent event, Emitter<DetialState> emit) async{
    try{
      var data = await savedImagesToGallery.saveImage(event.context, event.img);
      emit(data);
    }catch (e){
      print("print error: $e");
    }
  }
}
