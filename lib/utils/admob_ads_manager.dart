import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class AdmobAdsManager {
  static const bool isAdsEnabled = true;
  static const bool _testMode = true;

  /// AppID
  static String get appId {
    if (Platform.isAndroid) {
      return "ca-app-pub-8460953965827981~4224934165";
    } else {
      throw UnsupportedError("Unsuported Platform");
    }
  }

  /// BannerAdUnitId
  static String get bannerAdUnitId {
    if (_testMode) {
      // Development
      if (Platform.isAndroid) {
        return 'ca-app-pub-3940256099942544/6300978111';
      }
    } else {
      // Production
      if (Platform.isAndroid) {
        return "ca-app-pub-3465655585438996/2723199206";
      }
    }
    throw UnsupportedError("Unsupported platform");
  }

  /// IntersitialAdUnitId
  static String get intersitialAdUnitId {
    if (_testMode) {
      // Development
      if (Platform.isAndroid) {
        return 'ca-app-pub-3940256099942544/1033173712';
      }
    } else {
      // Production
      if (Platform.isAndroid) {
        return "ca-app-pub-3465655585438996/2148484134";
      }
    }
    throw UnsupportedError("Unsupported platform");
  }

  /// Initialization
  static void admobInit() {
    if (isAdsEnabled) {
      MobileAds.instance.initialize();
    }
  }

  ///
  late InterstitialAd _interstitialAd;
  bool _isInterstitialAdLoaded = false;

  void loadIntertitialAd() {
    if (isAdsEnabled) {
      InterstitialAd.load(
          adUnitId: AdmobAdsManager.intersitialAdUnitId,
          request: const AdRequest(),
          adLoadCallback: InterstitialAdLoadCallback(
            onAdLoaded: (InterstitialAd ad) {
              // Keep a reference to the ad so you can show it later.
              _interstitialAd = ad;
              _isInterstitialAdLoaded = true;
            },
            onAdFailedToLoad: (LoadAdError error) {
              // print('InterstitialAd failed to load: $error');
            },
          ));
    }
  }

  void showAdmobInterAd() {
    if (_isInterstitialAdLoaded && isAdsEnabled) {
      _interstitialAd.show();
    }
  }

  ///
  /// Admob Bannder Ad
  late BannerAd _bannerAd;
  bool _admobBannerLoaded = false;
  void loadBannerAd(Function(bool) onBannerLoaded) {
    if (isAdsEnabled) {
      _bannerAd = BannerAd(
        adUnitId: AdmobAdsManager.bannerAdUnitId,
        request: const AdRequest(),
        size: AdSize.banner,
        listener: BannerAdListener(onAdLoaded: (ad) {
          _admobBannerLoaded = true;
          onBannerLoaded(true);
        }, onAdFailedToLoad: (ad, error) {
          ad.dispose();

          print('Ad load failed (code=${error.code} message=${error.message})');
        }),
      );

      _bannerAd.load();
    }
  }

  Widget getBannerAd() {
    return _admobBannerLoaded && AdmobAdsManager.isAdsEnabled
        ? SizedBox(
            height: _bannerAd.size.height.toDouble(),
            width: _bannerAd.size.width.toDouble(),
            child: AdWidget(ad: _bannerAd),
          )
        : const SizedBox();
  }

  void disposeBannerAd() {
    if (isAdsEnabled && _admobBannerLoaded) {
      _bannerAd.dispose();
    }
  }
}
