import 'package:flutter/material.dart';
import 'package:ket/ui/theme/KetGlobal.dart';
import 'package:ket/ui/theme/KetTextStyle.dart';

class TutorialBusCash extends StatefulWidget {
  const TutorialBusCash({super.key});

  @override
  State<StatefulWidget> createState() => _TutorialBusCashState();
}

class _TutorialBusCashState extends State<TutorialBusCash>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                KetGlobal.spaceHeight(20),
                Image.asset(
                  'assets/images/img_tutorial_t_money.png',
                  width: MediaQuery.of(context).size.width,
                  height: 200,
                  fit: BoxFit.fill,
                ),

                KetGlobal.spaceHeight(10),
                Text(
                  "T-money is a transportation card that can be\nused all over the country in Korea.\nYou can use the transfer system cheeper,You can also use as credit/debit card.\n(if you buy the prepaid card type)",
                  style: KetTextStyle.notoSansRegular(14),
                  textAlign: TextAlign.start,
                ),
                KetGlobal.spaceHeight(30),

                Image.asset(
                  'assets/images/img_tutorial_bus_cash01.png',
                  width: MediaQuery.of(context).size.width,
                  height: 200,
                  fit: BoxFit.fill,
                ),
                KetGlobal.spaceHeight(10),
                Text(
                  "This means what cashless bus service stared\nand also offering to use transportation cards.",
                  style: KetTextStyle.notoSansRegular(14),
                  textAlign: TextAlign.start,
                ),

                KetGlobal.spaceHeight(20),

                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 50,
                  color: const Color(0xffFAD40F),
                  child: const Text("광고"),
                ),
                KetGlobal.spaceHeight(20),
                Image.asset(
                  'assets/images/img_tutorial_bus_cash02.png',
                  width: MediaQuery.of(context).size.width,
                  height: 200,
                  fit: BoxFit.fill,
                ),
                KetGlobal.spaceHeight(10),
                Text(
                  "You can still pay by cash to put into the box.",
                  style: KetTextStyle.notoSansRegular(14),
                  textAlign: TextAlign.start,
                ),

                KetGlobal.spaceHeight(20),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 50,
                  color: const Color(0xffFAD40F),
                  child: const Text("광고"),
                ),

              ],
            )),
      ),
    );
  }
}