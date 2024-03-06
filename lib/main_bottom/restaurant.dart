import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ket/content/androidPkgName.dart';
import 'package:ket/ui_model/SearchModel.dart';
import 'package:ket/ui_theme/KetColorStyle.dart';
import 'package:ket/ui_theme/KetGlobal.dart';
import 'package:ket/ui_theme/KetTextStyle.dart';
import 'package:url_launcher/url_launcher.dart';

class Restaurant extends StatefulWidget {
  const Restaurant({super.key});

  @override
  State<StatefulWidget> createState() => _RestaurantState();
}

class _RestaurantState extends State<Restaurant> {
  final _searchController = TextEditingController();
  bool isSearchUIVisible = false;

  List<SearchModel> searchAllList = <SearchModel>[
    SearchModel("pork belly", false),
    SearchModel("medium pork belly", false),
    SearchModel("well done pork belly", false),
  ];

  List<SearchModel> searchResultList = <SearchModel>[];

  final _pageController = PageController(viewportFraction: 0.85);

  searchKeywords(String keyword) {
    getSearchAllList(
        keyword,
        () => {
              setState(() {
                List<SearchModel> result = searchAllList
                    .where((kw) => kw.keyword
                        .toLowerCase()
                        .contains(keyword.toLowerCase()))
                    .toList();
                searchResultList = result;
              })
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
        body: SingleChildScrollView(
      child: Center(
        child: Column(
          children: <Widget>[
            Container(
              width: 320,
              height: 50,
              alignment: Alignment.center,
              color: const Color(0xffFAD40F),
              child: const Text("광고"),
            ),
            KetGlobal.spaceHeight(28),
            Column(children: [
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
                                controller: _searchController,
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
                                    _searchController.clear();
                                    isSearchUIVisible = false;
                                  });
                                },
                                child: Image.asset('assets/icons/ic_x.png',
                                    width: 22, height: 22))),
                        KetGlobal.spaceWidth(13)
                      ],
                    ),
                  ),
                ]),
              ),
              Stack(
                children: [
                  SizedBox(
                    height: 500,
                    child: PageView(
                      controller: _pageController,
                      children: [
                        // 첫 번째 페이지
                        SizedBox.expand(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(10.0),
                                child: Image.asset(
                                    'assets/images/img_t_money_logo.png',
                                    width: 320,
                                    height: 340),
                              ),
                              Padding(
                                  padding: const EdgeInsets.only(
                                      left: 10, right: 10),
                                  child: Text(
                                    "찾고자 하는 음식 종류를 검색하면 한국어로 \n자동 번역해서 네이버지도 앱으로 이동 합니다.",
                                    style: KetTextStyle.notoSansRegular(16),
                                  ))
                            ],
                          ),
                        ),

                        SizedBox.expand(
                          child: Column(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(10.0),
                                child: Image.asset(
                                    'assets/images/img_t_money_logo.png',
                                    width: 320,
                                    height: 340),
                              ),
                              Padding(
                                  padding: const EdgeInsets.only(
                                      left: 10, right: 10),
                                  child: Text(
                                    "찾고자 하는 음식 종류를 검색하면 한국어로 \n자동 번역해서 네이버지도 앱으로 이동 합니다.",
                                    style: KetTextStyle.notoSansRegular(16),
                                  ))
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Visibility(
                      visible: isSearchUIVisible,
                      child: ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: searchResultList.length,
                          itemBuilder: (BuildContext context, int index) {
                            return GestureDetector(
                                onTap: () {
                                  onSearchItemTapped(index);
                                },
                                child: Container(
                                  color: searchResultList[index].isSelect
                                      ? KetColorStyle.airOfMint
                                      : KetColorStyle.white,
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
                                          style: KetTextStyle.notoSansRegular(
                                              16))),
                                ));
                          })),
                ],
              )
            ])
          ],
        ),
      ),
    ));
  }

  Future<void> openApp(int index) async {
    if (Platform.isAndroid) {
      await canLaunchUrl(
        Uri.parse(
            "nmap://search?query=${searchResultList[index].keyword}&appname=${PkgName.NaverMap}"),
      )
          ? await launchUrl(
              Uri.parse(
                  "nmap://search?query=${searchResultList[index].keyword}&appname=${PkgName.NaverMap}"),
            )
          : await launchUrl(
              Uri.parse(
                  "https://play.google.com/store/apps/details?id=${PkgName.NaverMap}"),
            );
    } else if (Platform.isIOS) {
      await canLaunchUrl(
        Uri.parse(
            "nmap://actionPath?appname=Ket&search=${searchResultList[index].keyword}"),
      )
          //if we can launch the url then open the app
          ? await launchUrl(
              Uri.parse(
                  "nmap://actionPath?appname=Ket&search=${searchResultList[index].keyword}"),
            )
          //if we cannot, then open a link to the playstore so the user downloads the app
          : await launchUrl(
              Uri.parse("http://itunes.apple.com/app/id311867728?mt=8"),
            );
    }
  }

  void getSearchAllList(String text, Function() onSuccess) async {
    var url = Uri.parse(
        'https://api.edamam.com/auto-complete?app_id=73d9c75a&app_key=e611ca38d18470c7832724535f47c745&q=$text');
    var client = http.Client();
    var response = await client.get(url);
    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      List<String> resultList = List<String>.from(data);
      searchAllList = resultList.map((s) => SearchModel(s, false)).toList();
      onSuccess();
    } else {
      throw Exception('Failed to load album');
    }
  }
}
