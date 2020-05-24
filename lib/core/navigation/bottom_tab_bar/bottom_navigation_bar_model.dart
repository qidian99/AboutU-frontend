import 'package:flutter/material.dart';
import 'package:aboutu/ui/views/home/home.dart';
import 'package:aboutu/ui/views/profile/profile.dart';
import 'package:provider/provider.dart';
import 'package:aboutu/core/services/bottom_navigation_bar_service.dart';

class BottomTabBar extends StatefulWidget {
  @override
  _BottomTabBarState createState() => _BottomTabBarState();
}

class _BottomTabBarState extends State<BottomTabBar> {
  var currentTab = [
    RandomWords(),
    Profile(),
  ];

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<BottomNavigationBarProvider>(context); 
    return Scaffold(
     appBar: provider.currentIndex != 0 ? PreferredSize(
        preferredSize: Size.fromHeight(42),
        child: AppBar(
          primary: true,
          centerTitle: true,
          title:Text("AboutU"),
        ),
      ): null,
      body: currentTab[provider.currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: provider.currentIndex,
        onTap: (index) {
          print('index is $index');
          provider.currentIndex = index;
        },
        items: [
          BottomNavigationBarItem(
            icon: new Icon(Icons.home),
            title: new Text('Home'),
          ),
          BottomNavigationBarItem(
            icon: new Icon(Icons.portrait),
            title: new Text('Profile'),
          ),
        ],
        showSelectedLabels: false,
        showUnselectedLabels: false,
        selectedItemColor: IconTheme.of(context).color,
        unselectedItemColor: Colors.grey.shade500,
      ),
    );
  }
}
