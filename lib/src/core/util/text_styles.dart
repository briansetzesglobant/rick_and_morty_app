import 'package:flutter/material.dart';
import 'numbers_constants.dart';

abstract class TextStyles {
  static const TextStyle style = TextStyle(
    fontSize: NumbersConstants.pageTextSize,
    color: Colors.green,
    decoration: TextDecoration.underline,
  );
}
