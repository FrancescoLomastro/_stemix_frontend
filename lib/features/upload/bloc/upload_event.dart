part of 'upload_bloc.dart';

abstract class UploadEvent {}

class PickFileEvent extends UploadEvent {}

class TitleChangedEvent extends UploadEvent {
  final String title;
  TitleChangedEvent(this.title);
}

class ArtistChangedEvent extends UploadEvent {
  final String artist;
  ArtistChangedEvent(this.artist);
}

class SubmitUploadEvent extends UploadEvent {}

class ResetUploadEvent extends UploadEvent {}

class ErrorOccurredEvent extends UploadEvent {
  final String message;
  ErrorOccurredEvent(this.message);
}
