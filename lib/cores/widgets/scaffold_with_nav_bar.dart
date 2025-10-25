import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:material_symbols_icons/symbols.dart';

class ScaffoldWithNavBar extends StatelessWidget {
  const ScaffoldWithNavBar({
    super.key,
    required StatefulNavigationShell navigationShell,
  }) : _navigationShell = navigationShell;

  final StatefulNavigationShell _navigationShell;

  Widget _buildActiveIconProfile(ColorScheme colorScheme) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: colorScheme.onSurface,
      ),
      child: Icon(
        Symbols.account_circle,
        fill: 1,
        color: colorScheme.surface,
        size: 23,
      ),
    );
  }

  List<BottomNavigationBarItem> _buildBottomNavigationBarItems(
    ColorScheme colorScheme,
  ) {
    return [
      const BottomNavigationBarItem(
        icon: Icon(Symbols.home_filled, fill: 0, weight: 500),
        activeIcon: Icon(Symbols.home_filled, fill: 1),
        label: 'feed',
      ),
      const BottomNavigationBarItem(
        icon: Icon(Symbols.search, weight: 400),
        activeIcon: Icon(Symbols.search, weight: 700, grade: 200),
        label: 'search',
      ),
      const BottomNavigationBarItem(
        icon: Icon(Symbols.add_box, weight: 400),
        activeIcon: Icon(Symbols.add_box, fill: 1),
        label: 'add_media',
      ),
      const BottomNavigationBarItem(
        icon: Icon(Symbols.video_library, weight: 400),
        activeIcon: Icon(Symbols.video_library, fill: 1),
        label: 'reel',
      ),
      BottomNavigationBarItem(
        icon: const Icon(Symbols.account_circle, weight: 400),
        activeIcon: _buildActiveIconProfile(colorScheme),
        label: 'profile',
      ),
    ];
  }

  void _onTap(int indexedStack) {
    _navigationShell.goBranch(indexedStack);
  }

  Widget _buildBottomNavigationBar(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    final ColorScheme colorScheme = themeData.colorScheme;
    return BottomNavigationBar(
      showUnselectedLabels: false,
      showSelectedLabels: false,
      currentIndex: _navigationShell.currentIndex,
      onTap: _onTap,
      items: _buildBottomNavigationBarItems(colorScheme),
      type: BottomNavigationBarType.fixed,
      unselectedItemColor: colorScheme.onSurface,
      selectedItemColor: colorScheme.onSurface,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _navigationShell,
      bottomNavigationBar: _buildBottomNavigationBar(context),
    );
  }
}
