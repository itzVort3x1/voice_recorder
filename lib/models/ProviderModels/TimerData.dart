import 'package:flutter/material.dart';
import 'dart:async';

class TimerData extends ChangeNotifier {

  late Timer _timer;
  late bool _isListening = false;
  int _start = 5;

  int get timerCount{
    return _start;
  }

  bool get isListening{
    return _isListening;
  }

  void startTimer() {
    _isListening = true;
    const oneSec = Duration(seconds: 1);
    _timer = Timer.periodic(
      oneSec,
          (Timer timer) {
        if (_start == 0) {
          // setState(() {
          _isListening = false;
          timer.cancel();
          _start = 5;
          notifyListeners();
          // });
        } else {
          // setState(() {
          _start--;
          notifyListeners();
          // });
        }
      },
    );
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }
}