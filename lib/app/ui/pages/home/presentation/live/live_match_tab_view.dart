import 'package:intl/intl.dart';
import 'package:ny_cricket_app/app/controller/home_controller.dart';
import 'package:ny_cricket_app/app/generated/l10n.dart';
import 'package:ny_cricket_app/app/global/asset_constants.dart';
import 'package:ny_cricket_app/app/ui/pages/home/widgets/match_card.dart';
import 'package:ny_cricket_app/app/ui/widgets/common/app_button.dart';
import 'package:ny_cricket_app/app/ui/widgets/common/image_view.dart';
import 'package:ny_cricket_app/app/utils/helpers/exporter.dart';
import 'package:ny_cricket_app/app/utils/helpers/getItHook/getit_hook.dart';

class LiveMatchTabView extends GetItHook<HomeController> {
  const LiveMatchTabView({super.key});
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      var eventData = controller.fetchliveeventData.value?.data ?? [];
      var filteredEvents = eventData.where((event) {
        return event.name.toString().contains("v");
      }).toList();

      return Column(
        children: [

          // Testing for quiz 
          CustomElevatedButton(
            onPressed: () {
              Get.toNamed(AppRoutes.quizPage, arguments: '148');
            },
            height: 45.0.h,
            buttonTextStyle: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  color: ThemeData().customColors.blackColor,
                  fontSize: 12.0.sp,
                  fontWeight: FontWeight.w600,
                ),
            width: MediaQuery.of(context).size.width * 0.4,
            text: Lang.of(context).lbl_lets_play,
            leftIcon: CustomImageView(
              height: 43.h,
              imagePath: AssetConstants.pngQuiz,
            ),
          ),
          SizedBox(height: 20.0.h),
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
                        var event = filteredEvents[index].name;
                        var eventDateTime = filteredEvents[index].matchData?.time ?? '2025-03-18T00:00:00Z';
                        List<String> teams = event.toString().split(" v");
                        String team1Name =
                            teams.isNotEmpty ? teams[0].trim() : "Team 1";
                        String team2Name =
                            teams.length > 1 ? teams[1].trim() : "Team 2";
                        return Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 16.0.w, vertical: 11.5.h),
                          child: InkWell(
                            onTap: () {
                              print('--------------${eventDateTime}');
                              DateTime eventISTTime =
                                  DateTime.parse(eventDateTime)
                                      .toUtc()
                                      .add(Duration(hours: 5, minutes: 30));
                              DateTime nowIST = DateTime.now()
                                  .toUtc()
                                  .add(Duration(hours: 5, minutes: 30));

                              if (nowIST.isAfter(eventISTTime) ||
                                  nowIST.isAtSameMomentAs(eventISTTime)) {
                                Get.toNamed(AppRoutes.liveMatchDetailsPage,
                                    arguments: filteredEvents[index].matchData?.eventId);
                              } else {
                                Get.snackbar(
                                  "Match Info",
                                  "Match will start at ${DateFormat('hh:mm a').format(eventISTTime)}",
                                  snackPosition: SnackPosition.BOTTOM,
                                  backgroundColor: Colors.black,
                                  colorText: Colors.white,
                                );
                              }
                              // if (adController.isRewardedAdLoaded.value) {
                              //   adController.rewardedAd!.show(
                              //     onUserEarnedReward:
                              //         (AdWithoutView ad, RewardItem reward) {
                              //       Logger.log(
                              //           "User earned reward: ${reward.amount} ${reward.type}");
                              //     },
                              //   );
                              // } else {
                              //   ScaffoldMessenger.of(context).showSnackBar(
                              //     SnackBar(
                              //         content: Text(
                              //             "Ad not loaded. Try again later.")),
                              //   );
                              // }
                            },
                            child: MatchCard(
                              key: ValueKey('MatchCard_$index'),
                              title: event.toString(),
                              eventTime: eventDateTime,
                              bowlingTeam: '',
                              opinionCount: '',
                              team1Overs: '',
                              team1Score: '',
                              team2Score: '',
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

   bool isCurrentTimeMatching(String utcTime) {
    DateTime utcDateTime = DateTime.parse(utcTime).toUtc();
    DateTime istDateTime = utcDateTime.add(Duration(hours: 5, minutes: 30));

    DateTime nowIST =
        DateTime.now().toUtc().add(Duration(hours: 5, minutes: 30));

    // Check if the event time matches the current IST time (ignoring seconds)
    return DateFormat('dd MMM yyyy, hh:mm a').format(istDateTime) ==
        DateFormat('dd MMM yyyy, hh:mm a').format(nowIST);
  }
  String formatToIST(String utcTime) {
    DateTime utcDateTime = DateTime.parse(utcTime).toUtc();
    DateTime istDateTime = utcDateTime.add(Duration(hours: 5, minutes: 30));

    return DateFormat('hh:mm a').format(istDateTime);
  }

  @override
  bool get canDisposeController => false;

  @override
  void onDispose() {}

  @override
  void onInit() {
    controller.fetchliveevents();
     ever(controller.fetchliveeventData, (value) {
      if (value != null) {
        print('API Response: ${value.toJson()}'); // Log full response
        print('First event matchId: ${value.data?.firstOrNull?.matchData?.eventId }');
        print('First event time: ${value.data?.firstOrNull?.matchData?.time}');
      }
    });
  }
}
