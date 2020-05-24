import 'package:flutter/material.dart';
import 'package:aboutu/core/constants/app_constants.dart';
import 'package:aboutu/core/navigation/router.dart';
import 'package:aboutu/core/data_providers/provider_setup.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: providers,
        child: MaterialApp(
            title: 'Startup Name Generator',
            theme: ThemeData(
              primaryColor: Colors.white,
            ),
            initialRoute: RoutePaths.BottomNavigationBar,
            onGenerateRoute: Router.generateRoute));
  }
}
