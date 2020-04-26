import 'package:flutter/material.dart';
import 'story_brain.dart';
import 'choice_button.dart';

void main() => runApp(Destini());

class Destini extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: StoryPage(),
    );
  }
}

StoryBrain storyBrain = StoryBrain();

class StoryPage extends StatefulWidget {
  StoryPageState createState() => StoryPageState();
}

class StoryPageState extends State<StoryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: _generateBackground(),
        padding: EdgeInsets.symmetric(vertical: 50.0, horizontal: 15.0),
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Expanded(
                flex: 12,
                child: Center(
                  child: Text(
                    storyBrain.getStory(),
                    style: TextStyle(
                      fontSize: 25.0,
                    ),
                  ),
                ),
              ),
              ChoiceButton(
                choiceNumber: 1,
                color: Colors.red,
                storyBrain: storyBrain,
              ),
              SizedBox(height: 20.0),
              ChoiceButton(
                choiceNumber: 2,
                color: Colors.blue,
                storyBrain: storyBrain,
              ),
            ],
          ),
        ),
      ),
    );
  }

  static BoxDecoration _generateBackground() => BoxDecoration(
        image: DecorationImage(
          image: AssetImage('images/background.png'),
          fit: BoxFit.cover,
        ),
      );
}
