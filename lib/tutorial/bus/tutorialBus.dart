import 'package:flutter/material.dart';

class TutorialBus extends StatefulWidget {
  const TutorialBus({super.key});

  @override
  State<StatefulWidget> createState() => _TutorialBusState();
}

class _TutorialBusState extends State<TutorialBus>{
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Column(
          children: <Widget>[
            Text("\n\n\n버스 안내화면입니다.\n\n\n\n\n\n\n\n\n\n\n\n경선아 ㅎㅇㅎㅇㅎㅇㅎㅇ")
          ],
        ),
      ),
    );
  }
}