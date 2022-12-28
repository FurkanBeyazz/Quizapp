import 'package:flutter/material.dart';
import 'package:ouizapp/pages/landing_pages.dart';

class ScorePage extends StatelessWidget {
  final int score;
  final int totalQuestion;

  // ignore: use_key_in_widget_constructors
  const ScorePage(this.score, this.totalQuestion);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.yellow,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          const SizedBox(
            height: 10,
          ),
          const Text(
            "Teşekkürler Cevaplar İçin",
            style: TextStyle(fontSize: 50.0, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
        const Text(
            "Final",
            style:  TextStyle(fontSize: 50.0, fontWeight: FontWeight.bold),
          ),
         const  Text(
            "Score",
            style:  TextStyle(fontSize: 80.0, fontWeight: FontWeight.bold),
          ),
          Text(
            score.toString() + "/" + totalQuestion.toString(),
            style: const TextStyle(
                color: Colors.green,
                fontSize: 50.0,
                fontWeight: FontWeight.bold),
          ),
           IconButton(
              icon:  const Icon(Icons.arrow_right),
              color: Colors.blueAccent,
              iconSize: 90.0,
              onPressed: () => Navigator.of(context).pushAndRemoveUntil(
                 MaterialPageRoute(
                      builder: (BuildContext context) => const LandingPages()),
                  // ignore: unnecessary_null_comparison
                  (Route route) => route == null)),
          const Text(
            'Teşekkürler',
            style:  TextStyle(
                color: Colors.black,
                fontSize: 10.0,
                fontWeight: FontWeight.normal),
          ),
        ],
      ),
    );
  }
}


