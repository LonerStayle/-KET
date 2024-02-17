import 'package:flutter/material.dart';
import 'package:ket/tutorial/bus/tutorialBus.dart';
import 'package:ket/tutorial/subway/tutorialSubWay.dart';
import 'package:ket/ui_theme/KetColorStyle.dart';
import 'package:ket/ui_theme/KetGlobal.dart';
import 'package:ket/ui_theme/KetTextStyle.dart';

class Home extends StatefulWidget {
  const Home({super.key, required this.mainMoveNav});

  final Function(int index) mainMoveNav;

  @override
  State<StatefulWidget> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Stack(
                children: [
                  Image.asset(
                    "assets/images/img_home_header.png",
                    fit: BoxFit.fitWidth,
                    width: double.infinity,
                    height: 275,
                  ),
                  Column(children: [
                    Stack(children: [
                      Padding(
                          padding: const EdgeInsets.only(left: 53, top: 21),
                          child: Text(
                            "Welcome!",
                            style: KetTextStyle.notoSansRegular(48.0),
                          )),
                      Padding(
                          padding: const EdgeInsets.only(left: 90, top: 75),
                          child: Text(
                            "Have a wonderful trip!",
                            style: KetTextStyle.notoSansMedium(20.0),
                          )),
                    ]),
                    Padding(
                        padding: const EdgeInsets.only(left: 21, top: 25),
                        child: Container(
                          decoration: BoxDecoration(
                            color: KetColorStyle.airOfMint.withOpacity(0.5),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(10)),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(9),
                            child: Text(
                              "This app is for tourists\nwho have traveled to Korea to help\nwith detailed and specific guides",
                              style: KetTextStyle.notoSansMedium(14.0),
                            ),
                          ),
                        ))
                  ])
                ],
              ),
              KetGlobal.divider(),
              Padding(
                padding: const EdgeInsets.only(top: 20, left: 20),
                child: Row(
                  children: [
                    Image.asset('assets/icons/ic_home_bus.png',
                        width: 20, height: 18),
                    KetGlobal.spaceWidth(8),
                    Text("TRAFFIC", style: KetTextStyle.notoSansBold(18.0)),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10, left: 20),
                child: Text(
                    "Check out how to use public transportation.\n(Press the button below to use it)",
                    style: KetTextStyle.notoSansRegularColor(
                        12.0, KetColorStyle.black.withAlpha(60))),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 22, left: 30, right: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => TutorialBus()));
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: KetColorStyle.isleRoyale,
                            border: Border.all(
                                width: 0.5, color: KetColorStyle.grayBorder)),
                        width: 130,
                        height: 130,
                        alignment: Alignment.center,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset('assets/icons/ic_home_bus.png',
                                width: 74, height: 74),
                            Text(
                              "BUS",
                              style: KetTextStyle.notoSansBold(12.0),
                            )
                          ],
                        ),
                      ),
                    ),
                    KetGlobal.spaceWidth(40),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => TutorialSubWay()));
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: KetColorStyle.isleRoyale,
                            border: Border.all(
                                width: 0.5, color: KetColorStyle.grayBorder)),
                        width: 130,
                        height: 130,
                        alignment: Alignment.center,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset('assets/icons/ic_home_subway.png',
                                width: 74, height: 74),
                            Text(
                              "SUBWAY",
                              style: KetTextStyle.notoSansBold(12.0),
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
              KetGlobal.spaceHeight(22),
              KetGlobal.divider(),
              Padding(
                padding: const EdgeInsets.only(top: 20, left: 20),
                child: Row(
                  children: [
                    Image.asset('assets/icons/ic_home_restaurant.png',
                        width: 20, height: 18),
                    KetGlobal.spaceWidth(8),
                    Text("RESTAURANT", style: KetTextStyle.notoSansBold(18.0)),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10, left: 20),
                child: Text(
                    "Check out how to find restaurants  like koreans.\nDo you want to have better trip?\nTry using it below!",
                    style: KetTextStyle.notoSansRegularColor(
                        12.0, KetColorStyle.black.withAlpha(60))),
              ),
              KetGlobal.spaceHeight(22),
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                Container(
                    height: 70,
                    decoration: BoxDecoration(
                      border: Border.all(color: KetColorStyle.catalan),
                      borderRadius: const BorderRadius.all(Radius.circular(10)),
                    ),
                    child: GestureDetector(
                        onTap: () {
                          widget.mainMoveNav(0);
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 13, right: 9, top: 10, bottom: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                'assets/icons/ic_naver_logo.png',
                                width: 50,
                                height: 50,
                              ),
                              KetGlobal.spaceWidth(12),
                              Text(
                                "Check out the hot places\non Naver Map",
                                style: KetTextStyle.notoSansMedium(14.0),
                              ),
                            ],
                          ),
                        ))),
              ]),
              KetGlobal.spaceHeight(22),
              KetGlobal.divider(),
              KetGlobal.spaceHeight(20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("FIND YOUR EMBASSY",
                      style: KetTextStyle.notoSansBold(18.0)),
                ],
              ),
              KetGlobal.spaceHeight(20),
              Padding(
                  padding: const EdgeInsets.only(
                      left: 30, right: 30, top: 20, bottom: 20),
                  child: Container(
                      decoration: const BoxDecoration(
                        color: KetColorStyle.airOfMint,
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      ),
                      child: Padding(
                          padding: const EdgeInsets.only(
                              top: 18, bottom: 20, right: 25, left: 25),
                          child: Column(
                            children: [
                              Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "You’ve got any problems?\nAccess to your embassy easily\nhere!",
                                      style: KetTextStyle.notoSansRegularColor(
                                          12,
                                          KetColorStyle.black.withOpacity(0.6)),
                                    ),
                                    KetGlobal.spaceWidth(34),
                                    Image.asset(
                                      'assets/icons/ic_home_embassy.png',
                                      width: 56,
                                      height: 56,
                                    ),
                                  ]),
                              KetGlobal.spaceHeight(11),
                              GestureDetector(
                                  onTap: () {
                                    widget.mainMoveNav(2);
                                  },
                                  child: Container(
                                    width: double.infinity,
                                    height: 54,
                                    decoration: BoxDecoration(
                                      color: KetColorStyle.catalan,
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          "Find",
                                          style: KetTextStyle.notoSansBoldColor(
                                              18.0, KetColorStyle.white),
                                        )
                                      ],
                                    ),
                                  ))
                            ],
                          )))),
            ],
          ),
        ),
      ),
    );
  }
}
