import 'package:flutter/material.dart';
import 'package:zoomclone/Core/Theming/Colors/pColors.dart';
import 'package:zoomclone/Core/Theming/Size/pSize.dart';
import 'package:zoomclone/Core/decouration/decouration.dart';


class Homemeetingbutton extends StatelessWidget {
  final VoidCallback onclick;
  final IconData icon;
  final String text;
  const Homemeetingbutton(
      {super.key,
      required this.onclick,
      required this.icon,
      required this.text});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onclick,
      child: Column(
        children: [
          Container(
            decoration: Decouration.CircleBorderDecoration(),
            width: 60,
            height: 60,
            child: Icon(
              icon,
              color: textColor,
              size: 30,
            ),
          ),
          size.height(10),
          Text(
            text,
            style: const TextStyle(
              color: textColor,
            ),
          )
        ],
      ),
    );
  }
}
