import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../core/util/strings_constants.dart';
import '../../core/util/text_styles.dart';

class CharactersPage extends StatefulWidget {
  const CharactersPage({
    required this.title,
  });

  final String title;

  @override
  _CharactersPageState createState() => _CharactersPageState();
}

class _CharactersPageState extends State<CharactersPage> {
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
          StringsConstants.charactersPageText,
          style: TextStyles.style,
        ),
      ),
    );
  }
}
