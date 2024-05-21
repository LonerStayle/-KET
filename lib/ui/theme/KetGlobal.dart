import 'package:flutter/material.dart';
import 'package:ket/ui/theme/KetColorStyle.dart';
import 'package:ket/ui/theme/KetTextStyle.dart';

class KetGlobal {
  static Container spaceHeight(double height) {
    return Container(height: height);
  }

  static Container spaceWidth(double width) {
    return Container(width: width);
  }

  static Container divider() {
    return Container(
        width: double.infinity, height: 10, color: KetColorStyle.airOfMint);
  }
}

class KetCheckbox extends StatefulWidget {
  const KetCheckbox({Key? key, required this.setChecked}) : super(key: key);
  final Function(bool) setChecked;

  @override
  State<KetCheckbox> createState() => _KetCheckboxState();
}

class _KetCheckboxState extends State<KetCheckbox> {
  bool _isChecked = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _isChecked = !_isChecked;
          widget.setChecked(_isChecked);
        });
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(children: [
            KetGlobal.spaceHeight(8),
            Image.asset(
                _isChecked
                    ? 'assets/icons/ic_check_box_on.png'
                    : 'assets/icons/ic_check_box_off.png',
                width: 30,
                height: 36)
          ]),
          KetGlobal.spaceWidth(6),
          Text("Don't show this again.",
              style: KetTextStyle.notoSansRegular(15))
        ],
      ),
    );
  }
}

class AppTitle extends StatefulWidget {
  const AppTitle({super.key});

  @override
  State<AppTitle> createState() => _AppTitleState();
}

class _AppTitleState extends State<AppTitle> {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(left: 15, top: 32, right: 15, bottom: 11),
        child: Stack(children: [
          Container(
              alignment: Alignment.centerLeft,
              child: GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Image.asset('assets/icons/ic_back.png',
                    width: 30, height: 30),
              )),
          Container(
              alignment: Alignment.center,
              width: MediaQuery.of(context).size.width,
              child: Image.asset('assets/images/img_app_title.png',
                  width: 57, height: 38))
        ]));
  }
}
