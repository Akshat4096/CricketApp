import 'package:intl/intl.dart';
import 'package:ny_cricket_app/app/controller/home_controller.dart';
import 'package:ny_cricket_app/app/global/asset_constants.dart';
import 'package:ny_cricket_app/app/ui/pages/home/widgets/match_card.dart';
import 'package:ny_cricket_app/app/utils/helpers/exporter.dart';
import 'package:ny_cricket_app/app/utils/helpers/getItHook/getit_hook.dart';

class ComplatedMatchTabView extends GetItHook<HomeController> {
  const ComplatedMatchTabView({super.key});

   @override
  Widget build(context) {
    return Obx(() { 
      var eventData = controller.fetchliveeventData.value?.data ?? [];
      var filteredEvents = eventData.where((event) {
        return event.name.toString().contains("v");
      }).toList();
      return Column(
        children: [
          SizedBox(height: 20.0.h),
          Expanded(
            child: SingleChildScrollView(
              child: 
              // filteredEvents.isEmpty
              //     ? Center(child: Text("No upcoming matches found"))
              //     : 
                  ListView.builder(
                      itemCount: 5,
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      padding: EdgeInsets.only(top: 16.0.h),
                      itemBuilder: (context, index) {
                        // var event = filteredEvents[index].eventName;
                        // var eventDateTime = filteredEvents[index].time;
                        // List<String> teams = event.toString().split(" v");
                        // String team1Name =
                        //     teams.isNotEmpty ? teams[0].trim() : "Team 1";
                        // String team2Name =
                        //     teams.length > 1 ? teams[1].trim() : "Team 2";
                        return Padding( 
                          padding: EdgeInsets.symmetric(
                              horizontal: 16.0.w, vertical: 11.5.h),
                          child: InkWell(
                            onTap: () {
                              // DateTime eventISTTime =
                              //     DateTime.parse(eventDateTime!)
                              //         .toUtc()
                              //         .add(Duration(hours: 5, minutes: 30));
                              // DateTime nowIST = DateTime.now()
                              //     .toUtc()
                              //     .add(Duration(hours: 5, minutes: 30));

                              // if (nowIST.isAfter(eventISTTime) ||
                              //     nowIST.isAtSameMomentAs(eventISTTime)) {
                              //   Get.toNamed(AppRoutes.liveMatchDetailsPage,
                              //       arguments: filteredEvents[index].eventId);
                              // } else {
                              //   Get.snackbar(
                              //     "Match Info",
                              //     "Match will start at ${DateFormat('hh:mm a').format(eventISTTime)}",
                              //     snackPosition: SnackPosition.BOTTOM,
                              //     backgroundColor: Colors.black,
                              //     colorText: Colors.white,
                              //   );
                              // }
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
                            child: ExpandableMatchCard(
                                team1Flag: 'assets/images/ic_cricket_bat.png',
                                team2Flag: 'assets/images/ic_cricket_bat.png',
                                title: 'India v/s Australia',
                                team1Name: 'India',
                                team2Name: 'Australia',
                                team1Score: '320/5 (50)',
                                team2Score: '315/8 (50)',
                                crr: '6.40',
                                tossWinner: 'India won the toss',
                                matchStatus: 'India won by 5 runs',
                                matchnumber: '1',
                                team1Players: [
                                  PlayerStats(
                                      rank: 1,
                                      name: 'User12',
                                      runs: 120,
                                      ),
                                  PlayerStats(
                                      rank: 2,
                                      name: 'User555',
                                      runs: 85,
                                     ),
                                     PlayerStats(
                                    rank: 3,
                                    name: 'fimro',
                                    runs: 30,
                                  ),
                                  PlayerStats(
                                    rank: 4,
                                    name: 'Regaltos',
                                    runs: 10,
                                  ),
                                  PlayerStats(
                                    rank: 5,
                                    name: 'Juck',
                                    runs: 8,
                                  ),
                                  // More players...
                                ],
                              )
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
  void onInit() {}
}
