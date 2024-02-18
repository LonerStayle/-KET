import 'package:flutter/material.dart';

class TutorialSubWayTMoney extends StatefulWidget {
  const TutorialSubWayTMoney({super.key});

  @override
  State<StatefulWidget> createState() => _TutorialSubWayTMoneyState();
}

class _TutorialSubWayTMoneyState extends State<TutorialSubWayTMoney>{
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Column(
          children: <Widget>[
            Text("티머니 사용법")
          ],
        ),
      ),
    );
  }
}