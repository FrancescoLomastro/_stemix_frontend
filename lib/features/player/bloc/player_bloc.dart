import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:stemix_frontend/data/local/drift/database.dart';
import 'package:stemix_frontend/data/remote/song_repository.dart';
import 'package:stemix_frontend/data/local/drift/stem_names.dart';
import 'package:stemix_frontend/features/player/audio/soloud_audio.dart';
import 'package:stemix_frontend/features/player/bloc/player_event.dart';
import 'package:stemix_frontend/features/player/bloc/player_state.dart';
import 'package:stemix_frontend/logger.dart';

@injectable
class PlayerBloc extends Bloc<PlayerEvent, PlayerState> {
  final Song _song;
  final SoloudImplementation _player;
  final SongRepository _songRepository;
  late final Stream<int> _positionStream;

  Song get song => _song;
  Stream<int> get positionStream => _positionStream;

  PlayerBloc(this._player, this._songRepository, @factoryParam this._song)
    : super(PlayerLoading()) {
    _positionStream = _player.positionStream;

    on<LoadPlayerEvent>(_onLoadPlayerEvent);
    on<PlayEvent>(_onPlayEvent);
    on<PauseEvent>(_onPauseEvent);
    on<SkipDurationEvent>(_onSkipDurationEvent);
    on<SetVolumeEvent>(_onSetVolumeEvent);
    on<SaveEvent>(_onSaveEvent);
    on<SongEndedEvent>(_onSongEndedEvent);
    on<SetMetronomeSpeedEvent>(_onSetMetronomeSpeedEvent);
  }

  Future<void> _onLoadPlayerEvent(
    LoadPlayerEvent event,
    Emitter<PlayerState> emit,
  ) async {
    try {
      emit(PlayerLoading());
      await _player.ensureInitialized();
      await _player.ensureCleanedUp();
      await _player.loadTracks(_song);
      _player.onEnd(() {
        add(SongEndedEvent());
      });

      emit(
        PlayerLoaded(
          isSaved: true,
          metronomeSpeed: _song.metronomeSpeed,
          stemVolumes: {
            StemName.vocals: _song.vocalsVol,
            StemName.bass: _song.bassVol,
            StemName.drums: _song.drumsVol,
            StemName.other: _song.otherVol,
            StemName.piano: _song.pianoVol,
            StemName.guitar: _song.guitarVol,
          },
          metronomeVolume: _song.metronomeVolume,
        ),
      );
    } catch (e, stacktrace) {
      logger.e("Error loading player: $e $stacktrace");
      emit(PlayerError(e.toString()));
    }
  }

  Future<void> _onPlayEvent(PlayEvent event, Emitter<PlayerState> emit) async {
    try {
      final currentState = state;
      if (currentState is PlayerLoaded) {
        if (!currentState.isPlaying) {
          _player.play();
          emit(currentState.copyWith(isPlaying: true));
        }
      }
    } catch (e, stacktrace) {
      logger.e("Error in PlayEvent: $e $stacktrace");
      emit(PlayerError(e.toString()));
    }
  }

  Future<void> _onPauseEvent(
    PauseEvent event,
    Emitter<PlayerState> emit,
  ) async {
    try {
      final currentState = state;
      if (currentState is PlayerLoaded) {
        if (currentState.isPlaying) {
          _player.pause();
          emit(currentState.copyWith(isPlaying: false));
        }
      }
    } catch (e, stacktrace) {
      logger.e("Error in PauseEvent: $e $stacktrace");
      emit(PlayerError(e.toString()));
    }
  }

  Future<void> _onSkipDurationEvent(
    SkipDurationEvent event,
    Emitter<PlayerState> emit,
  ) async {
    try {
      final currentState = state;
      if (currentState is PlayerLoaded) {
        final songDuration = _song.duration;
        if (event.absolute) {
          // Handles absolute seek
          if (event.amount < 0) return;
          if (event.amount > songDuration) return;
          _player.seek(Duration(seconds: event.amount));
        } else {
          // Handles relative seek
          final currentPosition = _player.currentPosition;
          Duration newPosition =
              currentPosition + Duration(seconds: event.amount);
          bool changeUi = false;

          if (newPosition < Duration.zero) {
            newPosition = Duration.zero;
          } else if (newPosition.inSeconds > songDuration) {
            newPosition = Duration.zero;
            _player.pause();
            changeUi = true;
          }
          _player.seek(newPosition);

          // its important to change the UI only after seeking the player
          if (changeUi) {
            emit(currentState.copyWith(isPlaying: false));
          }
        }
      }
    } catch (e, stacktrace) {
      logger.e("Error in SkipDurationEvent: $e $stacktrace");
      emit(PlayerError(e.toString()));
    }
  }

  Future<void> _onSetVolumeEvent(
    SetVolumeEvent event,
    Emitter<PlayerState> emit,
  ) async {
    try {
      final currentState = state;
      if (currentState is PlayerLoaded) {
        _player.setVolume(event.stemName, event.volume);

        if (event.stemName == null) {
          emit(
            currentState.copyWith(
              metronomeVolume: event.volume,
              isSaved: false,
            ),
          );
        } else {
          final newVolumes = Map<StemName, double>.from(
            currentState.stemVolumes,
          );
          newVolumes[event.stemName!] = event.volume;
          emit(currentState.copyWith(stemVolumes: newVolumes, isSaved: false));
        }
      }
    } catch (e, stacktrace) {
      logger.e("Error in SetVolumeEvent: $e $stacktrace");
      emit(PlayerError(e.toString()));
    }
  }

  Future<void> _onSaveEvent(SaveEvent event, Emitter<PlayerState> emit) async {
    try {
      final currentState = state;
      if (currentState is PlayerLoaded) {
        await _songRepository.updateSong(
          _song.id,
          currentState.stemVolumes,
          currentState.metronomeSpeed,
          currentState.metronomeVolume,
        );
        emit(currentState.copyWith(isSaved: true));
      }
    } catch (e, stacktrace) {
      logger.e("Error in SaveEvent: $e $stacktrace");
      emit(PlayerError(e.toString()));
    }
  }

  Future<void> _onSongEndedEvent(
    SongEndedEvent event,
    Emitter<PlayerState> emit,
  ) async {
    add(SkipDurationEvent(absolute: true, amount: 0));
    add(PauseEvent());
  }

  Future<void> _onSetMetronomeSpeedEvent(
    SetMetronomeSpeedEvent event,
    Emitter<PlayerState> emit,
  ) async {
    try {
      final currentState = state;
      if (currentState is PlayerLoaded) {
        _player.setMetronomeSpeed(event.speed);
        emit(
          currentState.copyWith(metronomeSpeed: event.speed, isSaved: false),
        );
      }
    } catch (e, stacktrace) {
      logger.e("Error in SetMetronomeSpeedEvent: $e $stacktrace");
      emit(PlayerError(e.toString()));
    }
  }
}
