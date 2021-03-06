import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int resultScore;
  final VoidCallback resetQuiz;

  // ignore: prefer_const_constructors_in_immutables, use_key_in_widget_constructors
  Result(this.resultScore, this.resetQuiz);

  String get resultPhrase {
    var resultText = "You answered all the questions!";

    if (resultScore <= 8) {
      resultText = "You are awesome and inocent! \n Total score: $resultScore.";
    } else if (resultScore <= 12) {
      resultText = "Pretty likable. \n Total score: $resultScore.";
    } else if (resultScore <= 16) {
      resultText = "You are a bit strange. \n Total score: $resultScore.";
    } else {
      resultText = "You are crazy! \n Total score: $resultScore.";
    }
    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity, // full width of the screen
      margin: const EdgeInsets.all(25),
      child: Center(
        child: Column(
          children: [
            Text(
              resultPhrase,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 36,
                //fontWeight: FontWeight.bold,
                //fontFamily: "RobotoMono",
              ),
            ),
            Container(
              width: double.infinity, // full width of the screen
              margin: const EdgeInsets.all(25),
              // ignore: deprecated_member_use
              child: FlatButton(
                color: Colors.blue,
                child: const Text(
                  "Restart Quiz!",
                  style: TextStyle(
                    fontSize: 28,
                    //fontWeight: FontWeight.bold,
                    //fontFamily: "RobotoMono",
                  ),
                ),
                textColor: Colors.white,
                onPressed: resetQuiz,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
