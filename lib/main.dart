import 'package:flutter/material.dart';

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

  var _questionIndex = 0;

  void _answerQuestion() {
    setState(() {
      _questionIndex++;
    });
    // print("Answer chosen!");
    print(_questionIndex);
  }

  @override // deliberatly overrinding the default class
  Widget build(BuildContext context) {
    // LIST of questions ...
    // LISTS OF DATA, LISTS OF CONTACTS
    var questions = [
      "What's your favorite color?",
      "What's your favorite animal?",
    ];
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
        body: Column(
          // OLD ... Text(welcomeValdomiro),
          // ignore: prefer_const_literals_to_create_immutables
          children: [
            Question(
              questions[_questionIndex],
            ), // i rebuild only this one?
            // ignore: deprecated_member_use
            RaisedButton(
              child: const Text("Answer 1"),
              onPressed: _answerQuestion, // onPressed takes a function
              // by adding parentesis here it tries pass the
              // returned value to onpressed we wnat to pass a pointer
            ),
            // ignore: deprecated_member_use
            RaisedButton(
              child: const Text("Answer 2"),
              onPressed: _answerQuestion, // this is a named function
              // () => print ('answer') anonymous function
            ),
            // ignore: deprecated_member_use
            RaisedButton(
              child: const Text("Answer 3"),
              onPressed: _answerQuestion, // or this way () => {for more lines}
            ),
            // just to follow along
            // this is the "correct" one
            // ElevatedButton(onPressed: onPressed, child: child)
          ],
        ),
      ),
    );
  }
}
