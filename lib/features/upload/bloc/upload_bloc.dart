import 'dart:async';
import 'dart:typed_data';

import 'package:equatable/equatable.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:metadata_god/metadata_god.dart';
import 'package:stemix_frontend/main.dart';

part 'upload_event.dart';
part 'upload_state.dart';

@injectable
class UploadBloc extends Bloc<UploadEvent, UploadState> {
  /* final PreferencesService _preferences; */

  UploadBloc(/* this._preferences */) : super(const UploadState()) {
    on<PickFileEvent>(_onPickFile);
    on<TitleChangedEvent>(_onTitleChanged);
    on<ArtistChangedEvent>(_onArtistChanged);
    on<SubmitUploadEvent>(_onSubmit);
    on<ResetUploadEvent>(_onReset);
    on<ErrorOccurredEvent>(_onErrorOccurredEvent);
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
        type: FileType.audio,
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
    /* // Validazione
    if (state.filePath == null) {
      emit(state.copyWith(errorMessage: "Devi selezionare un file MP3."));
      return;
    }
    if (state.title.isEmpty) {
      emit(state.copyWith(errorMessage: "Il titolo è obbligatorio."));
      return;
    }

    // Inizio Processo
    emit(
      state.copyWith(
        isProcessing: true,
        currentStep: UploadStep.uploading,
        progress: 0,
        errorMessage: null,
      ),
    );

    final ip = _preferences.getServerIp();
    final port = _preferences.getServerPort();
    final baseUrl = 'http://$ip:$port';

    try {
      // 1. UPLOAD
      String fileName = state.filePath!.split(Platform.pathSeparator).last;
      FormData formData = FormData.fromMap({
        "file": await MultipartFile.fromFile(
          state.filePath!,
          filename: fileName,
        ),
        "title": state.title,
        "artist": state.artist,
        // Opzionale: se il backend accetta la cover image caricata manualmente, aggiungila qui
      });

      final response = await _dio.post(
        '$baseUrl/upload',
        data: formData,
        onSendProgress: (count, total) {
          // Aggiorna progresso upload (0-100 per la fase upload)
          final percent = ((count / total) * 100).toInt();
          // Poiché siamo dentro un callback asincrono di Dio, non possiamo usare emit direttamente se il bloc è chiuso,
          // ma in questo contesto semplice assumiamo di sì.
          // Nota: per fare un emit qui servirebbe un meccanismo diverso,
          // per ora simuliamo il progresso 'uploading' come statico o gestito a step.
        },
      );

      if (response.statusCode == 200) {
        final jobId =
            response.data['id']; // Assumo il server restituisca { "id": "123" }
        await _pollStatus(jobId, baseUrl, emit);
      } else {
        throw Exception("Server upload failed: ${response.statusCode}");
      }
    } catch (e) {
      _logger.e(e);
      emit(
        state.copyWith(
          currentStep: UploadStep.failed,
          errorMessage: "Errore durante l'upload: $e",
          isProcessing: false,
        ),
      );
    } */
  }

  /* Future<void> _pollStatus(
    String jobId,
    String baseUrl,
    Emitter<UploadState> emit,
  ) async {
    bool isJobDone = false;

    while (!isJobDone) {
      try {
        await Future.delayed(
          const Duration(seconds: 1),
        ); // Polling ogni secondo

        final response = await _dio.get('$baseUrl/status/$jobId');
        final statusStr =
            response.data['status'] as String; // "Analyzing", "Completed", etc.
        final progress = response.data['progress'] as int? ?? 0;

        UploadStep step = _mapStatusToStep(statusStr);

        if (step == UploadStep.failed) {
          emit(
            state.copyWith(
              currentStep: UploadStep.failed,
              errorMessage: "Il server ha segnalato un errore.",
              isProcessing: false,
            ),
          );
          return;
        }

        if (step == UploadStep.completed) {
          isJobDone = true;
          // Passiamo al download
          await _downloadAndExtract(jobId, baseUrl, emit);
        } else {
          emit(state.copyWith(currentStep: step, progress: progress));
        }
      } catch (e) {
        // Se il polling fallisce (es. rete persa momentaneamente), potremmo riprovare o fallire
        emit(
          state.copyWith(
            currentStep: UploadStep.failed,
            errorMessage: "Errore durante il controllo stato: $e",
            isProcessing: false,
          ),
        );
        return;
      }
    }
  } */

  /* Future<void> _downloadAndExtract(
    String jobId,
    String baseUrl,
    Emitter<UploadState> emit,
  ) async {
    emit(state.copyWith(currentStep: UploadStep.downloading, progress: 0));

    try {
      final response = await _dio.get(
        '$baseUrl/download/$jobId',
        options: Options(responseType: ResponseType.bytes),
        onReceiveProgress: (count, total) {
          if (total != -1) {
            final percent = ((count / total) * 100).toInt();
            // Nota: attenzione all'emit dentro callback, qui semplifichiamo
          }
        },
      );

      // Decomprimi in memoria
      final archive = ZipDecoder().decodeBytes(response.data);

      _logger.i("Contenuto dello ZIP scaricato:");
      for (final file in archive) {
        if (file.isFile) {
          _logger.i("- ${file.name}");
        }
      }

      // Tutto finito!
      emit(
        state.copyWith(
          currentStep: UploadStep.success,
          isProcessing: false,
          progress: 100,
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          currentStep: UploadStep.failed,
          errorMessage: "Errore download/unzip: $e",
          isProcessing: false,
        ),
      );
    }
  } */

  /* UploadStep _mapStatusToStep(String serverStatus) {
    switch (serverStatus.toLowerCase()) {
      case 'analyzing':
        return UploadStep.analyzing;
      case 'separating':
        return UploadStep.separating;
      case 'converting':
        return UploadStep.converting;
      case 'zipping':
        return UploadStep.zipping;
      case 'completed':
        return UploadStep.completed;
      case 'failed':
        return UploadStep.failed;
      default:
        return UploadStep.uploading;
    }
  } */
}
