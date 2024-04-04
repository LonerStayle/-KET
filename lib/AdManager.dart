
import 'package:flutter/cupertino.dart';
import 'package:flutter/src/foundation/platform.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
class AdManager {


  AdManagerBannerAd? _bannerAd;

  AdManager(int number){
    _bannerAd ??= _loadBannerAd(defaultTargetPlatform,number);
  }

  // Get the banner ad
  AdManagerBannerAd? get bannerAd => _bannerAd;

  // Load the banner ad
  AdManagerBannerAd _loadBannerAd(TargetPlatform targetPlatform,int number) {

    const String androidBannerAd01 = 'ca-app-pub-6258051451663316/1416532527';
    const String androidBannerAd02 = 'ca-app-pub-6258051451663316/3672667375';
    const String androidBannerAd03 = 'ca-app-pub-6258051451663316/1025488588';
    const String androidBannerAd04 = 'ca-app-pub-6258051451663316/8996829017';
    const String androidBannerAd05 = 'ca-app-pub-6258051451663316/5560663809';
    const String androidBannerAd06 = 'ca-app-pub-6258051451663316/4602605668';
    const String androidBannerAd07= 'ca-app-pub-6258051451663316/6379238686';

    const String iosBanner01 = 'ca-app-pub-6258051451663316/7905602025';
    const String iosBanner02 = 'ca-app-pub-6258051451663316/6681974094';
    const String iosBanner03 = 'ca-app-pub-6258051451663316/3668163481';
    const String iosBanner04 = 'ca-app-pub-6258051451663316/2355081817';
    const String iosBanner05 = 'ca-app-pub-6258051451663316/1042000146';
    const String iosBanner06 = 'ca-app-pub-6258051451663316/8941822843';
    const String iosBanner07 = 'ca-app-pub-6258051451663316/5057584009';

    String adUnitId;
    if (targetPlatform == TargetPlatform.iOS) {
      if(number == 1) {
        adUnitId = iosBanner01;
      }else if(number == 2) {
        adUnitId = iosBanner02;
      }else if(number == 3) {
        adUnitId = iosBanner03;
      }else if(number == 4) {
        adUnitId = iosBanner04;
      }else if(number == 5) {
        adUnitId = iosBanner05;
      }else if(number == 6) {
        adUnitId = iosBanner06;
      }else  {
        adUnitId = iosBanner07;
      }
    }else {
      if(number == 1) {
        adUnitId = androidBannerAd01;
      }else if(number == 2) {
        adUnitId = androidBannerAd02;
      }else if(number == 3) {
        adUnitId = androidBannerAd03;
      }else if(number == 4) {
        adUnitId = androidBannerAd04;
      }else if(number == 5) {
        adUnitId = androidBannerAd05;
      }else if(number == 6){
        adUnitId = androidBannerAd06;
      }else {
        adUnitId = androidBannerAd07;
      }
    }
      return AdManagerBannerAd(
        adUnitId: adUnitId,
        request: const AdManagerAdRequest(),
        sizes: [AdSize.banner],
        listener: AdManagerBannerAdListener(),
      )..load();
    }
  }
