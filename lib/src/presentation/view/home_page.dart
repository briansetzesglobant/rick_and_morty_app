import 'package:flutter/material.dart';
import '../../core/util/numbers_constants.dart';
import '../../core/util/strings_constants.dart';
import 'character_page.dart';
import 'location_page.dart';
import 'season_page.dart';

class HomePage extends StatefulWidget {
  HomePage({
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
    _page = NumbersConstants.page;
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
        children: <Widget>[
          CharacterPage(
            title: StringsConstants.characterPage,
          ),
          SeasonPage(
            title: StringsConstants.seasonPage,
          ),
          LocationPage(
            title: StringsConstants.locationPage,
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _page,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.accessibility),
            label: StringsConstants.characterPage,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.movie),
            label: StringsConstants.seasonPage,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.location_on),
            label: StringsConstants.locationPage,
            backgroundColor: Colors.orange,
          ),
        ],
        onTap: (index) {
          _pageController.animateToPage(
            index,
            duration: const Duration(milliseconds: NumbersConstants.duration),
            curve: Curves.ease,
          );
        },
      ),
    );
  }
}
