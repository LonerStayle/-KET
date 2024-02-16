import 'package:flutter/material.dart';
import 'package:ket/ui_theme/KetColorStyle.dart';
import 'package:ket/ui_theme/KetTextStyle.dart';

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
  const KetCheckbox({Key? key}) : super(key: key);

  @override
  State<KetCheckbox> createState() => _KetCheckboxState();
}

class _KetCheckboxState extends State<KetCheckbox> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          setState(() => isChecked = !isChecked);
        },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(children: [
                KetGlobal.spaceHeight(8),
                Image.asset(
                    isChecked
                        ? 'assets/icons/ic_check_box_on.png'
                        : 'assets/icons/ic_check_box_off.png',
                    width: 30,
                    height: 36)
              ])
              ,

              KetGlobal.spaceWidth(6),
              Text("Don't show this again.",
                  style: KetTextStyle.notoSansRegular(15))
            ],
          ),
        );
  }
}
