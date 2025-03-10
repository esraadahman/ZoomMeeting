import 'package:flutter/material.dart';
import 'package:zoomclone/Core/Theming/Colors/pColors.dart';
import 'package:zoomclone/Core/Theming/Size/pSize.dart';

class Custombutton extends StatelessWidget {
  const Custombutton({super.key, required this.text,required this.onPressed});
  final String text;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: buttonColor,
        minimumSize: Size(width(context) / 1.5, height(context) / 17),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
          side: const BorderSide(color: buttonColor),
        ),
      ),
      child: Text(text, style: const TextStyle(fontSize: 18, color: textColor)),
    );
  }
}
