import 'package:flutter/material.dart';

// screens
import 'screens/eventList.dart';
import 'screens/eventAdd.dart';
import 'screens/settings.dart';
import './screens/timline_levels.dart';
import './views/recorder_home_view.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings){
    final args = settings.arguments;

    switch(settings.name){
      case 'event_list_screen':
        return MaterialPageRoute(builder: (context) => EventList());
      case 'event_add_screen':
        return MaterialPageRoute(builder: (context) => EventAdd());
      case 'settings_screen':
        return MaterialPageRoute(builder: (context) => SettingsScreen());
      case 'timeline_level_screen':
        return MaterialPageRoute(builder: (context) => TimelineScreen());
      case 'recorder_home_view':
        return MaterialPageRoute(builder: (context) => RecorderHomeView(title: 'title'));
      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute(){
    return MaterialPageRoute(builder: (context){
      return Scaffold(
        appBar: AppBar(
          title: Text('Error'),
          centerTitle: true,
        ),
        body: Center(
          child: Text('Page not found!'),
        ),
      );
    });
  }

}