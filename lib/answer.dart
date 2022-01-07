import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  final VoidCallback selectHandler;
  final String answerText;
  // ignore: prefer_const_constructors_in_immutables,, use_key_in_widget_constructors
  Answer(this.selectHandler, this.answerText);

  @override
  Widget build(BuildContext context) {
    // ignore: sized_box_for_whitespace
    return Container(
      width: double.infinity,
      // ignore: deprecated_member_use, prefer_const_constructors
      child: RaisedButton(
        color: Colors.blue,
        // ignore: prefer_const_constructors
        child: Text(answerText),
        onPressed: selectHandler,
      ),
    );
  }
}
