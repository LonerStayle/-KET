import 'package:flutter/material.dart';
import 'package:ket/ui_theme/KetGlobal.dart';
import 'package:ket/ui_theme/KetTextStyle.dart';

class TutorialSubWayTMoney extends StatefulWidget {
  const TutorialSubWayTMoney({super.key});

  @override
  State<StatefulWidget> createState() => _TutorialSubWayTMoneyState();
}

class _TutorialSubWayTMoneyState extends State<TutorialSubWayTMoney> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 50,
                  color: const Color(0xffFAD40F),
                  child: const Text("광고"),
                ),
                KetGlobal.spaceHeight(20),
                Image.asset(
                  'assets/images/img_tutorial_sub_way_t_money01.png',
                  width: MediaQuery.of(context).size.width,
                  height: 200,
                  fit: BoxFit.fill,
                ),
                KetGlobal.spaceHeight(10),
                Text(
                  "Tap your card on the card readers to enter.",
                  style: KetTextStyle.notoSansRegular(14),
                  textAlign: TextAlign.start,
                ),
                KetGlobal.spaceHeight(30),

                Image.asset(
                  'assets/images/img_tutorial_sub_way_t_money02.png',
                  width: MediaQuery.of(context).size.width,
                  height: 200,
                  fit: BoxFit.fill,
                ),
                KetGlobal.spaceHeight(10),
                Text(
                  "Check the balance of your T-money card!",
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
                  'assets/images/img_tutorial_sub_way_t_money03.png',
                  width: MediaQuery.of(context).size.width,
                  height: 200,
                  fit: BoxFit.fill,
                ),
                KetGlobal.spaceHeight(10),
                Text(
                  "Transfer spot!\nYou must use the same card when you enterd!",
                  style: KetTextStyle.notoSansRegular(14),
                  textAlign: TextAlign.start,
                ),
                KetGlobal.spaceHeight(30),
                Image.asset(
                  'assets/images/img_tutorial_sub_way_t_money04.png',
                  width: MediaQuery.of(context).size.width,
                  height: 200,
                  fit: BoxFit.fill,
                ),
                KetGlobal.spaceHeight(10),
                Text(
                  "Make sure to tap your T-money card!\n(There may be additional charges. But you can\nalso charge your T-money card befor you get off )",
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
