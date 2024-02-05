import 'package:flutter/widgets.dart';
import 'package:ket/ui_theme/KetColorStyle.dart';

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
