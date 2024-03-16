import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_naver_map/flutter_naver_map.dart';
import 'package:ket/ui_model/EmbassyModel.dart';
import 'package:ket/ui_theme/KetColorStyle.dart';
import 'package:ket/ui_theme/KetGlobal.dart';
import 'package:ket/ui_theme/KetTextStyle.dart';
import 'package:url_launcher/url_launcher.dart';

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
  EmbassyModel? _embassyModel;

  final List<EmbassyModel> mockOrgSearchList = <EmbassyModel>[
    EmbassyModel("Embassy of Japan in Korea", "0221705200", "(02)2170-5200",
        37.575173, 126.980098, false),
    EmbassyModel("Embassy of People's Republic of China, Seoul", "027719020",
        "(02)771-9020", 37.563028, 126.982989, false),
    EmbassyModel("USA. Embassy in Seoul, Republic Of Korea, Seoul", "023974114",
        "(02)397-4114", 37.573105, 126.977871, false),
    EmbassyModel("Taipei Mission in Korea", "0263296000", "02-6329-6000",
        37.569519, 126.976184, false),
    EmbassyModel("Vietnam Embassy Seoul", "027399399", "02-739-9399", 37.586497,
        126.984043, false),
    EmbassyModel("Embassy of Germany", "027484114", "02-748-4114", 37.555526,
        126.973741, false),
    EmbassyModel("Embassy of Denmark, Korea", "027954187", "02-795-4187",
        37.555526, 126.973741, false),
    EmbassyModel("Embassy of France", "0231494300", "02-3149-4300", 37.561304,
        126.965702, false),
  ];

  List<EmbassyModel> searchResultList = <EmbassyModel>[];

  searchKeywords(String keyword) {
    setState(() {
      List<EmbassyModel> result = mockOrgSearchList
          .where((kw) => kw.name.toLowerCase().contains(keyword.toLowerCase()))
          .toList();
      searchResultList = result;
    });
  }

  onSearchItemTapped(int index) async {
    setState(() {
      _naverMapController?.clearOverlays();
      searchResultList[index].isSelect = true;
      onSelectEmbassy(searchResultList[index]);
    });
    await Future.delayed(const Duration(microseconds: 30000));
    setState(() {
      searchResultList[index].isSelect = false;
      searchController.clear();
      _isSearchUIVisible = false;
      FocusManager.instance.primaryFocus?.unfocus();
    });
  }

  onSelectEmbassy(EmbassyModel embassy) {
    setState(() {
      var image = const NOverlayImage.fromAssetImage(
          'assets/icons/ic_naver_marker.png');

      _embassyModel = embassy;
      _selectMarker = NMarker(
          id: embassy.name,
          position: NLatLng(embassy.let, embassy.long),
          icon: image,
          size: const Size(48, 48),
          caption: NOverlayCaption(text: embassy.name));

      _selectMarker!.setOnTapListener((overlay) => {
        onSelectEmbassy(embassy)}
      );

      var cameraPosition = NCameraUpdate.withParams(
          //latitude 는 꼭 + 를 해줘야 센터가 맞다.
          target: NLatLng(_selectMarker!.position.latitude + 0.0015,
              _selectMarker!.position.longitude));
      _naverMapController?.updateCamera(cameraPosition);
      _naverMapController?.addOverlay(_selectMarker!);
    });
  }

  removeSelectEmbassy() {
    setState(() {
      _selectMarker = null;
      _embassyModel = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: Stack(
          children: [
            Stack(
              children: [
                Positioned(
                    child: NaverMap(
                  onMapTapped: (NPoint point, NLatLng latLng) {
                    FocusScope.of(context).requestFocus(FocusNode());
                    removeSelectEmbassy();
                  },
                  options: const NaverMapViewOptions(
                      locale: Locale('en'), logoAlign: NLogoAlign.leftTop),
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
                                      child: Text(searchResultList[index].name,
                                          style: KetTextStyle.notoSansRegular(
                                              16))),
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
                        Image.asset('assets/icons/ic_embassy.png',
                            width: 16, height: 18),
                        KetGlobal.spaceWidth(8),
                        Text("EMBASSY", style: KetTextStyle.notoSansBold(18.0)),
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
                      padding: const EdgeInsets.only(
                          left: 20, right: 20, bottom: 20),
                      child: Container(
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
                            KetGlobal.spaceHeight(21),
                            Row(
                              children: [
                                KetGlobal.spaceWidth(35),
                                Image.asset('assets/icons/ic_embassy.png',
                                    width: 14, height: 16),
                                KetGlobal.spaceWidth(8),
                                Container(
                                  width: MediaQuery.of(context).size.width * 0.65,
                                  child: Text(
                                      _embassyModel?.name ?? "",
                                      style: KetTextStyle.notoSansRegular(14)),
                                )
                              ],
                            ),
                            KetGlobal.spaceHeight(17),
                            Row(
                              children: [
                                KetGlobal.spaceWidth(35),
                                Image.asset('assets/icons/ic_call.png',
                                    width: 14, height: 16),
                                KetGlobal.spaceWidth(8),
                                Text(_embassyModel?.transPhoneNumber ?? "",
                                    style: KetTextStyle.notoSansRegular(14))
                              ],
                            ),
                            KetGlobal.spaceHeight(21),
                            GestureDetector(
                              onTap: () async {
                                final call = Uri.parse(
                                    'tel:+82 ${_embassyModel?.phoneNumber}');
                                if (await canLaunchUrl(call)) {
                                  launchUrl(call);
                                } else {
                                  throw 'Could not launch $call';
                                }
                              },
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    bottom: 17, left: 17, right: 17),
                                child: Container(
                                  width: MediaQuery.of(context).size.width,
                                  height: 50,
                                  decoration: const BoxDecoration(
                                    color: KetColorStyle.montegoBay,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(12.0)),
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text("CALL This Number",
                                          style: KetTextStyle.notoSansBoldColor(
                                              20, KetColorStyle.white)),
                                      KetGlobal.spaceWidth(5),
                                      Image.asset(
                                        'assets/icons/ic_call_embassy.png',
                                        width: 28,
                                        height: 26,
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ))
                ])),
          ],
        ),
      ),
    );
  }


}
