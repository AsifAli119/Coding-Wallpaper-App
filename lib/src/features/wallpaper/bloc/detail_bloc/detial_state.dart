part of 'detial_bloc.dart';

@immutable
abstract class DetialState {}
abstract class DetialActionState extends DetialState{}

class DetialInitial extends DetialState {}
class IsSavedImageState extends DetialActionState{
  SavedImagesToGallery savedImagesToGallery;
  IsSavedImageState({required this.savedImagesToGallery});
}