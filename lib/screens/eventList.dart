// import 'package:club_admin/screens/eventAdd.dart';
// import 'package:club_admin/screens/settings.dart';
import './settings.dart';
import './eventAdd.dart';
import 'package:flutter/material.dart';
import './timline_levels.dart';
import '../views/recorder_home_view.dart';
// import 'package:club_admin/screens/recorder_views/recorder_home_view.dart';
import 'package:provider/provider.dart';
import '../models/ProviderModels/TimerData.dart';
// import 'package:club_admin/models/ProviderModels/ex_model1.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:async';

class EventList extends StatefulWidget {
  static String id = 'event_list_screen';

  @override
  _EventListState createState() => _EventListState();
}

class _EventListState extends State<EventList> {
  // List _Events = [];
  // String? _userId;

  Widget widgetToRender() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TimelineScreen(),
    );
    // return Column(
    //   children: [
    //     Padding(
    //       padding: EdgeInsets.all(20.0),
    //       child: Container(
    //         decoration: BoxDecoration(
    //             borderRadius: BorderRadius.all(
    //               Radius.circular(20.0),
    //             ),
    //             color: Colors.white70),
    //         height: MediaQuery.of(context).size.height / 2,
    //         width: MediaQuery.of(context).size.width,
    //         child: Center(
    //             child: Text(
    //           'Here the text that must be read goes',
    //           style: TextStyle(),
    //         )),
    //       ),
    //     ),
    //     Text(
    //       '${Provider.of<TimerData>(context).timerCount}',
    //       style: TextStyle(color: Colors.white70, fontSize: 40.0),
    //     ),
    //     Padding(
    //       padding:
    //           EdgeInsets.only(top: MediaQuery.of(context).size.width / 4),
    //       child: FloatingActionButton(
    //         backgroundColor: const Color(0xFFcdb904),
    //         onPressed: () {
    //           // startTimer();
    //           Provider.of<TimerData>(context, listen: false).startTimer();
    //         },
    //         child: const Icon(
    //           Icons.mic_rounded,
    //           color: Colors.black,
    //         ),
    //       ),
    //     ),
    //   ],
    // );
  }

  // Future<void> fetchEvents() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   _userId = await prefs.getString("user_id");
  //   print(_userId);
  //   String url = "http://192.168.1.14:4000/api/users/user-events/${_userId}";
  //   var jsonResponse;
  //   var res = await http.get(Uri.parse(url), headers: <String, String>{
  //     'Content-Type': 'application/json; charset=UTF-8',
  //   });
  //   if (res.statusCode == 200) {
  //     jsonResponse = json.decode(res.body);
  //
  //     print('Response status: ${res.body}');
  //     print('Json Response: ${jsonResponse}');
  //   } else {
  //     print('Response status: ${res.statusCode}');
  //     print('Response status: ${res.body}');
  //     print('Response status: ${res}');
  //   }
  // }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // Provider.of<ClubData>(context, listen: false).loggedUser.setUserDetails();
    // _userId = Provider.of<ClubData>(context, listen: false).loggedUser.userId;
    // print(_userId);
    // fetchEvents();
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
          title: const Text('Levels'),
        ),
        body: widgetToRender(),
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
                  color: Color(0xFFcdb904),
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
                onPressed: () {
                  Navigator.pushNamed(context, RecorderHomeView.id);
                },
                icon: Icon(
                  Icons.record_voice_over_outlined,
                  color: Colors.white,
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
