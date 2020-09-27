import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:whats_happening/app/router.dart';
import 'package:whats_happening/ui/constants.dart';
import 'package:whats_happening/util/dependency_provider.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(statusBarBrightness: Brightness.light));
    return DependencyProvider(child: _buildApp());
  }

  Widget _buildApp() {
    return MaterialApp(
      title: "What's happening",
      theme: ThemeData(
        scaffoldBackgroundColor: AppColors.lightGrey,
        primaryColor: AppColors.red,
        appBarTheme: AppBarTheme(
          brightness: Brightness.light,
          color: Colors.transparent,
          elevation: 0,
          textTheme: TextTheme(headline6: TextStyle(color: AppColors.darkGrey, fontSize: 18)),
        ),
      ),
      initialRoute: '/',
      onGenerateRoute: Router.generateRoute,
    );
  }
}
