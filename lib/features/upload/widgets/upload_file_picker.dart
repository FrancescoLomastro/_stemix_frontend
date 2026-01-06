import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stemix_frontend/features/upload/bloc/upload_bloc.dart';

Widget buildFilePickerArea(BuildContext context, UploadState state) {
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
                  ? Icon(Icons.check, size: 40)
                  : Icon(Icons.cloud_upload_outlined, size: 40),
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
