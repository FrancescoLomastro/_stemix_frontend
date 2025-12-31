import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stemix_frontend/deps_injection/injection.dart';
import 'package:stemix_frontend/features/library/bloc/library_bloc.dart';
import 'package:stemix_frontend/features/library/widgets/library_app_bar.dart';
import 'package:stemix_frontend/features/library/widgets/library_body.dart';
import 'package:stemix_frontend/widgets/error_dialog.dart';
import 'package:stemix_frontend/widgets/loading_action_dialog.dart';

class LibraryPage extends StatelessWidget {
  const LibraryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<LibraryBloc>()..add(LoadSongsEvent()),
      child: const _LibraryView(),
    );
  }
}

class _LibraryView extends StatefulWidget {
  const _LibraryView();

  @override
  State<_LibraryView> createState() => _LibraryViewState();
}

class _LibraryViewState extends State<_LibraryView> {
  bool _isDeleteDialogOpen = false;

  @override
  Widget build(BuildContext context) {
    return BlocListener<LibraryBloc, LibraryState>(
      listenWhen: (previous, current) => previous.status != current.status,
      listener: (context, state) {
        if (_isDeleteDialogOpen && state.status != LibraryStatus.deleting) {
          Navigator.of(context, rootNavigator: true).pop();
          _isDeleteDialogOpen = false;
        }

        if (state.status == LibraryStatus.deleting && !_isDeleteDialogOpen) {
          _isDeleteDialogOpen = true;
          showLoadingAction(context, "Deleting...", (didPop, result) {
            didPop ? _isDeleteDialogOpen = false : null;
          });
        }

        if (state.status == LibraryStatus.failure) {
          showErrorDialog(context, state.errorMessage!);
        }
      },
      child: Scaffold(appBar: const LibraryAppBar(), body: const LibraryBody()),
    );
  }
}
