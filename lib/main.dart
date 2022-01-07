import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/answer.dart';

import './question.dart';

// todo app precisa de uma main1
//void main() {
//const int x = 1;
//At compile time, the value of x is going to be 1 and will not change.
//  runApp(const QuizApp());
//}

void main() => runApp(QuizApp());

// extends é a keyword utilizada para inheritance de uma classe
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
  final questions = const [
    // maps
    {
      'questionText': "What's your favorite color?",
      'answers': ['Black', 'Red', 'Green', 'White'],
    },
    {
      'questionText': "What's your favorite animal?",
      'answers': ['Rabbit', 'Snake', 'Elephant', 'Lion'],
    },
    {
      'questionText': "What's your favorite car?",
      'answers': ['Ferrari F50', 'AMG C63 GT', 'BMW M8', 'Jaguar F-Type'],
    },
  ];

  var _questionIndex = 0;

  void _answerQuestion() {
    setState(() {
      _questionIndex++;
    });
    // print("Answer chosen!");
    // ignore: avoid_print
    print(_questionIndex);

    if (_questionIndex < questions.length) {
      print("We have more questions!");
    }
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
        body: _questionIndex < questions.length
            ? Column(
                // OLD ... Text(welcomeValdomiro),
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  Question(
                    questions[_questionIndex]['questionText'] as String,
                  ),
                  ...(questions[_questionIndex]['answers']
                          as List<String>) //spreadop
                      .map((answer) {
                    return Answer(_answerQuestion, answer);
                  }).toList()
                ],
              )
            : const Center(
                child: Text("You have answered all the questions!"),
              ),
      ),
    );
  }
}
