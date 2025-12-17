part of 'library_bloc.dart';

class LibraryState extends Equatable {
  const LibraryState();
  @override
  List<Object?> get props => [];
}

class LibraryLoading extends LibraryState {}

class LibraryLoaded extends LibraryState {
  final List<Song> songs;
  const LibraryLoaded({required this.songs});
  @override
  List<Object?> get props => [songs];
}

class LibraryError extends LibraryState {
  final String message;
  const LibraryError({required this.message});
  @override
  List<Object?> get props => [message];
}
