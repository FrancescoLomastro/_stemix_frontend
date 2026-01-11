import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stemix_frontend/data/remote/upload_step.dart';
import 'package:stemix_frontend/features/upload/bloc/upload_bloc.dart';
import 'package:stemix_frontend/features/upload/widgets/upload_file_picker.dart';
import 'package:stemix_frontend/features/upload/widgets/upload_overlay.dart';
import 'package:stemix_frontend/widgets/error_dialog.dart';

class UploadPage extends StatelessWidget {
  const UploadPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const _UploadPageView();
  }
}

class _UploadPageView extends StatefulWidget {
  const _UploadPageView();

  @override
  State<_UploadPageView> createState() => _UploadPageViewState();
}

class _UploadPageViewState extends State<_UploadPageView> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _artistController = TextEditingController();

  @override
  void initState() {
    super.initState();
    final currentState = context.read<UploadBloc>().state;
    _titleController.text = currentState.title;
    _artistController.text = currentState.artist;
  }

  @override
  void dispose() {
    _titleController.dispose();
    _artistController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UploadBloc, UploadState>(
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
            const SnackBar(content: Text("Song downloaded successfully!")),
          );
          context.read<UploadBloc>().add(ResetUploadEvent());
        }
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Theme.of(context).colorScheme.surfaceContainer,
            title: const Text("Upload Song"),
          ),
          body: Stack(
            children: [
              SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        buildFilePickerArea(context, state),
                        const SizedBox(height: 32),
                        TextFormField(
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
                          validator: (value) {
                            if (value == null || value.trim().isEmpty) {
                              return "Title is required.";
                            }
                            return null;
                          },
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
                        const SizedBox(height: 16),
                        buildCoverImage(context, state),
                        const SizedBox(height: 40),
                        Row(
                          children: [
                            Expanded(
                              child: FilledButton(
                                style: FilledButton.styleFrom(
                                  backgroundColor: Theme.of(
                                    context,
                                  ).colorScheme.surfaceContainer,
                                ),
                                onPressed: () {
                                  context.read<UploadBloc>().add(
                                    ResetUploadEvent(),
                                  );
                                },
                                child: const Text("Reset"),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 12),
                        Row(
                          children: [
                            Expanded(
                              child: FilledButton(
                                onPressed: state.filePath != null
                                    ? () {
                                        final isValid =
                                            _formKey.currentState?.validate() ??
                                            false;
                                        if (!isValid) return;

                                        context.read<UploadBloc>().add(
                                          SubmitUploadEvent(),
                                        );
                                      }
                                    : null,
                                child: const Text("Upload"),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              if (state.isProcessing) buildLoadingOverlay(context, state),
            ],
          ),
        );
      },
    );
  }
}

Widget buildCoverImage(BuildContext context, UploadState state) {
  return GestureDetector(
    onTap: () {
      if (state.filePath != null) {
        context.read<UploadBloc>().add(PickCoverImageEvent());
      }
    },
    child: Container(
      padding: const EdgeInsets.all(22),
      decoration: BoxDecoration(
        border: Border.all(
          width: state.filePath != null ? 1 : 3,
          color: state.filePath != null
              ? Theme.of(context).colorScheme.outline
              : Theme.of(context).colorScheme.surfaceContainer,
        ),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.surfaceContainer,
              borderRadius: BorderRadius.circular(8),
            ),
            height: 96,
            width: 96,
            clipBehavior: Clip.antiAlias,
            child: state.coverImageBytes != null
                ? Image.memory(state.coverImageBytes!, fit: BoxFit.cover)
                : Padding(
                    padding: const EdgeInsets.all(22),
                    child: Icon(Icons.image_rounded),
                  ),
          ),
          const SizedBox(width: 30),
          Column(
            children: [
              Text(
                "Tap to select a cover image",
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              Text(
                "JPG, PNG",
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  color: Theme.of(context).colorScheme.onSurfaceVariant,
                ),
                textAlign: TextAlign.start,
              ),
            ],
          ),
        ],
      ),
    ),
  );
}
