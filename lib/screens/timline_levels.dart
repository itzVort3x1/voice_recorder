import 'dart:developer';

import '../models/ProviderModels/LevelData.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:timelines/timelines.dart';
import './gameScreen.dart';
import '../models/ProviderModels/LevelData.dart';

class TimelineScreen extends StatefulWidget {
  static String id = 'timeline_level_screen';

  @override
  State<TimelineScreen> createState() => _TimelineScreenState();
}

class _TimelineScreenState extends State<TimelineScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: SingleChildScrollView(
        child: FixedTimeline.tileBuilder(
          theme: TimelineThemeData(color: Colors.amber),
          builder: TimelineTileBuilder.connectedFromStyle(
              contentsAlign: ContentsAlign.alternating,
              // oppositeContentsBuilder: (context, index) => Padding(
              //       padding: EdgeInsets.all(8.0),
              //       child: Text('opposite\ncontents', style: TextStyle(color: Colors.white),),
              //     ),
              contentsBuilder: (context, index) => InkWell(
                    onTap: () {
                      final level =
                          Provider.of<LevelData>(context, listen: false)
                              .levelData(index);
                      if(Provider.of<LevelData>(context, listen: false).getIsUnlocked(index)){
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => GameScreen(level: level),
                          ),
                        );
                      }
                    },
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(10, 20.0, 10, 20.0),
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(
                              Radius.circular(25.0),
                            ),
                            color: Colors.amberAccent),
                        width: MediaQuery.of(context).size.width,
                        padding: EdgeInsets.all(20.0),
                        child: Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Level ${index + 1}',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                width: 10.0,
                              ),
                              Icon(
                                  !Provider.of<LevelData>(context)
                                          .getIsUnlocked(index)
                                      ? Icons.lock_outline_rounded
                                      : null,
                                  size: 20.0),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
              connectorStyleBuilder: (context, index) =>
                  ConnectorStyle.solidLine,
              indicatorStyleBuilder: (context, index) =>
                  IndicatorStyle.outlined,
              itemCount: Provider.of<LevelData>(context).levelCount),
        ),
      ),
    );
  }
}
