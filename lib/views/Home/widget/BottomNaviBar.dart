import 'package:flutter/material.dart';
import 'package:zoomclone/Core/Theming/Colors/pColors.dart';

class BottomNaviBar extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onClick;

  const BottomNaviBar({
    super.key,
    required this.currentIndex,
    required this.onClick,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: footerColor,
      selectedItemColor: textColor,
      unselectedItemColor: grayColor,
      onTap: onClick,
      currentIndex: currentIndex,
      type: BottomNavigationBarType.fixed,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.comment_bank),
          label: "Meet & Chat",
        ),
        BottomNavigationBarItem(icon: Icon(Icons.lock_clock), label: "Meeting"),
        BottomNavigationBarItem(
          icon: Icon(Icons.person_outlined),
          label: "Profile",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.settings_outlined),
          label: "Settings",
        ),
      ],
    );
  }
}
