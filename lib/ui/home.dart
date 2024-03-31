import 'dart:async';

import 'package:flutter/material.dart';
import 'package:ket/ui/restaurant.dart';
import 'package:ket/ui/theme/KetColorStyle.dart';
import 'package:ket/ui/theme/KetGlobal.dart';
import 'package:ket/ui/theme/KetTextStyle.dart';
import 'package:ket/ui/tutorial/bus/tutorialBus.dart';
import 'package:ket/ui/tutorial/subway/tutorialSubWay.dart';
import 'package:ket/ui/tutorial/tutorialTMoneyMake.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<StatefulWidget> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final PageController _controller = PageController(initialPage: 2100000);

  List<String> headerImageList = <String>[
    "assets/images/img_home_header01.png",
    "assets/images/img_home_header02.png",
    "assets/images/img_home_header03.png",
    "assets/images/img_home_header04.png",
  ];

  int currentPage = 0;

  @override
  void initState() {
    super.initState();
    Timer.periodic(const Duration(seconds: 3), (Timer timer) {
      if(currentPage < 2100000){
        currentPage++;
      }else{
        currentPage = 0;
      }

      _controller.animateToPage(
        currentPage,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeIn,
      );
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
              SizedBox(
                height: 460,
                child: PageView.builder(
                    controller: _controller,
                    itemBuilder: (_, index) {
                      return SizedBox.expand(
                          child: Stack(
                        children: [
                          Image.asset(
                            headerImageList[index % 4],
                            width: double.infinity,
                            height: 460,
                          ),
                          Column(children: [
                            Stack(children: [
                              Padding(
                                  padding:
                                      const EdgeInsets.only(left: 53, top: 21),
                                  child: Text(
                                    "Welcome!",
                                    style: KetTextStyle.notoSansRegular(48.0),
                                  )),
                              Padding(
                                  padding:
                                      const EdgeInsets.only(left: 90, top: 75),
                                  child: Text(
                                    "Have a wonderful trip!",
                                    style: KetTextStyle.notoSansMedium(20.0),
                                  )),
                            ]),
                            Padding(
                                padding:
                                    const EdgeInsets.only(left: 21, top: 51),
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: KetColorStyle.airOfMint
                                        .withOpacity(0.5),
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(10)),
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
                      ));
                    }),
              ),
              SizedBox(
                height: 103,
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => const TutorialBus()));
                        },
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset('assets/icons/ic_home_bus.png',
                                  width: 47, height: 44),
                              Text('BUS', style: KetTextStyle.notoSansBold(10))
                            ]),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => const TutorialSubWay()));
                        },
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset('assets/icons/ic_home_subway.png',
                                  width: 47, height: 44),
                              Text('SUBWAY',
                                  style: KetTextStyle.notoSansBold(10))
                            ]),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => const Restaurant()));
                        },
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset('assets/icons/ic_home_restaurant.png',
                                  width: 47, height: 44),
                              Text('RESTAURANT',
                                  style: KetTextStyle.notoSansBold(10))
                            ]),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => const TutorialTMoneyMake(
                                  isFirstSpace: true)));
                        },
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset('assets/icons/ic_home_t_money.png',
                                  width: 47, height: 44),
                              Text('T-money',
                                  style: KetTextStyle.notoSansBold(10))
                            ]),
                      ),
                    ]),
              ),
              KetGlobal.divider(),
              Padding(
                padding: const EdgeInsets.only(top: 5, left: 30),
                child: Text(
                    "Do you want to have better trip?\nTry using it below!\nYou can find good restaurants like koreans.",
                    style: KetTextStyle.notoSansRegular(15)),
              ),
              KetGlobal.spaceHeight(6),
              Container(
                alignment: Alignment.center,
                height: 90,
                child: Container(
                    width: MediaQuery.of(context).size.width - 60,
                    decoration: BoxDecoration(
                      border: Border.all(color: KetColorStyle.catalan),
                      borderRadius: const BorderRadius.all(Radius.circular(10)),
                    ),
                    child: GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => const Restaurant()));
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 13, right: 9, top: 10, bottom: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                'assets/icons/ic_home_naver_map.png',
                                width: 50,
                                height: 50,
                              ),
                              KetGlobal.spaceWidth(16),
                              Text(
                                "Check out the hot places\non Naver Map",
                                style: KetTextStyle.notoSansMedium(15),
                              ),
                            ],
                          ),
                        ))),
              ),
              SizedBox(
                  height: 80,
                  child: Container(
                      alignment: Alignment.center,
                      child: Image.asset('assets/images/img_app_title.png',
                          width: 57, height: 38))),
            ])),
      ),
    );
  }
}
