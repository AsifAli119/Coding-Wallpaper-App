part of 'search_bloc.dart';

@immutable
abstract class SearchEvent {}

class SearchFetchData extends SearchEvent{
  String query;
  SearchFetchData({required this.query});
}
class SearchScrollEvent extends SearchEvent{
  String page;
  String query;
  SearchScrollEvent({required this.page, required this.query});
}

