import 'package:flutter/material.dart';
import 'package:movie_collection/page/about.dart';
import 'package:movie_collection/page/setting.dart';
import 'package:movie_collection/page/top.dart';

class TopWrapper extends StatefulWidget {
  const TopWrapper({super.key});

  @override
  State<StatefulWidget> createState() => _TopWrapperState();
}

class _TopWrapperState extends State<TopWrapper> {
  int _selectedIndex = 0;
  static const List<Widget> _widgetOptions = <Widget>[
    Top(),
    Setting(),
    About(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: const Text(
            'MovieCollection',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        backgroundColor: Colors.greenAccent,
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.local_movies),
            label: 'Trend',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Setting',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.question_mark),
            label: 'About App',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );
  }
}
