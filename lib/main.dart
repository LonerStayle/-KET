import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_naver_map/flutter_naver_map.dart';
import 'package:ket/AdManager.dart';
import 'package:ket/ui/home.dart';
import 'package:ket/ui/theme/KetColorStyle.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
  initNaverMap();
}

void initNaverMap() async {
  await NaverMapSdk.instance.initialize(clientId: 'blqlx5zay4');
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Main(),
    );
  }
}



class Main extends StatefulWidget {
  const Main({super.key});

  @override
  State<Main> createState() => _MainState();
}
class _MainState extends State<Main> {
  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 1), () {


      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(
          builder: (context) => const Home()), (route) => false);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Material(type: MaterialType.transparency, child: SizedBox(
      child: Container(
        color: KetColorStyle.white,
        alignment: Alignment.center,
          child:
            Image.asset('assets/images/img_app_title.png',
                width: 260, height: 180)
          ,
      ),
    ));
  }
}
