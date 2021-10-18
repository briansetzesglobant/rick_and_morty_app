import 'package:flutter/material.dart';
import '../../core/util/strings_constants.dart';
import '../../core/util/text_styles.dart';

class CharacterPage extends StatefulWidget {
  const CharacterPage({
    required this.title,
  });

  final String title;

  @override
  _CharacterPageState createState() => _CharacterPageState();
}

class _CharacterPageState extends State<CharacterPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.title,
        ),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          StringsConstants.characterPage,
          style: TextStyles.style,
        ),
      ),
    );
  }
}
