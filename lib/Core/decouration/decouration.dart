import 'package:flutter/material.dart';
import 'package:zoomclone/Core/Theming/Colors/pColors.dart';

class Decouration {
  static BoxDecoration CircleBorderDecoration() {
    return BoxDecoration(
        color: buttonColorlight,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            blurRadius: 10,
            color: Colors.black.withOpacity(0.06),
            offset: const Offset(0, 4),
          ),
        ]);
  }
}
