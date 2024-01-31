import 'package:flutter/material.dart';
import 'package:ket/tutorial/bus/tutorialBus.dart';
import 'package:ket/tutorial/subway/tutorialSubWay.dart';
import 'package:ket/ui_theme/KetColorStyle.dart';
import 'package:ket/ui_theme/KetTextStyle.dart';

class Home extends StatefulWidget {
  const Home({super.key});

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
                  ),
                  Column(children: [
                    Padding(
                        padding: const EdgeInsets.only(left: 22, top: 74),
                        child: Text(
                          "Welcome!",
                          style: KetTextStyle.notoSansMedium(48.0),
                        )),
                    Padding(
                        padding: const EdgeInsets.only(left: 58, top: 10),
                        child: Text(
                          "Have a wonderful trip!",
                          style: KetTextStyle.notoSansMedium(20.0),
                        )),
                    Padding(
                        padding: const EdgeInsets.only(left: 25, top: 51),
                        child: Container(
                          decoration: const BoxDecoration(
                            color: KetColorStyle.airOfMint,
                            borderRadius: BorderRadius.all(Radius.circular(10)),
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
              divider(),
              Padding(
                padding: const EdgeInsets.only(top: 39, left: 16),
                child: Text(
                    "Check out the details of how to use\npublic transportation.\n(Press the button below to use it)",
                    style: KetTextStyle.notoSansMedium(14.0)),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 75, left: 30, right: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: (){
                        Navigator.of(context).push(MaterialPageRoute(builder: (context) => TutorialBus()));
                      },
                      child: Container(
                        decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: KetColorStyle.airOfMint),
                        width: 130,
                        height: 130,
                        alignment: Alignment.center,
                        child: Image.asset('assets/icons/ic_home_bus.png',
                            width: 74, height: 74),

                      ),
                    ),

                    spaceWidth(40),

                    GestureDetector(
                      onTap: (){
                        Navigator.of(context).push(MaterialPageRoute(builder: (context) => TutorialSubWay()));
                      },
                      child:Container(
                        decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: KetColorStyle.airOfMint),
                        width: 130,
                        height: 130,
                        alignment: Alignment.center,
                        child: Image.asset('assets/icons/ic_home_subway.png',
                            width: 74, height: 74),
                      ) ,
                    )

                  ],
                ),
              ),
              spaceHeight(70),
              divider(),
              Padding(
                padding: const EdgeInsets.only(top: 45, left: 16),
                child: Text(
                    "Check out how to find good restaurants\nin Korea like locals.\nMore than 80% of the Korean population is\nusing \"Naver Maps\".\nFor looking hot places.\nDo you want to have better trip?try using it below!",
                    style: KetTextStyle.notoSansMedium(14.0)),
              ),
              spaceHeight(54),
              Padding(
                  padding: EdgeInsets.only(left: 34, right: 26),
                  child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/icons/ic_home_food.png',
                          width: 28,
                          height: 32,
                        ),
                        spaceWidth(22),
                        Expanded(
                            child: Container(
                          height: 70,
                          decoration: BoxDecoration(
                            border: Border.all(color: KetColorStyle.catalan),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(10)),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                'assets/icons/ic_naver_logo.png',
                                width: 50,
                                height: 50,
                              ),
                              spaceWidth(12),
                              Text(
                                "Check out the hot places\non Naver Map",
                                style: KetTextStyle.notoSansMedium(14.0),
                              ),
                            ],
                          ),
                        ))
                      ])),
              spaceHeight(51),
              divider(),
              Padding(
                padding: const EdgeInsets.only(top: 39, left: 16),
                child: Text(
                    "We'll help you access the embassy\nfaster than anyone else if you have a problem\nduring your trip.",
                    style: KetTextStyle.notoSansMedium(14.0)),
              ),
              spaceHeight(39),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      Image.asset(
                        'assets/icons/ic_home_embassy_bg.png',
                        width: 120,
                        height: 120,
                      ),

                      Positioned(
                          top: 16,
                          right: 27,
                          child:  Image.asset(
                            'assets/icons/ic_home_embassy.png',
                            width: 70,
                            height: 70,
                          ))
                      ,
                    ],
                  )
                ],
              )
              ,
              spaceHeight(83)
            ],
          ),
        ),
      ),
    );
  }

  Container spaceHeight(double height) {
    return Container(height: height);
  }

  Container spaceWidth(double width) {
    return Container(width: width);
  }

  Container divider() {
    return Container(
        width: double.infinity, height: 10, color: KetColorStyle.airOfMint);
  }
}
