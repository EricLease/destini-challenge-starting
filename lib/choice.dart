import 'package:flutter/cupertino.dart';
import 'story.dart';

class Choice {
  final String text;
  final int nextStory;
  final bool isRestart;

  Choice({
    @required this.text,
    @required this.nextStory,
    this.isRestart = false,
  });
}
