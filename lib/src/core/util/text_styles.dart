import 'package:flutter/material.dart';
import 'numbers_constants.dart';

abstract class TextStyles {
  static const TextStyle style = TextStyle(
    fontSize: NumbersConstants.pageTextSize,
    color: Colors.green,
    decoration: TextDecoration.underline,
  );
  static const TextStyle styleCharacterName = TextStyle(
    fontSize: NumbersConstants.pageTextSizeCharacterName,
    color: Colors.blueGrey,
    decoration: TextDecoration.underline,
  );
}
