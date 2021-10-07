import 'package:flutter/material.dart';
import '../../core/util/constants.dart';
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
  late int _page;
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _page = Constants.page;
    _pageController = PageController(
      initialPage: _page,
    );
  }

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
        controller: _pageController,
        onPageChanged: (newPage) {
          setState(() {
            _page = newPage;
          });
        },
        children: const <Widget>[
          CharactersPage(
            title: StringsConstants.charactersPage,
          ),
          SeasonsPage(
            title: StringsConstants.seasonsPage,
          ),
          LocationsPage(
            title: StringsConstants.locationsPage,
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _page,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.accessibility),
            label: StringsConstants.charactersPage,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.movie),
            label: StringsConstants.seasonsPage,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.location_on),
            label: StringsConstants.locationsPage,
          ),
        ],
        onTap: (index) {
          _pageController.animateToPage(
            index,
            duration: const Duration(milliseconds: 500),
            curve: Curves.ease,
          );
        },
      ),
    );
  }
}
