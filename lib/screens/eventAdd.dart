import 'package:flutter/material.dart';
import 'eventList.dart';
import 'settings.dart';

class EventAdd extends StatefulWidget {
  static String id = 'event_add_screen';

  @override
  _EventAddState createState() => _EventAddState();
}

class _EventAddState extends State<EventAdd> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Color(0xFF171717),
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Color(0xFF0000111),
          title: const Text('Practise Screen'),
        ),
        body: Container(child: Text('Practise screen', style: TextStyle(color: Colors.white),),),
        bottomNavigationBar: BottomAppBar(
          shape: CircularNotchedRectangle(),
          color: Color(0xFF000111),
          notchMargin: 6,
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                icon: Icon(
                  Icons.home,
                  color: Colors.white,
                  size: 30,
                ),
                onPressed: () {
                  Navigator.pushNamed(context, EventList.id);
                },
              ),
              IconButton(
                onPressed: () {
                  Navigator.pushNamed(context, EventAdd.id);
                },
                icon: Icon(
                  Icons.gamepad_outlined,
                  color: Color(0xFFcdb904),
                  size: 30,
                ),
              ),
              IconButton(
                icon: Icon(
                  Icons.settings,
                  color: Colors.white,
                  size: 30,
                ),
                onPressed: () {
                  Navigator.pushNamed(context, SettingsScreen.id);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
