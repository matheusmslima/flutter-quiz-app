import 'package:flutter/material.dart';

class Question extends StatelessWidget {
  //const Question({ Key? key }) : super(key: key);
  final String questionText; // adding final tells flutter that we are not
  // changing

  Question(this.questionText);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity, // full width of the screen
      margin: EdgeInsets.all(25),
      child: Text(
        questionText,
        style: TextStyle(fontSize: 24),
        textAlign: TextAlign.center, //enum? datatype?
      ),
    );
  }
}
