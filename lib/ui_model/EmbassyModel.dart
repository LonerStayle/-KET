import 'dart:ffi';

class EmbassyModel {
  final String name;
  final String phoneNumber;
  final String transPhoneNumber;
  final double let;
  final double long;
  bool isSelect;

  EmbassyModel(this.name, this.phoneNumber, this.transPhoneNumber, this.let,
      this.long, this.isSelect);
}
