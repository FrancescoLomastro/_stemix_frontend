import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ShellScaffold extends StatelessWidget {
  const ShellScaffold({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody(),
      bottomNavigationBar: _buildBottomNavigationBar(context),
    );
  }

  Widget _buildBody() {
    return Container(
      child: Column(children: [Expanded(child: child)]),
    );
  }

  Widget _buildBottomNavigationBar(BuildContext context) {
    return Container(
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 6),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildNavItem(
                context: context,
                icon: Icons.playlist_play,
                label: 'Library',
              ),
              _buildNavItem(
                context: context,
                icon: Icons.library_music,
                label: 'Playlists',
              ),
              _buildNavItem(
                context: context,
                icon: Icons.file_upload_outlined,
                label: 'Upload',
              ),
              _buildNavItem(
                context: context,
                icon: Icons.person,
                label: 'Settings',
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNavItem({
    required BuildContext context,
    required IconData icon,
    required String label,
  }) {
    final bool isSelected = GoRouterState.of(
      context,
    ).uri.toString().startsWith('/${label.toLowerCase()}');

    return InkWell(
      onTap: () {
        context.go('/${label.toLowerCase()}');
      },
      borderRadius: BorderRadius.circular(12),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              size: 26,
              /* color: isSelected
                  ? AppTheme.navBarItemSelectedColor
                  : AppTheme.navBarItemColor, */
            ),
            SizedBox(height: 4),
            Text(
              label,
              style: TextStyle(
                /* color: isSelected
                    ? AppTheme.navBarItemSelectedColor
                    : AppTheme.navBarItemColor, */
                fontSize: 12,
                fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
