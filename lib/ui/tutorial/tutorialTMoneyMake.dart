import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:ket/AdManager.dart';
import 'package:ket/FullWidthBannerAd.dart';
import 'package:ket/ui/theme/KetGlobal.dart';
import 'package:ket/ui/theme/KetTextStyle.dart';

class TutorialTMoneyMake extends StatefulWidget {
  final bool isFirstSpace;

  const TutorialTMoneyMake({super.key, this.isFirstSpace = false});

  @override
  State<StatefulWidget> createState() => _TutorialTMoneyMakeState();
}

class _TutorialTMoneyMakeState extends State<TutorialTMoneyMake> {
  BannerAd? banner;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Visibility(
                  visible: widget.isFirstSpace,
                  child: Column(children: [
                    KetGlobal.spaceHeight(32),
                    const AppTitle(),
                  ])
                ),
                FullWidthBannerAd(
                    bannerAd: AdManager.instance.bannerAd,
                    sidePadding: 10.0
                ),
                KetGlobal.spaceHeight(20),
                Image.asset(
                  'assets/images/img_tutorial_t_money.png',
                  width: MediaQuery.of(context).size.width,
                  height: 200,
                  fit: BoxFit.fill,
                ),
                KetGlobal.spaceHeight(10),
                Text(
                    "If you have plans to use public\ntransportation, We are HIGHLY recomend\nyou to use T-money card.\nYou can save your transportation costs.",
                    style: KetTextStyle.notoSansRegular(14)),
                KetGlobal.spaceHeight(30),
                Image.asset(
                  'assets/images/img_tutorial_t_money_make01.png',
                  width: MediaQuery.of(context).size.width,
                  height: 200,
                  fit: BoxFit.fill,
                ),
                KetGlobal.spaceHeight(10),
                Text(
                  "So many designs of cards",
                  style: KetTextStyle.notoSansRegular(14),
                  textAlign: TextAlign.start,
                ),
                KetGlobal.spaceHeight(20),
                Image.asset(
                  'assets/images/img_tutorial_t_money_make02.png',
                  width: MediaQuery.of(context).size.width,
                  height: 200,
                  fit: BoxFit.fill,
                ),
                KetGlobal.spaceHeight(10),
                Text(
                  "T-Money Vending Machine",
                  style: KetTextStyle.notoSansRegular(14),
                  textAlign: TextAlign.start,
                ),
                KetGlobal.spaceHeight(30),
                Image.asset(
                  'assets/images/img_tutorial_t_money_make03.png',
                  width: MediaQuery.of(context).size.width,
                  height: 200,
                  fit: BoxFit.fill,
                ),
                KetGlobal.spaceHeight(10),
                Text(
                  "Charge your card at the card vending machine.",
                  style: KetTextStyle.notoSansRegular(14),
                  textAlign: TextAlign.start,
                ),
                KetGlobal.spaceHeight(20),
                FullWidthBannerAd(
                    bannerAd: AdManager.instance.bannerAd,
                    sidePadding: 10.0
                ),
                KetGlobal.spaceHeight(20),
                Image.asset(
                  'assets/images/img_tutorial_t_money_make04.png',
                  width: MediaQuery.of(context).size.width,
                  height: 200,
                  fit: BoxFit.fill,
                ),
                KetGlobal.spaceHeight(10),
                Text(
                  "All convenience stores",
                  style: KetTextStyle.notoSansRegular(14),
                  textAlign: TextAlign.start,
                ),
                KetGlobal.spaceHeight(30),
                Image.asset(
                  'assets/images/img_tutorial_t_money_make05.png',
                  width: MediaQuery.of(context).size.width,
                  height: 200,
                  fit: BoxFit.fill,
                ),
                KetGlobal.spaceHeight(10),
                Text(
                  "Charge your card at every CVS.",
                  style: KetTextStyle.notoSansRegular(14),
                  textAlign: TextAlign.start,
                ),
                KetGlobal.spaceHeight(20),
                FullWidthBannerAd(
                    bannerAd: AdManager.instance.bannerAd,
                    sidePadding: 10.0
                ),
              ],
            )),
      ),
    );
  }
}
