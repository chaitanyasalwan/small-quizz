import 'package:flutter/material.dart';
import 'package:second_app/question.dart';
import 'package:second_app/quiz.dart';
import './answer.dart';
import './result.dart';

//void main() {
// runApp(MyApp());
//}

void main() => runApp(MyApp()); //anonymous function

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  // public to private _

  final _questions = const [
    // final is runtime constant and const is a compile time constant
    {
      'questionText': 'What\'s your favourite color ?',
      'answers': [
        {'text': 'Black', 'score': 10},
        {'text': 'Green', 'score': 5},
        {'text': 'Yellow', 'score': 3},
        {'text': 'Red', 'score': 1},
      ],
    },
    {
      'questionText': 'What\'s your favourite Animal ?',
      'answers': [
        {'text': 'Lion', 'score': 10},
        {'text': 'Rabbit', 'score': 5},
        {'text': 'Elephant', 'score': 3},
        {'text': 'Snake', 'score': 9},
      ],
    },
    {
      'questionText': 'What\'s my name?',
      'answers': [
        {'text': 'Max', 'score': 1},
        {'text': 'Max', 'score': 1},
        {'text': 'Max', 'score': 1},
        {'text': 'Max', 'score': 1},
      ],
    },
  ];
  var _index = 0;
  var _totalscore = 0;
  void _resetQuiz() {
    setState(() {
      _index = 0;
      _totalscore = 0;
    });
  }

  void _answerquestion(int score) {
    var aBool = true;
    if (_index < _questions.length) {}
    _totalscore = _totalscore + score;
    setState(() {
      _index = _index + 1;
    });

    print(_index);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('My First App'),
        ),
        body: _index < _questions.length
            ? Quiz(
                answerquestion: _answerquestion,
                index: _index,
                questions: _questions,
              )
            : Result(_totalscore, _resetQuiz),
      ), // named arguments  //Scaffold gives a background
    );
  }
}
