import 'package:flutter/widgets.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class FullWidthBannerAd extends StatefulWidget {
  final AdManagerBannerAd? bannerAd;
  final double sidePadding;

  const FullWidthBannerAd(
      {super.key, required this.bannerAd, this.sidePadding = 0});

  @override
  State<StatefulWidget> createState() => _FullWidthBannerAdState();
}

class _FullWidthBannerAdState extends State<FullWidthBannerAd> {
  @override
  Widget build(BuildContext context) {
    if (widget.bannerAd != null) {
      return SizedBox(
          width: MediaQuery.of(context).size.width - widget.sidePadding * 2,
          height: widget.bannerAd!.sizes.first.height.toDouble(),
          child: AdWidget(ad: widget.bannerAd!));
    } else {
      return const SizedBox(width: 0, height: 0);
    }
  }
}


