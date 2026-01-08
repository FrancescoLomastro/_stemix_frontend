import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stemix_frontend/features/library/bloc/library_bloc.dart';

void showOrderDialog(BuildContext context, LibraryState currentState) {
  final parentContext = context;

  showDialog(
    context: context,
    builder: (dialogContext) {
      SortOption tempSortOption = currentState.sortOption;
      SortDirection tempSortDirection = currentState.sortDirection;

      return StatefulBuilder(
        builder: (context, setState) {
          return AlertDialog(
            title: const Text('Sort by'),
            content: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Column(
                  children: [
                    buildSortOption(
                      context,
                      currentState,
                      () => setState(() => tempSortOption = SortOption.date),
                      tempSortOption,
                      'Date',
                      tempSortOption == SortOption.date,
                    ),
                    const SizedBox(height: 8),
                    buildSortOption(
                      context,
                      currentState,
                      () => setState(() => tempSortOption = SortOption.title),
                      tempSortOption,
                      'Title',
                      tempSortOption == SortOption.title,
                    ),
                    const SizedBox(height: 8),
                    buildSortOption(
                      context,
                      currentState,
                      () => setState(() => tempSortOption = SortOption.artist),
                      tempSortOption,
                      'Artist',
                      tempSortOption == SortOption.artist,
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                const Divider(),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    buildDirectionOption(
                      context,
                      currentState,
                      () => setState(
                        () => tempSortDirection = SortDirection.ascending,
                      ),
                      tempSortDirection,
                      'Ascending',
                      tempSortDirection == SortDirection.ascending,
                    ),
                    buildDirectionOption(
                      context,
                      currentState,
                      () => setState(
                        () => tempSortDirection = SortDirection.descending,
                      ),
                      tempSortDirection,
                      'Descending',
                      tempSortDirection == SortDirection.descending,
                    ),
                  ],
                ),
              ],
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(dialogContext),
                child: Text(
                  'Cancel',
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.onSurface,
                  ),
                ),
              ),
              FilledButton(
                onPressed: () {
                  Navigator.pop(dialogContext);
                  parentContext.read<LibraryBloc>().add(
                    ChangeSortOrderEvent(
                      sortOption: tempSortOption,
                      sortDirection: tempSortDirection,
                    ),
                  );
                },
                child: const Text('Apply'),
              ),
            ],
          );
        },
      );
    },
  );
}

Widget buildDirectionOption(
  BuildContext context,
  LibraryState currentState,
  VoidCallback ontap,
  SortDirection tempSortDirection,
  String label,
  bool isSelected,
) {
  return InkWell(
    splashColor: Colors.transparent,
    onTap: ontap,
    child: Container(
      decoration: BoxDecoration(
        color: isSelected ? Color.fromARGB(37, 255, 0, 0) : null,
        borderRadius: BorderRadius.circular(8),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Text(
        label,
        style: TextStyle(
          color: isSelected ? Theme.of(context).colorScheme.primary : null,
        ),
      ),
    ),
  );
}

Widget buildSortOption(
  BuildContext context,
  LibraryState currentState,
  VoidCallback ontap,
  SortOption tempSortOption,
  String label,
  bool isSelected,
) {
  return InkWell(
    splashColor: Colors.transparent,
    onTap: ontap,
    child: Container(
      decoration: BoxDecoration(
        color: isSelected ? Color.fromARGB(37, 255, 0, 0) : null,
        borderRadius: BorderRadius.circular(8),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        children: [
          Text(
            label,
            style: TextStyle(
              color: isSelected ? Theme.of(context).colorScheme.primary : null,
            ),
          ),
        ],
      ),
    ),
  );
}
