import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ket/ui_theme/KetColorStyle.dart';
import 'package:ket/ui_theme/KetGlobal.dart';
import 'package:ket/ui_theme/KetTextStyle.dart';

class Restaurant extends StatefulWidget {
  const Restaurant({super.key});

  @override
  State<StatefulWidget> createState() => _RestaurantState();
}

class _RestaurantState extends State<Restaurant> {
  final _controller = TextEditingController();
  bool isSearchUIVisible = false;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                                  });
                                },)
                          ),
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
                      ListView.builder(itemBuilder: itemBuilder)
                    ],
                  )
                ]))
          ],
        ),
      ),
    );
  }
}
