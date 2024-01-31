import 'package:flutter/material.dart';

class TutorialSubWay extends StatefulWidget {
  const TutorialSubWay({super.key});

  @override
  State<StatefulWidget> createState() => _TutorialSubWayState();
}

class _TutorialSubWayState extends State<TutorialSubWay>{
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Column(
          children: <Widget>[
            Text("\n\n\n\n\n\n지하철 안내화면입니다.")
          ],
        ),
      ),
    );
  }
}