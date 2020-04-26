import 'package:flutter/material.dart';
import 'main.dart';
import 'story_brain.dart';

class ChoiceButton extends StatefulWidget {
  @override
  _ChoiceButtonState createState() => _ChoiceButtonState();

  final int choiceNumber;
  final MaterialColor color;
  final StoryBrain storyBrain;

  ChoiceButton({
    Key key,
    this.choiceNumber,
    this.color,
    this.storyBrain,
  }) : super(key: key);
}

class _ChoiceButtonState extends State<ChoiceButton> {
  @override
  Widget build(BuildContext context) {
    final visible =
        widget.storyBrain.choiceShouldBeVisible(widget.choiceNumber);

    return Expanded(
      flex: 2,
      child: Visibility(
        visible: visible,
        child: FlatButton(
          onPressed: () {
            // TODO: figure out a better way to do this
            context.findAncestorStateOfType<StoryPageState>().setState(
                () => widget.storyBrain.nextStory(widget.choiceNumber));
          },
          color: widget.color,
          child: Text(
            visible ? widget.storyBrain.getChoiceText(widget.choiceNumber) : '',
            style: TextStyle(
              fontSize: 20.0,
            ),
          ),
        ),
      ),
    );
  }
}
