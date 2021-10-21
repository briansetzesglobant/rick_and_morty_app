import 'package:flutter/material.dart';
import '../../core/util/strings_constants.dart';
import '../../core/util/text_styles.dart';

class LocationPage extends StatefulWidget {
  LocationPage({
    required this.title,
  });

  final String title;

  @override
  _LocationPageState createState() => _LocationPageState();
}

class _LocationPageState extends State<LocationPage> {
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
          StringsConstants.locationPage,
          style: TextStyles.style,
        ),
      ),
    );
  }
}
