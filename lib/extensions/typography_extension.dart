import 'package:flutter/material.dart';

extension TypographyExtension on BuildContext {
  TextTheme get textTheme {
    return Theme.of(this).textTheme;
  }
}
