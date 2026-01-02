import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:stemix_frontend/features/upload/bloc/upload_bloc.dart';
import 'package:stemix_frontend/widgets/error_dialog.dart';

class UploadPage extends StatelessWidget {
  const UploadPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetIt.I<UploadBloc>(),
      child: const _UploadPageView(),
    );
  }
}

class _UploadPageView extends StatefulWidget {
  const _UploadPageView();

  @override
  State<_UploadPageView> createState() => _UploadPageViewState();
}

class _UploadPageViewState extends State<_UploadPageView> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _artistController = TextEditingController();

  // Colori per la UI
  final Color _primaryColor = const Color(0xFF6C63FF); // Un viola moderno
  final Color _inputFillColor = const Color(0xFFEDF2F7);

  @override
  void dispose() {
    _titleController.dispose();
    _artistController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UploadBloc, UploadState>(
      listenWhen: (previous, current) =>
          previous.errorMessage != current.errorMessage ||
          previous.title != current.title ||
          previous.artist != current.artist ||
          previous.currentStep != current.currentStep,
      listener: (context, state) {
        if (state.errorMessage != null) {
          showErrorDialog(context, state.errorMessage!);
        }

        if (state.title != _titleController.text) {
          _titleController.text = state.title;
        }
        if (state.artist != _artistController.text) {
          _artistController.text = state.artist;
        }

        if (state.currentStep == UploadStep.success) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text("Elaborazione completata!"),
              backgroundColor: Colors.green,
            ),
          );
          context.read<UploadBloc>().add(ResetUploadEvent());
          _titleController.clear();
          _artistController.clear();
        }
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(title: const Text("Upload New Song")),
          body: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    _buildFilePickerArea(context, state),
                    const SizedBox(height: 32),
                    TextField(
                      controller: _titleController,
                      enabled: state.filePath != null,
                      onChanged: (value) {
                        context.read<UploadBloc>().add(
                          TitleChangedEvent(value),
                        );
                      },
                      decoration: const InputDecoration(
                        labelText: "Title",
                        border: OutlineInputBorder(),
                      ),
                    ),
                    const SizedBox(height: 16),
                    TextField(
                      controller: _artistController,
                      enabled: state.filePath != null,
                      onChanged: (value) {
                        context.read<UploadBloc>().add(
                          ArtistChangedEvent(value),
                        );
                      },
                      decoration: const InputDecoration(
                        labelText: "Artist",
                        border: OutlineInputBorder(),
                      ),
                    ),
                    const SizedBox(height: 40),
                    Row(
                      children: [
                        Expanded(
                          child: FilledButton(
                            onPressed: () {},
                            child: const Text("Upload & Process"),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              if (state.isProcessing) _buildLoadingOverlay(state),
            ],
          ),
        );
      },
    );
  }

  Widget _buildFilePickerArea(BuildContext context, UploadState state) {
    return GestureDetector(
      onTap: () => context.read<UploadBloc>().add(PickFileEvent()),
      child: DottedBorder(
        options: RoundedRectDottedBorderOptions(
          radius: Radius.circular(12),
          dashPattern: [8, 4],
          color: Theme.of(context).colorScheme.onSurfaceVariant,
          strokeWidth: 1.5,
        ),
        child: SizedBox(
          height: 180,
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: state.filePath != null
                      ? Theme.of(context).colorScheme.tertiary
                      : Theme.of(context).colorScheme.surfaceContainer,
                ),
                height: 80,
                width: 80,
                child: state.filePath != null
                    ? Icon(
                        Icons.check,
                        size: 40,
                        color: Theme.of(context).colorScheme.outline,
                      )
                    : Icon(
                        Icons.cloud_upload_outlined,
                        size: 40,
                        color: Theme.of(context).colorScheme.outline,
                      ),
              ),
              const SizedBox(height: 16),
              Text(
                state.filePath != null
                    ? state.filePath!.split('/').last
                    : "Select an audio file to upload",
                style: Theme.of(context).textTheme.bodyLarge,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildLoadingOverlay(UploadState state) {
    return Container(
      color: Colors.black.withOpacity(0.6),
      child: Center(
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          elevation: 10,
          margin: const EdgeInsets.symmetric(horizontal: 32),
          child: Padding(
            padding: const EdgeInsets.all(32.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  height: 60,
                  width: 60,
                  child: CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(_primaryColor),
                    strokeWidth: 6,
                  ),
                ),
                const SizedBox(height: 24),
                Text(
                  _getStatusMessage(state.currentStep),
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 16),
                Text(
                  "${state.progress}%",
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey[600],
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 12),
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: LinearProgressIndicator(
                    value: state.progress / 100,
                    backgroundColor: _inputFillColor,
                    valueColor: AlwaysStoppedAnimation<Color>(_primaryColor),
                    minHeight: 8,
                  ),
                ),
                if (state.currentStep == UploadStep.downloading)
                  Padding(
                    padding: const EdgeInsets.only(top: 16.0),
                    child: Text(
                      "Finalizing & Downloading...",
                      style: TextStyle(color: Colors.grey[600], fontSize: 14),
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
}
