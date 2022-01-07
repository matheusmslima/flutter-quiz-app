import 'package:flutter/material.dart';

import 'package:flutter_complete_guide/result.dart';
import './quiz.dart';

// todo app precisa de uma main1
//void main() {
//const int x = 1;
//At compile time, the value of x is going to be 1 and will not change.
//  runApp(const QuizApp());
//}

void main() => runApp(QuizApp());

// extends é a keyword utilizada para inheritance de uma classe
// ignore: use_key_in_widget_constructors
class QuizApp extends StatefulWidget {
  // we want to change the state stateful
  @override
  State<StatefulWidget> createState() => _QuizAppState();
}

class _QuizAppState extends State<QuizApp> {
  // the _ class into a private class
  // State is persistent
  //QuizApp({Key? key}) : super(key: key);

  //const QuizApp({Key? key}) : super(key: key);
  // That's correct! build() returns a so-called "widget tree"
  // which tells Flutter what to draw onto the screen.

  //BuildContext is a type of object, context is a object of type BuildContext
  //build needs to return something, this something is a widget
  //anotacao que indica que vou sobrescrever uma classe mãe
  final _questions = const [
    // maps
    {
      'questionText': "What's your favorite color?",
      'answers': [
        {'text': 'Black', 'score': 10},
        {'text': 'Red', 'score': 5},
        {'text': 'Green', 'score': 3},
        {'text': 'White', 'score': 1}
      ],
    },
    {
      'questionText': "What's your favorite animal?",
      'answers': [
        {'text': 'Rabbit', 'score': 3},
        {'text': 'Snake', 'score': 11},
        {'text': 'Elephant', 'score': 5},
        {'text': 'Lion', 'score': 9}
      ],
    },
    {
      'questionText': "What's your favorite car?",
      'answers': [
        {'text': 'Ferrari F50', 'score': 5},
        {'text': 'AMG C63 GT', 'score': 1},
        {'text': 'BMW M8', 'score': 8},
        {'text': 'Jaguar F-Type', 'score': 7}
      ],
    },
  ];

  var _questionIndex = 0;
  var _totalScore = 0;

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  void _answerQuestion(int score) {
    _totalScore += score;

    setState(() {
      _questionIndex++;
    });
  }

  @override // deliberatly overrinding the default class
  Widget build(BuildContext context) {
    // LIST of questions ...
    // LISTS OF DATA, LISTS OF CONTACTS

    // MaterialApp takes NAMED arguments DONT NEED TO BE IN ORDER
    //const int x = 1;
    //At compile time, the value of x is going to be 1 and will not change.
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Quiz App"), // o const nao muda
          // com hot reload
        ),
        // GENERIC TYPES <Widget> list of widgets
        body: _questionIndex < _questions.length
            ? Quiz(
                answerQuestion: _answerQuestion,
                questionIndex: _questionIndex,
                questions: _questions,
              )
            : Result(_totalScore, _resetQuiz),
      ),
    );
  }
}
