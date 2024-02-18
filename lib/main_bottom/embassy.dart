import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_naver_map/flutter_naver_map.dart';
import 'package:ket/ui_model/SearchModel.dart';
import 'package:ket/ui_theme/KetColorStyle.dart';
import 'package:ket/ui_theme/KetGlobal.dart';
import 'package:ket/ui_theme/KetTextStyle.dart';

class Embassy extends StatefulWidget {
  const Embassy({super.key});

  @override
  State<StatefulWidget> createState() => _EmbassyState();
}

class _EmbassyState extends State<Embassy> {
  final searchController = TextEditingController();
  bool _isSearchUIVisible = false;

  NaverMapController? _naverMapController;
  NMarker? _selectMarker;

  final List<SearchModel> mockOrgSearchList = <SearchModel>[
    SearchModel("pork belly", false),
    SearchModel("medium pork belly", false),
    SearchModel("well done pork belly", false),
  ];

  List<SearchModel> searchResultList = <SearchModel>[];

  searchKeywords(String keyword) {
    setState(() {
      List<SearchModel> result = mockOrgSearchList
          .where((kw) => kw.keyword.contains(keyword))
          .toList();
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
    });
  }

  onSelectEmbassy() {
    setState(() {
      var image = const NOverlayImage.fromAssetImage(
          'assets/icons/ic_naver_marker.png');

      _selectMarker = NMarker(
          id: "test",
          position: const NLatLng(37.5658, 126.9751),
          icon: image,
          size: const Size(48, 48),
          caption: const NOverlayCaption(text: '경선이 대사관'));

      _selectMarker!.setOnTapListener((overlay) => {
            ScaffoldMessenger.of(context)
                .showSnackBar(const SnackBar(content: Text("Testtt")))
          });

      var cameraPosition = NCameraUpdate.withParams(
          //latitude 는 꼭 + 를 해줘야 센터가 맞다.
          target: NLatLng(_selectMarker!.position.latitude + 0.001,
              _selectMarker!.position.longitude));
      _naverMapController?.updateCamera(cameraPosition);
      _naverMapController?.addOverlay(_selectMarker!);
    });
  }

  removeSelectEmbassy() {
    setState(() {
      _naverMapController?.clearOverlays();
      _selectMarker = null;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Stack(
            children: [
              Positioned(
                  child: NaverMap(
                options: const NaverMapViewOptions(locale: Locale('en')),
                onMapReady: (controller) {
                  _naverMapController = controller;
                },
              )),
              Container(
                height: 182,
                color: KetColorStyle.white,
              ),
              Visibility(
                  visible: _isSearchUIVisible,
                  child: Column(children: [
                    KetGlobal.spaceHeight(156),
                    ListView.builder(
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
                                    child: Text(searchResultList[index].keyword,
                                        style:
                                            KetTextStyle.notoSansRegular(16))),
                              ));
                        })
                  ])),
            ],
          ),
          Column(children: <Widget>[
            Container(
              width: 320,
              height: 50,
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
                                controller: searchController,
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
                                    _isSearchUIVisible = text.isNotEmpty;
                                    searchKeywords(text);
                                  });
                                },
                              )),
                        ),
                        KetGlobal.spaceWidth(13),
                        Visibility(
                            visible: _isSearchUIVisible,
                            child: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    searchController.clear();
                                    _isSearchUIVisible = false;
                                  });
                                },
                                child: Image.asset('assets/icons/ic_x.png',
                                    width: 22, height: 22))),
                        KetGlobal.spaceWidth(13)
                      ],
                    ),
                  ),
                ]))
          ]),
          Visibility(
              visible: _selectMarker != null,
              child: Column(children: [
                const Spacer(),
                Padding(
                    padding:
                        const EdgeInsets.only(left: 20, right: 20, bottom: 20),
                    child: Container(
                      height: 160,
                      width: MediaQuery.of(context).size.width,
                      decoration: const BoxDecoration(
                          color: KetColorStyle.white,
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          boxShadow: [
                            BoxShadow(
                              color: KetColorStyle.grayBorder,
                              blurRadius: 4,
                              offset: Offset(4, 8), // Shadow position
                            ),
                          ]),
                      child: Column(
                        children: [
                          GestureDetector(
                            onTap: () {
                              /**test*/
                              removeSelectEmbassy();
                            },
                          )
                        ],
                      ),
                    ))
              ])),
          Positioned(
              top: 500,
              left: 110,
              child: GestureDetector(
                onTap: () {
                  onSelectEmbassy();
                },
                child: Text("테스트 버튼",
                    style: KetTextStyle.notoSansBoldColor(
                        36, KetColorStyle.catalan)),
              ))
        ],
      ),
    );
  }
}
