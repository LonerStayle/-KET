import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:ket/AdManager.dart';
import 'package:ket/FullWidthBannerAd.dart';
import 'package:ket/ui/theme/KetGlobal.dart';
import 'package:ket/ui/theme/KetTextStyle.dart';

class TutorialBusTMoney extends StatefulWidget {
  const TutorialBusTMoney({super.key});

  @override
  State<StatefulWidget> createState() => _TutorialBusTMoneyState();
}

class _TutorialBusTMoneyState extends State<TutorialBusTMoney>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                FullWidthBannerAd(
                    bannerAd: AdManager(1).bannerAd,
                    sidePadding: 10.0
                ),
                KetGlobal.spaceHeight(20),
                Image.asset(
                  'assets/images/img_tutorial_bus_t_money01.png',
                  width: MediaQuery.of(context).size.width,
                  height: 200,
                  fit: BoxFit.fill,
                ),

                KetGlobal.spaceHeight(10),
                Text(
                  "Tap your card on the card readers to get on the bus.",
                  style: KetTextStyle.notoSansRegular(14),
                  textAlign: TextAlign.start,
                ),
                KetGlobal.spaceHeight(30),

                Image.asset(
                  'assets/images/img_tutorial_bus_t_money02.png',
                  width: MediaQuery.of(context).size.width,
                  height: 200,
                  fit: BoxFit.fill,
                ),
                KetGlobal.spaceHeight(10),
                Text(
                  "Press the button before you get off.",
                  style: KetTextStyle.notoSansRegular(14),
                  textAlign: TextAlign.start,
                ),

                KetGlobal.spaceHeight(20),

                FullWidthBannerAd(
                    bannerAd: AdManager(2).bannerAd,
                    sidePadding: 10.0
                ),
                KetGlobal.spaceHeight(20),
                Image.asset(
                  'assets/images/img_tutorial_bus_t_money03.png',
                  width: MediaQuery.of(context).size.width,
                  height: 200,
                  fit: BoxFit.fill,
                ),
                KetGlobal.spaceHeight(10),

                Text(
                  "Don’t forget to tap your card when you get off!\nIt will charge you additional costs when you use\nnext transportation.",
                  style: KetTextStyle.notoSansRegular(14),
                  textAlign: TextAlign.start,
                ),

                KetGlobal.spaceHeight(20),
                FullWidthBannerAd(
                    bannerAd: AdManager(3).bannerAd,
                    sidePadding: 10.0
                ),

              ],
            )),
      ),
    );
  }
}