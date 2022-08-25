import 'package:flutter/material.dart';
import '../level.dart';

class LevelData extends ChangeNotifier {
  List<Level> _levels = [
    Level(
        level: '1',
        readingData: [
          "This is the sample text for Flutter TextScroll widget.",
          "This is the sample text for Flutter TextScroll widget asdfasdf asd fas df asd fsdf."
        ],
        unlocked: true,
    ),
    Level(
        level: '2',
        readingData: ["NCERT Text will be displayed here"],
        unlocked: false,
    ),
    Level(
        level: '3',
        readingData: ["NCERT Text will be displayed here"],
        unlocked: false,
    ),
    Level(
        level: '4',
        readingData: ["NCERT Text will be displayed here"],
        unlocked: false,
    ),
    Level(
        level: '5',
        readingData: ["NCERT Text will be displayed here"],
        unlocked: false,
    ),
    Level(
        level: '6',
        readingData: ["NCERT Text will be displayed here"],
        unlocked: false),
    Level(
        level: '7',
        readingData: ["NCERT Text will be displayed here"],
        unlocked: false),
    Level(
        level: '8',
        readingData: ["NCERT Text will be displayed here"],
        unlocked: false),
    Level(
        level: '9',
        readingData: ["NCERT Text will be displayed here"],
        unlocked: false),
    Level(
        level: '10',
        readingData: ["NCERT Text will be displayed here"],
        unlocked: false),
  ];

  int get levelCount {
    return _levels.length;
  }

  Level levelData(int index) {
    return _levels[index];
  }

  bool getIsUnlocked(int index) {
    return _levels[index].unlocked;
  }

  String? getSentence(int index, int sentenceIndex){
    return _levels[index - 1].readingData[sentenceIndex];
  }

}
