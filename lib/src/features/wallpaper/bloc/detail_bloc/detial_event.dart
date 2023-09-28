part of 'detial_bloc.dart';

@immutable
abstract class DetialEvent {}
class SavedImageEvent extends DetialEvent{
  BuildContext context;
  String img;
  SavedImageEvent({required this.context, required this.img});
}
