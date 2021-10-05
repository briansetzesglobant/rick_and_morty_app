import 'package:flutter/material.dart';
import '../../core/util/strings_constants.dart';
import '../../core/util/text_styles.dart';

class LocationsPage extends StatefulWidget {
  const LocationsPage({
    required this.title,
  });

  final String title;

  @override
  _LocationsPageState createState() => _LocationsPageState();
}

class _LocationsPageState extends State<LocationsPage> {
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
          StringsConstants.locationsPageText,
          style: TextStyles.style,
        ),
      ),
    );
  }
}
