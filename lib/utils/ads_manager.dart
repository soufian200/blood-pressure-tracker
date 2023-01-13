import 'package:flutter/cupertino.dart';
import 'package:unity_ads_plugin/unity_ads_plugin.dart';

// Unity Ads
class AdsManager {
  static const bool isAdsEnabled = false;
  static const bool testMode = false;
  static const String gameId = "4957339";

  ///
  static void initUnityAds() async {
    if (isAdsEnabled) {
      print("initUnityAds...");
      await UnityAds.init(
        gameId: gameId,
        testMode: testMode,
        onComplete: () {
          _loadAd();
          print('Initialization Complete');
        },
        onFailed: (error, message) =>
            print('Initialization Failed: $error $message'),
      );
    }
  }

  ///
  static void _loadAd() {
    if (isAdsEnabled) {
      UnityAds.load(
        placementId: 'Interstitial_Android',
        onComplete: (placementId) => print('Load Complete $placementId'),
        onFailed: (placementId, error, message) =>
            print('Load Failed $placementId: $error $message'),
      );
    }
  }

  ///
  static void showInterAd() {
    if (isAdsEnabled) {
      UnityAds.showVideoAd(
          placementId: 'Interstitial_Android',
          onSkipped: (placementId) {
            _loadAd();
          },
          onComplete: (placementId) {
            _loadAd();
          },
          onFailed: (placementId, error, message) {
            _loadAd();
            print("Faiiiiiiiled..........");
          });
    }
  }

  ///
  static Widget bannerAd() {
    if (isAdsEnabled) {
      return UnityBannerAd(
        placementId: 'Banner_Android',
        onLoad: (placementId) => print('Banner loaded: $placementId'),
        onClick: (placementId) => print('Banner clicked: $placementId'),
        onFailed: (placementId, error, message) =>
            print('Banner Ad $placementId failed: $error $message'),
      );
    } else {
      return const SizedBox();
    }
  }
}
