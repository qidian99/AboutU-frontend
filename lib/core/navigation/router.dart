import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:aboutu/core/constants/app_constants.dart';
import 'package:aboutu/ui/views/home/home.dart';
import 'package:aboutu/core/navigation/bottom_tab_bar/bottom_navigation_bar_model.dart';
// import 'package:flutter/foundation.dart';

class Router {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    print('Routename: $settings.name');
    switch (settings.name) {
      case RoutePaths.BottomNavigationBar:
        return MaterialPageRoute(builder: (_) => BottomTabBar());
      // case RoutePaths.Home:
      //   return MaterialPageRoute(builder: (_) => RandomWords());
    }

  }
}