import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../../repos/category_repos.dart';
import '../../model/wallpaper_ui_model_ui.dart';

part 'search_event.dart';
part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  CategoryRepo categoryRepo = CategoryRepo();
  SearchBloc({required categoryRepo}) : super(SearchInitial()) {
   on<SearchFetchData>(searchFetchData);
   on<SearchScrollEvent>(searchScrollEvent);
}


  FutureOr<void> searchFetchData(SearchFetchData event, Emitter<SearchState> emit) async{
    emit(SearchLoadingState());
    try{
      List<Photo> data = await categoryRepo.getData(event.query, '30');
      emit(SearchLoadedState(list: data));
    }catch (e){
      print("print error: $e");
      emit(SearchErrorState(message: e.toString()));
    }
  }

  FutureOr<void> searchScrollEvent(SearchScrollEvent event, Emitter<SearchState> emit) async{
    try{
      List<Photo> data = await categoryRepo.getData(event.query, event.page);
      print("called");
      emit(SearchLoadedState(list: data));
    }
    catch (e){
      print("print error: $e");
      emit(SearchErrorState(message: e.toString()));
    }
  }
}


