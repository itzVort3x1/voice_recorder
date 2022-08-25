

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:voice_recorder/route_generator.dart';
import 'package:voice_recorder/screens/eventList.dart';
// import 'package:voice_reocrder/views/recorder_home_view.dart';
import './views/recorder_home_view.dart';
import './models/ProviderModels/TimerData.dart';
import './models/ProviderModels/LevelData.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<TimerData>(
            create: (context) => TimerData()
        ),
        ChangeNotifierProvider<LevelData>(
            create: (context) => LevelData()
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Club App',
        theme: ThemeData.dark(),
        initialRoute: EventList.id,
        onGenerateRoute: RouteGenerator.generateRoute,
        onUnknownRoute: (RouteSettings settings) {
          return MaterialPageRoute(builder: (BuildContext context) =>
              Scaffold(body: Center(child: Text('Not Found'),),),);
        },
        // home: RecorderHomeView(
        //   title: 'Flutter Voice',
        // ),
      ),
    );
  }
}