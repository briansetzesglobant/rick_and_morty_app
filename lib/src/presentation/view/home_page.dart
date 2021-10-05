import 'package:flutter/material.dart';
import '../../core/util/strings_constants.dart';
import 'characters_page.dart';
import 'locations_page.dart';
import 'seasons_page.dart';

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
        centerTitle: true,
      ),
      body: PageView(
        children: const <Widget>[
          CharactersPage(
            title: StringsConstants.charactersPageTitle,
          ),
          SeasonsPage(
            title: StringsConstants.seasonsPageTitle,
          ),
          LocationsPage(
            title: StringsConstants.locationsPageTitle,
          ),
        ],
      ),
    );
  }
}
