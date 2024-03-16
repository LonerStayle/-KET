import 'package:flutter/material.dart';
import 'package:ket/tutorial/subway/tutorialSubWayCash.dart';
import 'package:ket/tutorial/subway/tutorialSubWayTMoney.dart';
import 'package:ket/tutorial/tutorialTMoneyMake.dart';
import 'package:ket/ui_theme/KetColorStyle.dart';
import 'package:ket/ui_theme/KetTextStyle.dart';

class TutorialSubWay extends StatefulWidget {
  final int initialTabIndex;
  const TutorialSubWay({super.key, this.initialTabIndex = 0});

  @override
  State<StatefulWidget> createState() => _TutorialSubWayState();
}

class _TutorialSubWayState extends State<TutorialSubWay> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        initialIndex: widget.initialTabIndex,
        length: 3,
        child: Scaffold(
          appBar: PreferredSize(
              preferredSize: const Size(double.infinity, 60),
              child: AppBar(
                  backgroundColor: KetColorStyle.airOfMint,
                  bottom: TabBar(
                    labelPadding: EdgeInsets.zero,
                    indicator: const BoxDecoration(
                        color: KetColorStyle.white,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10),
                            topRight: Radius.circular(10))),
                    dividerHeight: 0,
                    labelStyle: KetTextStyle.notoSansBoldColor(
                        14.0, KetColorStyle.black),
                    unselectedLabelStyle: KetTextStyle.notoSansBoldColor(
                        14.0, KetColorStyle.gray),
                    tabs: [
                      Container(
                          alignment: Alignment.center,
                          height: 50,
                          child: const Text("Subway\nby T-money",
                          textAlign: TextAlign.center)),
                      Container(
                          alignment: Alignment.center,
                          height: 50,
                          child: const Text("Subway\nby CASH",
                              textAlign: TextAlign.center)),
                      Container(
                          alignment: Alignment.center,
                          height: 50,
                          child: const Text(
                            "What’s\nT-money?",
                            textAlign: TextAlign.center,
                          ))
                    ],
                  ))),
          body: const TabBarView(
            children: [
              TutorialSubWayTMoney(),
              TutorialSubWayCash(),
              TutorialTMoneyMake(),
            ],
          ),
        ),
      ),
    );
  }
}
