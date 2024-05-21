import 'dart:convert';
import 'dart:io';


import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:ket/AdManager.dart';
import 'package:ket/FullWidthBannerAd.dart';
import 'package:ket/content/androidPkgName.dart';
import 'package:ket/ui/model/SearchModel.dart';
import 'package:ket/ui/theme/KetColorStyle.dart';
import 'package:ket/ui/theme/KetGlobal.dart';
import 'package:ket/ui/theme/KetTextStyle.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:package_info_plus/package_info_plus.dart';

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

  final _pageController = PageController(viewportFraction: 0.8);

  searchKeywords(String keyword) {
    getSearchAllList(
        keyword,
            () =>
        {
          setState(() {
            List<SearchModel> result = searchAllList
                .where((kw) =>
                kw.keyword
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
        appBar: const PreferredSize(
            preferredSize: Size(double.infinity, 60), child: AppTitle()),
      body: Scaffold(
          body: SingleChildScrollView(
            child: Center(
              child: Column(
                children: <Widget>[
                  FullWidthBannerAd(
                      bannerAd: AdManager(1).bannerAd,
                      sidePadding: 10.0
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
                          width: MediaQuery
                              .of(context)
                              .size
                              .width,
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
                    KetGlobal.spaceHeight(10),
                    Stack(
                      children: [
                        SizedBox(
                          height: 460,
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
                                          'assets/images/img_naver_map00.png',
                                          width: 290,
                                          height: 380),
                                    ),
                                    Padding(
                                        padding: const EdgeInsets.only(
                                            left: 10, right: 10),
                                        child: Text(
                                          "When you search for the type of food\nyou are looking for, this KET app will\nautomatically translate it into Korean\nand go to the Naver Map app.",
                                          style: KetTextStyle.notoSansRegular(13),
                                          textAlign: TextAlign.start,
                                        ))
                                  ],
                                ),
                              ),
                              SizedBox.expand(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(10.0),
                                      child: Image.asset(
                                          'assets/images/img_naver_map01.png',
                                          width: 290,
                                          height: 380),
                                    ),
                                    Padding(
                                        padding: const EdgeInsets.only(
                                            left: 10, right: 10
                                        ),
                                        child: Text(
                                          "영업중 - Open\n실시간 예약 - Reservation\n쿠폰 - Coupon\n포장주문 - Takeaway Order",
                                          style: KetTextStyle.notoSansRegular(13),
                                          textAlign: TextAlign.start,
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
                                          'assets/images/img_naver_map02.png',
                                          width: 290,
                                          height: 380),
                                    ),
                                    Padding(
                                        padding: const EdgeInsets.only(
                                            left: 10, right: 10),
                                        child: Text(
                                          "You can check when the restaurant\nopens and closes.\n영업 전 - Closed (Not open yet)\n00:00에 영업 시작 - Open at 00:00",
                                          style: KetTextStyle.notoSansRegular(13),
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
                                          'assets/images/img_naver_map03.png',
                                          width: 290,
                                          height: 380),
                                    ),
                                    Padding(
                                        padding: const EdgeInsets.only(
                                            left: 10, right: 10),
                                        child: Text(
                                          "You can check the business hours.\n영업 중 - Open\n00:00에 영업 종료 - Close at 00:00",
                                          style: KetTextStyle.notoSansRegular(13),
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
                                          'assets/images/img_naver_map04.png',
                                          width: 290,
                                          height: 380),
                                    ),
                                    Padding(
                                        padding: const EdgeInsets.only(
                                            left: 10, right: 10),
                                        child: Text(
                                          "You can also check the break time\nand the last order time.",
                                          style: KetTextStyle.notoSansRegular(13),
                                          textAlign: TextAlign.start,
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
                                                style: KetTextStyle
                                                    .notoSansRegular(
                                                    16))),
                                      ));
                                })),
                      ],
                    )
                  ])
                ],
              ),
            ),
          ))
    );
  }

  Future<void> openApp(int index) async {
    // TranslationResponse transResult = await getTranslateEN(searchResultList[index].keyword);
    String transResult = searchResultList[index].keyword;
    final info = await PackageInfo.fromPlatform();
    if (Platform.isAndroid) {
      await canLaunchUrl(
        Uri.parse(
            "nmap://search?query=$transResult&appname=${info.packageName}"),
      )
          ? await launchUrl(
        Uri.parse(
            "nmap://search?query=$transResult&appname=${info.packageName}"),
      )
          : await launchUrl(
        Uri.parse(
            "https://play.google.com/store/apps/details?id=${PkgName.NaverMap}"),
      );
    } else if (Platform.isIOS) {
      await canLaunchUrl(
        Uri.parse(
            "nmap://search?query=$transResult&appname=${info.packageName}"),
      )
          ? await launchUrl(
        Uri.parse(
            "nmap://search?query=$transResult&appname=${info.packageName}"),
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

  // Future<TranslationResponse> getTranslateEN(String text) async {
  //   final url = Uri.parse('https://api-free.deepl.com/v2/translate');
  //   final headers = {
  //     'Authorization': 'DeepL-Auth-Key 279a2e9d-83b3-c416-7e2d-f721593e42a0',
  //     'Content-Type': 'application/json',
  //   };
  //   final body = {
  //     "text": [text],
  //     "target_lang": "KO"
  //   };
  //
  //   final response = await http.post(
  //     url,
  //     headers: headers,
  //     body: jsonEncode(body),
  //   );
  //
  //   if (response.statusCode == 200) {
  //     return TranslationResponse.fromJson(jsonDecode(response.body));
  //   } else {
  //     print('Request failed with status: ${response.statusCode}');
  //     print('Response body: ${response.body}');
  //     throw Exception('Failed to load data');
  //   }
  // }

}


class TranslationResponse {
  final String detectedSourceLanguage;
  final String translatedText;

  TranslationResponse(
      {required this.detectedSourceLanguage, required this.translatedText});

  factory TranslationResponse.fromJson(Map<String, dynamic> json) {
    return TranslationResponse(
      detectedSourceLanguage: json['translations'][0]['detected_source_language'],
      translatedText: json['translations'][0]['text'],
    );
  }
}
