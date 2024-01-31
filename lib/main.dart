import 'package:flutter/material.dart';
import 'package:ket/main_bottom/embassy.dart';
import 'package:ket/main_bottom/home.dart';
import 'package:ket/main_bottom/hotPlace.dart';
import 'package:ket/ui_theme/KetColorStyle.dart';
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

  @override
  Widget build(BuildContext context) {

    return Scaffold(
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
        currentIndex: _selectedIndex, // 지정 인덱스로 이동
        selectedItemColor: Colors.black,
        selectedLabelStyle: KetTextStyle.notoSansBold(20.0),
        unselectedLabelStyle: KetTextStyle.notoSansMedium(16.0),
        onTap: _onItemTapped, // 선언했던 onItemTapped,


      ),
    );
  }
}
