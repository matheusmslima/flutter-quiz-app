import 'package:flutter/material.dart';

class Question extends StatelessWidget {
  //const Question({ Key? key }) : super(key: key);
  final String questionText; // adding final tells flutter that we are not
  // changing

  // ignore: prefer_const_constructors_in_immutables
  Question(this.questionText, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity, // full width of the screen
      margin: const EdgeInsets.all(25),
      child: Text(
        questionText,
        style: const TextStyle(fontSize: 24),
        textAlign: TextAlign.center, //enum? datatype?
      ),
    );
  }
}
