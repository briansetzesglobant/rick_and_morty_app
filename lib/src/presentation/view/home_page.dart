import 'package:flutter/material.dart';
import '../../core/util/constants.dart';
import '../../core/util/strings_constants.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    required this.title,
  });

  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.title,
        ),
        automaticallyImplyLeading: false,
      ),
      body: const Center(
        child: Text(
          StringsConstants.homePageText,
          style: TextStyle(
            fontSize: Constants.homePageTextSize,
            color: Colors.green,
            decoration: TextDecoration.underline,
          ),
        ),
      ),
    );
  }
}
