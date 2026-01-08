import 'dart:async';
import 'dart:io';
import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:metadata_god/metadata_god.dart';
import 'package:stemix_frontend/data/remote/song_repository.dart';
import 'package:stemix_frontend/data/remote/upload_step.dart';
import 'package:stemix_frontend/logger.dart';

part 'upload_event.dart';
part 'upload_state.dart';

@injectable
class UploadBloc extends Bloc<UploadEvent, UploadState> {
  final SongRepository _repository;

  UploadBloc(this._repository) : super(const UploadState()) {
    on<PickFileEvent>(_onPickFile);
    on<TitleChangedEvent>(_onTitleChanged);
    on<ArtistChangedEvent>(_onArtistChanged);
    on<SubmitUploadEvent>(_onSubmit);
    on<ResetUploadEvent>(_onReset);
    on<ErrorOccurredEvent>(_onErrorOccurredEvent);
    on<PickCoverImageEvent>(_onPickCoverImage);
  }

  Future<void> _onTitleChanged(
    TitleChangedEvent event,
    Emitter<UploadState> emit,
  ) async {
    emit(state.copyWith(title: event.title));
  }

  Future<void> _onArtistChanged(
    ArtistChangedEvent event,
    Emitter<UploadState> emit,
  ) async {
    emit(state.copyWith(artist: event.artist));
  }

  Future<void> _onReset(
    ResetUploadEvent event,
    Emitter<UploadState> emit,
  ) async {
    emit(const UploadState());
  }

  Future<void> _onErrorOccurredEvent(
    ErrorOccurredEvent event,
    Emitter<UploadState> emit,
  ) async {
    emit(state.copyWith(errorMessage: event.message, isProcessing: false));
  }

  Future<void> _onPickFile(
    PickFileEvent event,
    Emitter<UploadState> emit,
  ) async {
    try {
      FilePickerResult? result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['mp3', 'wav'],
      );

      if (result != null && result.files.single.path != null) {
        final path = result.files.single.path!;
        emit(state.copyWith(filePath: path));

        try {
          final metadata = await MetadataGod.readMetadata(file: path);

          String? extractedTitle = metadata.title;
          String? extractedArtist = metadata.artist;
          Uint8List? extractedImage = metadata.picture?.data;

          emit(
            state.copyWith(
              title: extractedTitle,
              artist: extractedArtist,
              coverImageBytes: extractedImage,
            ),
          );
        } catch (e, stackTrace) {
          logger.w("Could not extract metadata: $e $stackTrace");
        }
      }
    } catch (e, stackTrace) {
      String message = "Error selecting file: $e $stackTrace";
      logger.e(message);
      emit(state.copyWith(errorMessage: message));
    }
  }

  Future<void> _onSubmit(
    SubmitUploadEvent event,
    Emitter<UploadState> emit,
  ) async {
    emit(
      state.copyWith(
        isProcessing: true,
        currentStep: UploadStep.uploading,
        progress: 0,
        errorMessage: null,
      ),
    );

    try {
      String fileName = state.filePath!.split(Platform.pathSeparator).last;
      FormData formData = FormData.fromMap({
        "file": await MultipartFile.fromFile(
          state.filePath!,
          filename: fileName,
        ),
      });

      final jobId = await _repository.uploadSong(formData);

      await _repository.monitorJobProgress(
        pollInterval: Duration(seconds: 5),
        jobId: jobId,
        onProgress: (step, progress) {
          emit(state.copyWith(currentStep: step, progress: progress));
        },
      );

      emit(state.copyWith(currentStep: UploadStep.downloading, progress: 0));

      await _repository.download(
        jobId,
        state.title,
        state.artist,
        state.coverImageBytes,
        onProgress: (p) {
          emit(state.copyWith(progress: p));
        },
      );

      emit(
        state.copyWith(currentStep: UploadStep.success, isProcessing: false),
      );
    } catch (e, stacktrace) {
      String message = "Error during upload: $e $stacktrace";
      logger.e(message);
      emit(
        state.copyWith(
          currentStep: UploadStep.failed,
          errorMessage: e.toString(),
          isProcessing: false,
        ),
      );
    }
  }

  Future<void> _onPickCoverImage(
    PickCoverImageEvent event,
    Emitter<UploadState> emit,
  ) async {
    try {
      FilePickerResult? result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['jpg', 'png', 'jpeg'],
      );

      if (result != null && result.files.single.path != null) {
        final path = result.files.single.path!;
        final imageBytes = await File(path).readAsBytes();

        emit(state.copyWith(coverImageBytes: imageBytes));
      }
    } catch (e, stackTrace) {
      String message = "Error selecting cover image: $e $stackTrace";
      logger.e(message);
      emit(state.copyWith(errorMessage: message));
    }
  }
}
