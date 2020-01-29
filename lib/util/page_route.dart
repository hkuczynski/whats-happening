import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class AppPageRoutes {
  static PageRoute defaultRoute({WidgetBuilder builder, RouteSettings settings, bool fullscreen}) {
    return Platform.isIOS
        ? CupertinoPageRoute(
            settings: settings,
            fullscreenDialog: fullscreen ?? false,
            builder: builder,
          )
        : MaterialPageRoute(builder: builder, settings: settings);
  }

  static PageRoute fadeRoute({WidgetBuilder builder, RouteSettings settings}) =>
      _FadePageRoute(builder, settings: settings);
}

class _FadePageRoute<T> extends MaterialPageRoute<T> {
  _FadePageRoute(WidgetBuilder builder, {RouteSettings settings}) : super(builder: builder, settings: settings);

  @override
  Widget buildTransitions(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child,
  ) {
    if (settings.isInitialRoute) return child;
    return FadeTransition(opacity: animation, child: child);
  }
}
