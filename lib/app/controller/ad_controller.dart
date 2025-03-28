import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:injectable/injectable.dart' as i;
import 'package:ny_cricket_app/app/utils/helpers/exporter.dart';

@i.lazySingleton
@i.injectable
class AdController extends GetxController {
  BannerAd? bannerAd;
  RxBool isBannerAdLoaded = false.obs;

  InterstitialAd? interstitialAd;
  RxBool isInterstitialAdLoaded = false.obs;

  RewardedAd? rewardedAd;
  RxBool isRewardedAdLoaded = false.obs;

  @override
  void onInit() {
    super.onInit();
    loadBannerAd();
    // loadInterstitialAd();
    loadRewardedAd();
  }

  // Load Banner Ad
  void loadBannerAd() {
    bannerAd = BannerAd(
      size: AdSize.banner,
      adUnitId: 'ca-app-pub-3940256099942544/6300978111', // Test ID
      listener: BannerAdListener(
        onAdLoaded: (Ad ad) {
          isBannerAdLoaded.value = true;
        },
        onAdFailedToLoad: (Ad ad, LoadAdError error) {
          ad.dispose();
          isBannerAdLoaded.value = false;
          Logger.log('Banner Ad failed to load: $error');
        },
      ),
      request: AdRequest(),
    )..load();
  }

  // Load Interstitial Ad
  void loadInterstitialAd() {
    InterstitialAd.load(
      adUnitId: 'ca-app-pub-7095525518116410/9639086839', // Test ID
      request: AdRequest(),
      adLoadCallback: InterstitialAdLoadCallback(
        onAdLoaded: (InterstitialAd ad) {
          interstitialAd = ad;
          isInterstitialAdLoaded.value = true;
        },
        onAdFailedToLoad: (LoadAdError error) {
          isInterstitialAdLoaded.value = false;
          Logger.log('Interstitial Ad failed to load: $error');
        },
      ),
    );
  }

  void showInterstitialAd() {
    if (interstitialAd != null) {
      interstitialAd!.show();
      interstitialAd = null;
      loadInterstitialAd();
    }
  }

  // Load Rewarded Ad
  void loadRewardedAd() {
    RewardedAd.load(
      adUnitId: 'ca-app-pub-3940256099942544/5224354917', // Test ID
      request: AdRequest(),
      rewardedAdLoadCallback: RewardedAdLoadCallback(
        onAdLoaded: (RewardedAd ad) {
          rewardedAd = ad;
          isRewardedAdLoaded.value = true;
        },
        onAdFailedToLoad: (LoadAdError error) {
          isRewardedAdLoaded.value = false;
          Logger.log('Rewarded Ad failed to load: $error');
        },
      ),
    );
  }

  void showRewardedAd() {
    if (rewardedAd != null) {
      rewardedAd!.show(
        onUserEarnedReward: (AdWithoutView ad, RewardItem reward) {
          Logger.log('User earned reward: ${reward.amount} ${reward.type}');
        },
      );
      rewardedAd = null;
      loadRewardedAd();
    }
  }

  @override
  @i.disposeMethod
  void dispose() {
    bannerAd?.dispose();
    interstitialAd?.dispose();
    rewardedAd?.dispose();
    super.dispose();
  }
}
