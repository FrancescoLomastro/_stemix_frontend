part of 'upload_bloc.dart';

class UploadState extends Equatable {
  final String? filePath;
  final Uint8List? coverImageBytes;
  final String title;
  final String artist;

  final bool isProcessing;
  final UploadStep currentStep;
  final int progress;
  final String? errorMessage;

  const UploadState({
    this.filePath,
    this.coverImageBytes,
    this.title = '',
    this.artist = '',
    this.isProcessing = false,
    this.currentStep = UploadStep.idle,
    this.progress = 0,
    this.errorMessage,
  });

  UploadState copyWith({
    String? filePath,
    Uint8List? coverImageBytes,
    String? title,
    String? artist,
    bool? isProcessing,
    UploadStep? currentStep,
    int? progress,
    String? errorMessage,
  }) {
    return UploadState(
      filePath: filePath ?? this.filePath,
      coverImageBytes: coverImageBytes ?? this.coverImageBytes,
      title: title ?? this.title,
      artist: artist ?? this.artist,
      isProcessing: isProcessing ?? this.isProcessing,
      currentStep: currentStep ?? this.currentStep,
      progress: progress ?? this.progress,
      errorMessage: errorMessage,
    );
  }

  @override
  List<Object?> get props => [
    filePath,
    coverImageBytes,
    title,
    artist,
    isProcessing,
    currentStep,
    progress,
    errorMessage,
  ];
}
