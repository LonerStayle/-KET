import 'package:flutter/material.dart';

class TutorialSubWayTMoneyMake extends StatefulWidget {
  const TutorialSubWayTMoneyMake({super.key});

  @override
  State<StatefulWidget> createState() => _TutorialSubWayTMoneyMakeState();
}

class _TutorialSubWayTMoneyMakeState extends State<TutorialSubWayTMoneyMake>{
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Column(
          children: <Widget>[
            Text("티머니 만드는법")
          ],
        ),
      ),
    );
  }
}