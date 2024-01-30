import 'package:flutter/material.dart';
import 'package:ket/Embassy.dart';
import 'package:ket/Home.dart';
import 'package:ket/HotPlace.dart';


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
  int _selectedIndex = 0; // 선택된 페이지의 인덱스 넘버 초기화

  static const TextStyle optionStyle = TextStyle(
      fontSize: 30,
      fontWeight: FontWeight.bold
  ); // 텍스트 스타일 지정이므로 해당 부분은 제거해도 된다.

  final List<Widget> _widgetOptions = <Widget>[
    Home(),
    HotPlace(),
    Embassy(),
  ]; // 3개의 페이지를 연결할 예정이므로 3개의 페이지를 여기서 지정해준다. 탭 레이아웃은 3개.

  void _onItemTapped(int index) { // 탭을 클릭했을떄 지정한 페이지로 이동
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {

    return const Scaffold(
      body: Center(
        child: Column(

          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
          ],
        ),
      ),
    );
  }
}
