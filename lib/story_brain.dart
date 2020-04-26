import 'story.dart';
import 'choice.dart';

class StoryBrain {
  static final List<Story> _storyData = [
    /*
    *  0 -> 2 | 1
    *  1 -> 2 | 3
    *  2 -> 5 | 4
    *  3-5 -> end
    */
    Story(
      // _storyData[0]
      storyTitle:
          'Your car has blown a tire on a winding road in the middle of nowhere with no cell phone reception. You decide to hitchhike. A rusty pickup truck rumbles to a stop next to you. A man with a wide brimmed hat with soulless eyes opens the passenger door for you and asks: "Need a ride, boy?".',
      choices: <Choice>[
        Choice(
          text: 'I\'ll hop in. Thanks for the help!',
          nextStory: 2,
        ),
        Choice(
          text: 'Better ask him if he\'s a murderer first.',
          nextStory: 1,
        ),
      ],
    ),
    Story(
      // _storyData[1]
      storyTitle: 'He nods slowly, unphased by the question.',
      choices: <Choice>[
        Choice(
          text: 'At least he\'s honest. I\'ll climb in.',
          nextStory: 2,
        ),
        Choice(
          text: 'Wait, I know how to change a tire.',
          nextStory: 3,
        ),
      ],
    ),
    Story(
      // _storyData[2]
      storyTitle:
          'As you begin to drive, the stranger starts talking about his relationship with his mother. He gets angrier and angrier by the minute. He asks you to open the glovebox. Inside you find a bloody knife, two severed fingers, and a cassette tape of Elton John. He reaches for the glove box.',
      choices: <Choice>[
        Choice(
          text: 'I love Elton John! Hand him the cassette tape.',
          nextStory: 5,
        ),
        Choice(
          text: 'It\'s him or me! You take the knife and stab him.',
          nextStory: 4,
        ),
      ],
    ),
    Story(
      // _storyData[3]
      storyTitle:
          'What? Such a cop out! Did you know traffic accidents are the second leading cause of accidental death for most adult age groups?',
      choices: _generateRestart(),
    ), // Story
    Story(
      // _storyData[4]
      storyTitle:
          'As you smash through the guardrail and careen towards the jagged rocks below you reflect on the dubious wisdom of stabbing someone while they are driving a car you are in.',
      choices: _generateRestart(),
    ), // Story
    Story(
      // _storyData[5]
      storyTitle:
          'You bond with the murderer while crooning verses of "Can you feel the love tonight". He drops you off at the next town. Before you go he asks you if you know any good places to dump bodies. You reply: "Try the pier".',
      choices: _generateRestart(),
    ), // Story
  ];

  int _storyNumber = 0;

  String getStory() => _storyData[_storyNumber].storyTitle;

  String getChoiceText(int choiceNumber) => choiceShouldBeVisible(choiceNumber)
      ? _storyData[_storyNumber].choices[choiceNumber - 1].text
      : '';

  bool choiceShouldBeVisible(int choiceNumber) {
    return choiceNumber > 0 &&
        choiceNumber <= _storyData[_storyNumber].choices.length;
  }

  void nextStory(int choiceNumber) {
    Choice choice = _storyData[_storyNumber].choices[choiceNumber - 1];

    _storyNumber = choice.isRestart ? 0 : choice.nextStory;
  }

  static List<Choice> _generateRestart() => <Choice>[
        Choice(
          text: 'Restart',
          nextStory: 0,
          isRestart: true,
        ),
      ];
}
