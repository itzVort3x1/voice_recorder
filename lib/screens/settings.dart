import 'package:flutter/material.dart';
// import 'package:club_admin/screens/eventAdd.dart';
import './eventAdd.dart';
import './eventList.dart';
// import 'package:club_admin/screens/eventList.dart';

class SettingsScreen extends StatefulWidget {
  static String id = 'settings_screen';

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  Widget SettingsBody() {
    return Center(
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
            child: CircleAvatar(
              radius: 75.0,
              backgroundColor: Colors.amberAccent,
              child: CircleAvatar(
                backgroundImage:
                NetworkImage('https://picsum.photos/id/237/200/300'),
                radius: 72.0,
              ),
            ),
          ),
          SizedBox(
            height: 30.0,
          ),
          Row(
            children: [
              Container(
                child: Text(
                  'Account Name: John Doe',
                  style: TextStyle(color: Colors.white, fontSize: 20.0),
                ),
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.width,
                  left: 20.0,
                  right: 20.0,
                ),
                child: ElevatedButton(
                  onPressed: () {},
                  child: Padding(
                    padding: EdgeInsets.only(top: 15.0, bottom: 15.0),
                    child: Text(
                      'Logout',
                      style: TextStyle(
                          color: Colors.black87,
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.amber),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Color(0xFF171717),
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Color(0xFF0000111),
          title: const Text('Settings'),
        ),
        body: SettingsBody(),
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
                  color: Colors.white,
                  size: 30,
                ),
              ),
              IconButton(
                icon: Icon(
                  Icons.settings,
                  color: Color(0xFFcdb904),
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
