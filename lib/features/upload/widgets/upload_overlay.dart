import 'package:flutter/material.dart';
import 'package:stemix_frontend/data/remote/upload_step.dart';
import 'package:stemix_frontend/features/upload/bloc/upload_bloc.dart';

Widget buildLoadingOverlay(BuildContext context, UploadState state) {
  return Container(
    color: Colors.black.withAlpha(200),
    child: Center(
      child: Card(
        color: Theme.of(context).colorScheme.surfaceContainer,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        margin: const EdgeInsets.symmetric(horizontal: 16),
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(height: 24),
              Text(
                _getStatusMessage(state.currentStep),
                style: Theme.of(context).textTheme.bodyLarge,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16),
              Text(
                "${state.progress}%",
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              const SizedBox(height: 12),
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: LinearProgressIndicator(
                  value: state.progress / 100,
                  minHeight: 8,
                ),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}

String _getStatusMessage(UploadStep step) {
  switch (step) {
    case UploadStep.uploading:
      return "Uploading file...";
    case UploadStep.analyzing:
      return "Analyzing audio...";
    case UploadStep.separating:
      return "Separating stems...";
    case UploadStep.converting:
      return "Converting formats...";
    case UploadStep.zipping:
      return "Packing files...";
    case UploadStep.downloading:
      return "Downloading results...";
    default:
      return "Please wait...";
  }
}
