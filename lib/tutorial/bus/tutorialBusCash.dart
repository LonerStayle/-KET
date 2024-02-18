import 'package:flutter/material.dart';

class TutorialBusCash extends StatefulWidget {
  const TutorialBusCash({super.key});

  @override
  State<StatefulWidget> createState() => _TutorialBusCashState();
}

class _TutorialBusCashState extends State<TutorialBusCash>{
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Column(
          children: <Widget>[
            Text("현금 사용법")
          ],
        ),
      ),
    );
  }
}