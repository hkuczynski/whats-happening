import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppPageRoutes {
  static PageRoute adaptiveRoute({WidgetBuilder builder, RouteSettings settings, bool fullscreen}) {
    return Platform.isIOS
        ? CupertinoPageRoute(
            builder: builder,
            fullscreenDialog: fullscreen ?? false,
            settings: settings,
          )
        : MaterialPageRoute(
            builder: builder,
            fullscreenDialog: fullscreen ?? false,
            settings: settings,
          );
  }
}
