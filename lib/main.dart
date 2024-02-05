import 'package:flutter/material.dart';
import 'package:ket/main_bottom/embassy.dart';
import 'package:ket/main_bottom/home.dart';
import 'package:ket/main_bottom/hotPlace.dart';
import 'package:ket/tutorial/bus/tutorialBus.dart';
import 'package:ket/tutorial/subway/tutorialSubWay.dart';
import 'package:ket/ui_theme/KetColorStyle.dart';
import 'package:ket/ui_theme/KetGlobal.dart';
import 'package:ket/ui_theme/KetTextStyle.dart';

void main() {
  runApp(const MyApp());
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

  final List<Widget> _widgetOptions = <Widget>[
    const HotPlace(),
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
  Widget build(BuildContext context) {
    return Stack(alignment: AlignmentDirectional.bottomEnd, children: [
      Scaffold(
        body: SafeArea(
          child: _widgetOptions.elementAt(_selectedIndex),
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: SizedBox.shrink(),
              label: 'FOOD',
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
          selectedLabelStyle: KetTextStyle.notoSansBold(20.0),
          unselectedLabelStyle: KetTextStyle.notoSansMedium(16.0),
          onTap: _onItemTapped, // 선언했던 onItemTapped,
        ),
      ),
      Positioned(
          bottom: 68,
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
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Container(
                        decoration: BoxDecoration(color: Color(0xfffad40f)),
                        alignment: Alignment.center,
                        width: 320,
                        height: 480,
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
                              Image.asset("assets/icons/ic_home_bus_white.png",
                                  width: 32, height: 30),
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
                              builder: (context) => const TutorialSubWay()));
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
    ]);
  }
}
