import 'package:flutter/material.dart';
import './question.dart';
import './answer.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  //: - PROPERTIES
  var _questionIndex = 0;
  final questions = const [
    {
      'questionText': 'What is your favorite color?',
      'answers': ['Black', 'Red', 'Green', 'White'],
    },
    {
      'questionText': 'What is your favorite animal?',
      'answers': ['Rabbit', 'Snake', 'Elephant', 'Lion'],
    },
    {
      'questionText': 'Who is your favorite instructor?',
      'answers': ['Max', 'Max', 'Max', 'Max'],
    },
  ];

  //: - METHODS
  void _answerQuestion() {
    if (_questionIndex < questions.length) {
      setState(() {
        print('Answer chosen! Of Question $_questionIndex');
        _questionIndex++;
      });
    }
  }

  //: - BODY
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        title: Text(
          'My First App',
        ),
      ),
      body: Column(
        children: [
          Question(questions[_questionIndex]['questionText'].toString()),
          //This is a pretty good shortcut to generate a list of widgets in children property
          ...(questions[_questionIndex]['answers'] as List<String>)
              .map((e) => Answer(answerText: e, selectHandler: _answerQuestion))
              .toList(),
        ],
      ),
    ));
  }
}
