import 'package:flutter/material.dart';
import 'package:ouizapp/pages/quiz_page.dart';
import 'package:ouizapp/pages/info.dart';

class LandingPages extends StatelessWidget {
  const LandingPages({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(

        appBar: AppBar(
          backgroundColor: Colors.orange,
          title: const Text('Quiz...!'),
          elevation: 0.0,
          actions: <Widget>[
            IconButton(
              icon: const Icon(Icons.search),
              onPressed: () {
                // ignore: avoid_print
                print("taping on search");
              },
            ),
            IconButton(
              icon: const Icon(Icons.info),
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (BuildContext context) => InfoA()));
              },
            ),
          ],
        ),
        backgroundColor: Colors.orange,
        body: InkWell(
          onTap: () => Navigator.of(context).push(MaterialPageRoute(
              builder: (BuildContext context) => const QuizPage())),
          child: Stack(
            children: <Widget>[
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                // crossAxisAlignment: CrossAxisAlignment.center,
                // ignore: prefer_const_literals_to_create_immutables
                children: <Widget>[
                  const Text(
                    "Sorular Gelsin",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 50.0,
                        fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                  const Text(
                    'Başlamak İçin Basınız',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                  const Align(
                    alignment: Alignment.topCenter,
                    child: Text(
                      'Ödev',
                      style: TextStyle(
                          color: Colors.yellow,
                          fontSize: 10.0,
                          fontWeight: FontWeight.normal),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
