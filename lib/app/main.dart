import 'package:flutter/material.dart';

import 'package:whats_happening/app/router.dart';
import 'package:whats_happening/util/dependency_provider.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DependencyProvider(child: _buildApp());
  }

  Widget _buildApp() {
    return MaterialApp(
      title: "What's happening",
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      onGenerateRoute: Router.generateRoute,
    );
  }
}
