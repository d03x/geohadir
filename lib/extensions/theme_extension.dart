import 'package:flutter/material.dart';

extension ThemeExtension on BuildContext {
  ColorScheme get colors {
    return Theme.of(this).colorScheme;
  }
}
