import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ket/content/androidPkgName.dart';
import 'package:ket/ui_theme/KetColorStyle.dart';
import 'package:ket/ui_theme/KetGlobal.dart';
import 'package:ket/ui_theme/KetTextStyle.dart';
import 'package:url_launcher/url_launcher.dart';

class Restaurant extends StatefulWidget {
  const Restaurant({super.key});

  @override
  State<StatefulWidget> createState() => _RestaurantState();
}

class _RestaurantState extends State<Restaurant>  {
  final _controller = TextEditingController();
  bool isSearchUIVisible = false;


  final List<SearchModel> mockOrgSearchList = <SearchModel>[
    SearchModel("pork belly",false),
    SearchModel("medium pork belly",false),
    SearchModel("well done pork belly",false),
  ];

  List<SearchModel> searchResultList = <SearchModel>[];

  searchKeywords(String keyword) {
    setState(() {
      List<SearchModel> result = mockOrgSearchList.where((kw) => kw.keyword.contains(keyword)).toList();
      searchResultList = result;
    });
  }

  onSearchItemTapped(int index) async {
    setState(() {
      searchResultList[index].isSelect = true;
    });
    await Future.delayed(const Duration(microseconds: 30000));
    setState(() {
        searchResultList[index].isSelect = false;
        openApp(index);
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset:true,
      body: Center(
        child: Column(
          children: <Widget>[
            Container(
              width: 320,
              height: 100,
              alignment: Alignment.center,
              color: const Color(0xffFAD40F),
              child: const Text("광고"),
            ),
            KetGlobal.spaceHeight(28),
            Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Column(children: [
                  Row(
                    children: [
                      Image.asset('assets/icons/ic_home_restaurant.png',
                          width: 16, height: 18),
                      KetGlobal.spaceWidth(8),
                      Text("RESTAURANT",
                          style: KetTextStyle.notoSansBold(18.0)),
                    ],
                  ),
                  KetGlobal.spaceHeight(3),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 48,
                    decoration: BoxDecoration(
                        border: Border.all(color: KetColorStyle.montegoBay),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(4))),
                    child: Row(
                      children: [
                        KetGlobal.spaceWidth(12),
                        Image.asset('assets/icons/ic_search.png',
                            width: 24, height: 24),
                        KetGlobal.spaceWidth(7),
                        Expanded(
                          child: Container(
                              margin: const EdgeInsets.only(top: 12),
                              alignment: Alignment.center,
                              child: TextField(
                                controller: _controller,
                                inputFormatters: [
                                  LengthLimitingTextInputFormatter(20),
                                ],
                                decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: 'Search...',
                                    hintStyle:
                                        KetTextStyle.notoSansRegularColor(
                                            16, const Color(0xffa1a7c4))),
                                style: KetTextStyle.notoSansRegular(16),
                                onChanged: (text) {
                                  setState(() {
                                    isSearchUIVisible = text.isNotEmpty;
                                    searchKeywords(text);
                                  });
                                },
                              )),
                        ),
                        KetGlobal.spaceWidth(13),
                        Visibility(
                            visible: isSearchUIVisible,
                            child: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    _controller.clear();
                                    isSearchUIVisible = false;
                                  });
                                },
                                child: Image.asset('assets/icons/ic_x.png',
                                    width: 22, height: 22))),
                        KetGlobal.spaceWidth(13)
                      ],
                    ),
                  ),
                  Stack(
                    children: [
                      Column(
                        children: [
                          KetGlobal.spaceHeight(28),
                          // PageView(
                          //
                          // ),
                        ],
                      ),
                      Visibility(

                          visible: isSearchUIVisible,
                          child: ListView.builder(

                          shrinkWrap: true,
                          itemCount: searchResultList.length,
                          itemBuilder: (BuildContext context, int index) {
                            return GestureDetector(
                                onTap: () {
                                  onSearchItemTapped(index);
                                },
                                child: Container(
                                  color: searchResultList[index].isSelect ? KetColorStyle.airOfMint:KetColorStyle.white,
                                  width: 320,
                                  height: 44,
                                  alignment: Alignment.centerLeft,
                                  child: Padding(
                                      padding: const EdgeInsets.only(
                                          top: 10,
                                          bottom: 10,
                                          left: 16,
                                          right: 16),
                                      child: Text(
                                          searchResultList[index].keyword,
                                          style: KetTextStyle.notoSansRegular(16))),
                                ));
                          }))
                    ],
                  )
                ]))
          ],
        ),
      ),
    );
  }

  Future<void> openApp(int index) async {
    if (Platform.isAndroid) {
      await canLaunchUrl(
        Uri.parse("market://launch?id=${PkgName.NaverMap}"),
      )
          ? await launchUrl(
              Uri.parse("market://launch?id=${PkgName.NaverMap}"),
            )
          : await launchUrl(
              Uri.parse(
                  "https://play.google.com/store/apps/details?id=${PkgName.NaverMap}"),
            );
    } else if (Platform.isIOS) {
      await canLaunchUrl(
        Uri.parse("nmap://actionPath?appname=Ket"),
      )
          //if we can launch the url then open the app
          ? await launchUrl(
              Uri.parse("nmap://actionPath?appname=Ket"),
            )
          //if we cannot, then open a link to the playstore so the user downloads the app
          : await launchUrl(
              Uri.parse("http://itunes.apple.com/app/id311867728?mt=8"),
            );
    }
  }

}

class SearchModel {
    final String keyword;
    bool isSelect;
    SearchModel(this.keyword,this.isSelect);
}
