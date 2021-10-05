import 'package:flutter/material.dart';
import 'constants.dart';

abstract class TextStyles {
  static const TextStyle style = TextStyle(
    fontSize: Constants.pageTextSize,
    color: Colors.green,
    decoration: TextDecoration.underline,
  );
}
