import 'package:flutter/material.dart';
import '../../core/util/numbers_constants.dart';
import '../../core/util/routes_constants.dart';
import '../../core/util/strings_constants.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen();

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigateToHome();
  }

  Future<void> _navigateToHome() async {
    await Future.delayed(
      const Duration(
        milliseconds: NumbersConstants.splashScreenDuration,
      ),
      () {
        Navigator.of(context).pushReplacementNamed(
          RoutesConstants.homeRoute,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    StringsConstants.splashScreenImage,
                  ),
                  fit: BoxFit.fill,
                ),
              ),
            ),
            const Positioned(
              left: NumbersConstants.splashScreenPositionedLeft,
              right: NumbersConstants.splashScreenPositionedRight,
              bottom: NumbersConstants.splashScreenPositionedBottom,
              child: LinearProgressIndicator(
                backgroundColor: Colors.grey,
                valueColor: AlwaysStoppedAnimation<Color>(
                  Colors.green,
                ),
                minHeight: NumbersConstants.splashScreenLinearMinHeight,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
