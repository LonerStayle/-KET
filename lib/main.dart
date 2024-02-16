import 'package:flutter/material.dart';
import 'package:flutter_naver_map/flutter_naver_map.dart';
import 'package:ket/main_bottom/embassy.dart';
import 'package:ket/main_bottom/home.dart';
import 'package:ket/main_bottom/restaurant.dart';
import 'package:ket/tutorial/bus/tutorialBus.dart';
import 'package:ket/tutorial/subway/tutorialSubWay.dart';
import 'package:ket/ui_theme/KetColorStyle.dart';
import 'package:ket/ui_theme/KetGlobal.dart';
import 'package:ket/ui_theme/KetTextStyle.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(const MyApp());
  initNaverMap();
}
void initNaverMap() async{
  await NaverMapSdk.instance.initialize(clientId: 'blqlx5zay4');
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Flutter Demo',
      home: Main(title: 'Flutter Demo Home Page'),
    );
  }
}

class Main extends StatefulWidget {
  const Main({super.key, required this.title});

  final String title;

  @override
  State<Main> createState() => _MainState();
}

class _MainState extends State<Main> {
  int _selectedIndex = 1;
  bool _isVisibleQuick = false;
  bool _isVisibleQuestionTmoney = false;

  final List<Widget> _widgetOptions = <Widget>[
    const Restaurant(),
    const Home(),
    const Embassy(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _onFabTapped(bool isVisible) {
    setState(() {
      _isVisibleQuick = isVisible;
    });
  }

  @override
  void initState() {
    super.initState();
    (() async {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      setState(() {
        _isVisibleQuestionTmoney =
            prefs.getBool('isVisibleQuestionTmoney') ?? false;

        if (_isVisibleQuestionTmoney == false) {
          showCustomDialog(context);
          prefs.setBool('isVisibleQuestionTmoney',true);
          _isVisibleQuestionTmoney = true;
        }
      });
    })();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
        type: MaterialType.transparency,
        child: Stack(alignment: AlignmentDirectional.bottomEnd, children: [
          Scaffold(
            body: SafeArea(
              child: _widgetOptions.elementAt(_selectedIndex),
            ),
            bottomNavigationBar: BottomNavigationBar(
              items: const <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  icon: SizedBox.shrink(),
                  label: 'RESTAURANT',
                ),
                BottomNavigationBarItem(
                  icon: SizedBox.shrink(),
                  label: 'HOME',
                ),
                BottomNavigationBarItem(
                  icon: SizedBox.shrink(),
                  label: 'EMBASSY',
                ),
              ],
              backgroundColor: KetColorStyle.airOfMint,
              currentIndex: _selectedIndex,
              // 지정 인덱스로 이동
              selectedItemColor: Colors.black,
              selectedLabelStyle: KetTextStyle.notoSansBold(16.0),
              unselectedLabelStyle: KetTextStyle.notoSansMedium(12.0),
              onTap: _onItemTapped, // 선언했던 onItemTapped,
            ),
          ),
          Positioned(
              bottom: 62,
              right: 6,
              child: GestureDetector(
                  onTap: () {
                    _onFabTapped(true);
                  },
                  child: Image.asset(
                    "assets/icons/ic_home_fab.png",
                    height: 56,
                    width: 56,
                  ))),
          Visibility(
              visible: _isVisibleQuick,
              child: GestureDetector(
                  onTap: () {
                    _onFabTapped(false);
                  },
                  child: Container(
                    color: KetColorStyle.black.withOpacity(0.3),
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                            decoration:
                                const BoxDecoration(color: Color(0xfffad40f)),
                            alignment: Alignment.center,
                            height: 50,
                            margin: const EdgeInsets.symmetric(horizontal: 20),
                            child: const Text("광고 오오")),
                        KetGlobal.spaceHeight(33),
                        GestureDetector(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => const TutorialBus()));
                            },
                            child: Container(
                              width: MediaQuery.of(context).size.width - 48,
                              height: 64,
                              decoration: const BoxDecoration(
                                color: KetColorStyle.montegoBay,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(12.0)),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset(
                                      "assets/icons/ic_home_bus_white.png",
                                      width: 32,
                                      height: 30),
                                  KetGlobal.spaceWidth(10),
                                  Text("Take the bus",
                                      style: KetTextStyle.notoSansBoldColor(
                                          22.0, KetColorStyle.white))
                                ],
                              ),
                            )),
                        KetGlobal.spaceHeight(20),
                        GestureDetector(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) =>
                                      const TutorialSubWay()));
                            },
                            child: Container(
                              width: MediaQuery.of(context).size.width - 48,
                              height: 64,
                              decoration: const BoxDecoration(
                                color: KetColorStyle.catalan,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(12.0)),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset(
                                      "assets/icons/ic_home_subway_white.png",
                                      width: 32,
                                      height: 30),
                                  KetGlobal.spaceWidth(10),
                                  Text("Take the subway",
                                      style: KetTextStyle.notoSansBoldColor(
                                          22.0, KetColorStyle.white))
                                ],
                              ),
                            )),
                      ],
                    ),
                  )))
        ]));
  }

  void showCustomDialog(BuildContext context) {
    showGeneralDialog(
      context: context,
      barrierLabel: "Barrier",
      barrierDismissible: true,
      barrierColor: Colors.black.withOpacity(0.5),
      transitionDuration: const Duration(milliseconds: 200),
      pageBuilder: (_, __, ___) {
        return Material(
            type: MaterialType.transparency,
            child: Center(
              child: Container(
                height: 380,
                margin: const EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12)),
                child: Column(
                  children: [
                    KetGlobal.spaceHeight(34),
                    Text("You’ve got a T-money?",
                        style: KetTextStyle.notoSansBold(20)),
                    KetGlobal.spaceHeight(24),
                    Image.asset('assets/images/img_t_money_logo.png',
                        width: 142, height: 140),
                    KetGlobal.spaceHeight(24),
                    const KetCheckbox(),
                    KetGlobal.spaceHeight(30),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        GestureDetector(
                            onTap: () {
                              setState(() {

                              });
                            },
                            child: Container(
                              width: 60,
                              height: 34,
                              alignment: Alignment.center,
                              decoration: const BoxDecoration(
                                  color: KetColorStyle.isleRoyale,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(5))),
                              child: Text(
                                "Yes",
                                style: KetTextStyle.notoSansBold(16),
                              ),
                            )),
                        GestureDetector(
                            onTap: () {

                            },
                            child: Container(
                              width: 60,
                              height: 34,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  color: KetColorStyle.white,
                                  border: Border.all(
                                    color: KetColorStyle.isleRoyale,
                                  ),
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(5))),
                              child: Text(
                                "No",
                                style: KetTextStyle.notoSansBold(16),
                              ),
                            )),
                      ],
                    )
                  ],
                ),
              ),
            ));
      },
      transitionBuilder: (_, anim, __, child) {
        Tween<Offset> tween;
        if (anim.status == AnimationStatus.reverse) {
          tween = Tween(begin: const Offset(0, 0), end: Offset.zero);
        } else {
          tween = Tween(begin: const Offset(0, 1), end: Offset.zero);
        }

        return SlideTransition(
          position: tween.animate(anim),
          child: FadeTransition(
            opacity: anim,
            child: child,
          ),
        );
      },
    );
  }
}
