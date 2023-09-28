part of 'search_bloc.dart';

@immutable
abstract class SearchState {}

class SearchInitial extends SearchState {}
class SearchLoadingState extends SearchState{
}
class SearchLoadedState extends SearchState{
  List<Photo> list;
  SearchLoadedState({required this.list});
}

class SearchErrorState extends SearchState{
  String message;
  SearchErrorState({required this.message});
}