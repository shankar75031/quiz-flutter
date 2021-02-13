import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final _score;
  final Function _resetHandler;
  Result(this._score, this._resetHandler);

  String get resultPhrase {
    var resultText = "You did it!";
    if (_score <= 8) {
      resultText = "You are awesome!";
    } else if (_score <= 12) {
      resultText = "Pretty Likeable!";
    } else {
      resultText = "You are so bad!!!";
    }
    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text(
            resultPhrase,
            style: TextStyle(
              fontSize: 36,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          FlatButton(
            child: Text('Restart Quiz'),
            onPressed: _resetHandler,
          )
        ],
      ),
    );
  }
}
