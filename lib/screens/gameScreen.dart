import 'dart:async';

import 'package:voice_recorder/screens/sound_recorder.dart';

import '../models/ProviderModels/LevelData.dart';
import '../models/level.dart';
import '../models/ProviderModels/TimerData.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import "package:avatar_glow/avatar_glow.dart";
import 'package:speech_to_text/speech_to_text.dart' as stt;
import 'package:highlight_text/highlight_text.dart';
import '../widgets/figure_image.dart';
import 'package:text_scroll/text_scroll.dart';
import '../views/recorder_view.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';

class GameScreen extends StatefulWidget {
  static String id = 'game_screen';
  final Level level;

  GameScreen({required this.level});

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {

  // final recorder = SoundRecorder();

  late Directory appDirectory;
  List<String> records = [];

  bool isRecording = false;

  int sentenceIndex = 0;
  int hangmanIndex = 1;
  bool head = false;
  bool body = false;
  bool lhand = false;
  bool rhand = false;
  bool lleg = false;
  bool rleg = false;

  @override
  void initState() {
    super.initState();
    getApplicationDocumentsDirectory().then((value) {
      appDirectory = value;
      appDirectory.list().listen((onData) {
        if (onData.path.contains('.aac')) {
          // final dir = Directory(onData.path);
          // dir.deleteSync(recursive: true);
          records.add(onData.path);
        }
      }).onDone(() {
        records = records.reversed.toList();
        setState(() {});
      });
    });
  }

  @override
  void dispose() {
    appDirectory.delete();
    super.dispose();
  }


  // @override
  // void initState(){
  //   super.initState();
  //
  //   recorder.init();
  // }
  //
  // @override
  // void dispose(){
  //   recorder.dispose();
  //
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    final icon = isRecording ? Icons.stop : Icons.mic_none_outlined;
    print(records);

    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xFF171717),
        appBar: AppBar(
          title: Text('Level ${widget.level.level}'),
          backgroundColor: Colors.black,
        ),
        body: Column(
          children: [
            Center(
              child: Stack(
                children: [
                  figureImage(true, 'assets/hang.png'),
                  figureImage(head, 'assets/head.png'),
                  figureImage(body, 'assets/body.png'),
                  figureImage(lhand, 'assets/la.png'),
                  figureImage(lleg, 'assets/ll.png'),
                  figureImage(rhand, 'assets/ra.png'),
                  figureImage(rleg, 'assets/rl.png'),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 100.0, left: 25.0, right: 25.0),
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(20.0),
                    ),
                    color: Colors.white),
                height: MediaQuery
                    .of(context)
                    .size
                    .height / 8,
                width: MediaQuery
                    .of(context)
                    .size
                    .width,
                child: Center(
                    child: TextScroll(
                        Provider.of<LevelData>(context).getSentence(
                            int.parse(widget.level.level),
                            sentenceIndex)!,
                        style: TextStyle(
                          // letterSpacing: 3,
                            fontSize: 30.0
                        ),
                        textDirection: TextDirection.ltr,
                        textAlign: TextAlign.right,
                        velocity: Velocity(pixelsPerSecond: Offset(20, 0),)
                    )
                ),
              ),
            ),
            // Text(
            //   '${Provider.of<TimerData>(context).timerCount}',
            //   style: TextStyle(color: Colors.white70, fontSize: 40.0),
            // ),
            RecorderView(onSaved: _onRecordComplete)
            // Padding(
            //   padding:
            //   EdgeInsets.only(top: MediaQuery
            //       .of(context)
            //       .size
            //       .width / 3),
            //   child: AvatarGlow(
            //     animate: Provider
            //         .of<TimerData>(context)
            //         .isListening,
            //     glowColor: const Color(0xFFcdb904),
            //     endRadius: 75.0,
            //     duration: const Duration(milliseconds: 2000),
            //     repeatPauseDuration: const Duration(milliseconds: 100),
            //     repeat: true,
            //     child: FloatingActionButton(
            //       backgroundColor: const Color(0xFFcdb904),
            //       onPressed: () async {
            //         final isRecording = await recorder.toggleRecording();
            //         print(recorder.audioPath);
            //         // setState(() {
            //         //   if(hangmanIndex == 1){
            //         //     head = true;
            //         //     body = true;
            //         //   }else if(hangmanIndex == 2){
            //         //     lhand = true;
            //         //   }else if(hangmanIndex == 3){
            //         //     rhand = true;
            //         //   }else if(hangmanIndex == 4){
            //         //     lleg = true;
            //         //   }else if(hangmanIndex == 5){
            //         //     rleg = true;
            //         //   }
            //         //   hangmanIndex += 1;
            //         // });
            //       },
            //       child: Icon(
            //         // Icons.mic_rounded,
            //         icon,
            //         color: Colors.black,
            //       ),
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
  _onRecordComplete() {
    records.clear();
    appDirectory.list().listen((onData) {
      if (onData.path.contains('.aac')) records.add(onData.path);
    }).onDone(() {
      records.sort();
      records = records.reversed.toList();
      setState(() {});
    });
  }

}