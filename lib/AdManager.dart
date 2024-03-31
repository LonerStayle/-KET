import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/src/foundation/platform.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
class AdManager {
  static AdManager? _instance;
  AdManagerBannerAd? _bannerAd;

  // Private constructor
  AdManager._();

  // Singleton instance getter
  static AdManager get instance {
    _instance ??= AdManager._();
    return _instance!;
  }

  // Initialize the ad manager
  void init({required TargetPlatform targetPlatform}) {
    _bannerAd ??= _loadBannerAd(targetPlatform);
  }

  // Get the banner ad
  AdManagerBannerAd? get bannerAd => _bannerAd;

  // Load the banner ad
  AdManagerBannerAd _loadBannerAd(TargetPlatform targetPlatform) {
    const String androidBannerAdUnitId = 'ca-app-pub-6258051451663316/1416532527';
    const String iosBannerAdUnitId = 'ca-app-pub-6258051451663316/7905602025';

    String adUnitId = androidBannerAdUnitId;
    if (targetPlatform == TargetPlatform.iOS) adUnitId = iosBannerAdUnitId;

    return AdManagerBannerAd(
      adUnitId: adUnitId,
      request: const AdManagerAdRequest(),
      sizes: [AdSize.banner],
      listener: AdManagerBannerAdListener(),
    )..load();
  }


}