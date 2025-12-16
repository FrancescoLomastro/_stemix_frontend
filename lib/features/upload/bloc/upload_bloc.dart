import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:stemix_frontend/features/upload/bloc/upload_event.dart';
import 'package:stemix_frontend/features/upload/bloc/upload_state.dart';

@injectable
class UploadBloc extends Bloc<UploadEvent, UploadState> {
  UploadBloc() : super(UploadState()) {
    on<UploadEvent>((event, emit) {});
  }
}
