import 'package:provider/single_child_widget.dart';
import 'package:provider/provider.dart';
import 'package:aboutu/core/services/bottom_navigation_bar_service.dart';

List<SingleChildWidget> providers = [ ...independentServices ];



List<SingleChildWidget> independentServices = [
  ChangeNotifierProvider<BottomNavigationBarProvider>(
    create: (_) => BottomNavigationBarProvider(),
  ),
];