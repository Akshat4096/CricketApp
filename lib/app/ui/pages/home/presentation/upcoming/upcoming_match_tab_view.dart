import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:ny_cricket_app/app/controller/ad_controller.dart';
import 'package:ny_cricket_app/app/controller/home_controller.dart';
import 'package:ny_cricket_app/app/global/asset_constants.dart';
import 'package:ny_cricket_app/app/ui/pages/home/widgets/upcoming_match_card.dart';
import 'package:ny_cricket_app/app/utils/helpers/exporter.dart';
import 'package:ny_cricket_app/app/utils/helpers/getItHook/getit_hook.dart';

class UpcomingMatchTabView extends GetItHook<HomeController> {
  const UpcomingMatchTabView({super.key});

  @override
  Widget build(BuildContext context) {
    final AdController adController = Get.find<AdController>();

    return Obx(() {
      var eventData = controller.fetcheventData.value?.data ?? [];
      var filteredEvents = eventData.where((event) {
        return event.eventName.toString().contains("v");
      }).toList();

      return Column(
        children: [
          SizedBox(height: 20.0.h),
          if (adController.isBannerAdLoaded.value)
            SizedBox(
              height: adController.bannerAd!.size.height.toDouble(),
              width: adController.bannerAd!.size.width.toDouble(),
              child: AdWidget(ad: adController.bannerAd!),
            ),
          SizedBox(height: 10.0.h),
          Expanded(
            child: SingleChildScrollView(
              child: filteredEvents.isEmpty
                  ? Center(child: Text("No upcoming matches found"))
                  : ListView.builder(
                      itemCount: filteredEvents.length,
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      padding: EdgeInsets.only(top: 16.0.h),
                      itemBuilder: (context, index) {
                        var event = filteredEvents[index].eventName;
                        List<String> teams = event.toString().split(" v");
                        String team1Name =
                            teams.isNotEmpty ? teams[0].trim() : "Team 1";
                        String team2Name =
                            teams.length > 1 ? teams[1].trim() : "Team 2";

                        return Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 16.0.w, vertical: 11.5.h),
                          child: InkWell(
                            onTap: () {},
                            child: UpcomingMatchCard(
                              key: ValueKey('MatchCard_$index'),
                              title: event.toString(),
                              team1Name: team1Name,
                              team1Flag: AssetConstants.pngEngland,
                              team2Name: team2Name,
                              team2Flag: AssetConstants.pngBangladesh,
                            ),
                          ),
                        );
                      },
                    ),
            ),
          ),
        ],
      );
    });
  }

  @override
  bool get canDisposeController => false;

  @override
  void onDispose() {}

  @override
  void onInit() {
    controller.fetchupcomingevents();
    Get.put(() => AdController());
  }
}
