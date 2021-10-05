import 'package:flutter/material.dart';
import '../../core/util/strings_constants.dart';
import '../../core/util/text_styles.dart';

class SeasonsPage extends StatefulWidget {
  const SeasonsPage({
    required this.title,
  });

  final String title;

  @override
  _SeasonsPageState createState() => _SeasonsPageState();
}

class _SeasonsPageState extends State<SeasonsPage> {
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
          StringsConstants.seasonsPageText,
          style: TextStyles.style,
        ),
      ),
    );
  }
}
