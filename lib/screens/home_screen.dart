import 'package:city_guide_app/screens/events_screen.dart';
import 'package:city_guide_app/screens/guide_screen.dart';
import 'package:city_guide_app/screens/places_screen.dart';
import 'package:city_guide_app/screens/sleep_screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = '/home';
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var _selectedItem = 0;

  void _barCallback(int index) {
    setState(() {
      _selectedItem = index;
    });
  }

  final _pages = <Widget>[
    const EventsScreen(),
    PlacesScreen(),
    SleepScreen(),
    GuideScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(children: _pages,
      index: _selectedItem,),
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selectedItem,
          onTap: _barCallback,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.event_note_outlined),
              label: 'Events',
              backgroundColor: Colors.green[300],
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.place_outlined),
              label: 'Places',
              backgroundColor: Colors.green[300],
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.hotel_outlined),
              label: 'Accomodation',
              backgroundColor: Colors.green[300],
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.tour_outlined),
              label: 'Tour',
              backgroundColor: Colors.green[300],
            )
          ]),
    );
  }
}
