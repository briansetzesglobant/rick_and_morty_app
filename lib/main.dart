import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'src/config/route/app_routes.dart';
import 'src/core/util/routes_constants.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp();
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: RoutesConstants.splashScreenRoute,
      onGenerateRoute: AppRoutes.generateRoute,
    );
  }
}
