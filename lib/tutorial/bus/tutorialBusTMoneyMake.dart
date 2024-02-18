import 'package:flutter/material.dart';

class TutorialBusTMoneyMake extends StatefulWidget {
  const TutorialBusTMoneyMake({super.key});

  @override
  State<StatefulWidget> createState() => _TutorialBusTMoneyMakeState();
}

class _TutorialBusTMoneyMakeState extends State<TutorialBusTMoneyMake>{
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Column(
          children: <Widget>[
            Text("티머니 만드는 법")
          ],
        ),
      ),
    );
  }
}