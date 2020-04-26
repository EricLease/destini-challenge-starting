import 'package:flutter/cupertino.dart';
import 'choice.dart';

class Story {
  final String storyTitle;
  final List<Choice> choices;

  Story({
    @required this.storyTitle,
    @required this.choices,
  })  : assert(choices != null),
        assert(0 < choices.length),
        assert(choices.length < 3);
}
