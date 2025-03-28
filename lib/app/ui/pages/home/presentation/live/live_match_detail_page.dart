import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:ny_cricket_app/app/controller/ad_controller.dart';
import 'package:ny_cricket_app/app/controller/home_controller.dart';
import 'package:ny_cricket_app/app/generated/l10n.dart';
import 'package:ny_cricket_app/app/global/asset_constants.dart';
import 'package:ny_cricket_app/app/ui/pages/home/model/get_score_model.dart';
import 'package:ny_cricket_app/app/ui/pages/home/widgets/live_score_stats_card.dart';
import 'package:ny_cricket_app/app/ui/pages/home/widgets/match_score_card.dart';
import 'package:ny_cricket_app/app/ui/widgets/common/app_button.dart';
import 'package:ny_cricket_app/app/ui/widgets/common/image_view.dart';
import 'package:ny_cricket_app/app/ui/widgets/custom/custom_app_bar.dart';
import 'package:ny_cricket_app/app/utils/helpers/dimenson.dart';
import 'package:ny_cricket_app/app/utils/helpers/exporter.dart';
import 'package:ny_cricket_app/app/utils/helpers/getItHook/getit_hook.dart';
import 'package:cron/cron.dart';

class LiveMatchDetailsPage extends GetItHook<HomeController> {
  LiveMatchDetailsPage({super.key});

  final int eventId = Get.arguments;
  final _cron = Cron();

  @override
  Widget build(BuildContext context) {
    final AdController adController = Get.find<AdController>();

    Logger.log(controller.getScoreData.value?.data.toString() ?? 'sds');
    return Scaffold(
      appBar: CustomAppBar(iconcolor: ThemeData().customColors.whiteColor),
      body: Column(
        children: [
          if (adController.isRewardedAdLoaded.value)
            Expanded(
              flex: 1,
              child: SizedBox(
                height: adController.bannerAd!.size.height.toDouble(),
                width: adController.bannerAd!.size.width.toDouble(),
                child: AdWidget(ad: adController.bannerAd!),
              ),
            ),
          controller.getScoreData.value?.data == null
              ? Center(child: Text("No Data Found"))
              : Obx(() => Expanded(
                    flex: 10,
                    child: ListView(
                      children: [
                        _buildMatchScoreCard(),
                        _buildLiveScoreBoard(context),
                        _buildBattersTable(),
                        buildSizedBoxH(16),
                        _buildViewAllScoreLink(context),
                        _buildReviewsSection(context),
                      ],
                    ),
                  )),
        ],
      ),
    );
  }

  Widget _buildMatchScoreCard() {
    // Safely getting matchTitle, and defaulting to an empty string if null.
    String summary =
        controller.getScoreData.value?.data[0].data.score.matchTitle ?? "";

    // If summary is empty, we still want to default to "Team 1" and "Team 2".
    List<String> teams =
        summary.isNotEmpty ? summary.split(" v") : ["Team 1", "Team 2"];

    // Assigning team names, making sure to handle cases where there's only one team.
    String team1Name = teams.isNotEmpty ? teams[0].trim() : "Team 1";
    String team2Name = teams.length > 1 ? teams[1].trim() : "Team 2";

    // Getting scores and safely handling null values using fallback values.
    String team1Score = controller
                .getScoreData.value?.data[0].data.score.innings.isNotEmpty ==
            true
        ? "${controller.getScoreData.value?.data[0].data.score.innings[0].runs ?? '0'}-${controller.getScoreData.value?.data[0].data.score.innings[0].wickets ?? '0'}(${controller.getScoreData.value?.data[0].data.score.innings[0].overs ?? '0'})"
        : '0-0(0)';

    // Empty string for team2Score and other variables as placeholders.
    String team2Score = '';
    String crr = '';
    String tossWinner = '';

    String matchStatus =
        controller.getScoreData.value?.data[0].data.score.matchCommentary ?? '';

    String matchnumber =
        (controller.getScoreData.value?.data[0].data.score.innings.isNotEmpty ==
                    true &&
                controller.getScoreData.value?.data[0].data.score.innings[0]
                        .isFinalInnings ==
                    true)
            ? "2"
            : "1";

    return MatchScoreCard(
      team1FlagUrl: AssetConstants.pngEngland,
      team2FlagUrl: 'https://example.com/australia_flag.png',
      team1Name: team1Name,
      team2Name: team2Name,
      team1Score: team1Score,
      team2Score: team2Score,
      crr: crr,
      tossWinner: tossWinner,
      matchStatus: matchStatus,
      matchnumber: matchnumber,
    );
  }

  Widget _buildLiveScoreBoard(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16.0.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            Lang.of(context).lbl_live_score_board,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  fontSize: 18.0.sp,
                  fontWeight: FontWeight.w400,
                ),
          ),
          buildSizedBoxH(16),
        ],
      ),
    );
  }

  Widget _buildBattersTable() {
    // Get the first innings data
    InningsData? firstInnings =
        controller.getScoreData.value!.data[0].data.score.innings.isNotEmpty
            ? controller.getScoreData.value?.data[0].data.score.innings.first
            : null;

    return LivescoreStatsCard(
      bowlers: firstInnings?.bowlers
              .map((bowlerData) => Bowler(
                    name: bowlerData.bowlerName,
                    wicketsRuns: "${bowlerData.wickets}-${bowlerData.runs}",
                    overs: bowlerData.overs.toString(),
                    economy: bowlerData.overs > 0
                        ? (bowlerData.runs / bowlerData.overs)
                            .toStringAsFixed(2)
                        : '0.00',
                  ))
              .toList() ??
          [],
      batters: firstInnings?.batsmen
              .map((batsmanData) => Batter(
                    name: batsmanData.batsmanName,
                    runs: batsmanData.runs.toString(),
                    balls: batsmanData.balls.toString(),
                    fours: batsmanData.fours.toString(),
                    sixes: batsmanData.sixes.toString(),
                    strikeRate: batsmanData.balls > 0
                        ? ((batsmanData.runs / batsmanData.balls) * 100)
                            .toStringAsFixed(2)
                        : '0.00',
                    isPlaying: batsmanData.active,
                    pship:
                        '', // You might need to calculate partnership from other data
                    lastwkt:
                        '', // You might need to extract this from fall of wickets
                    highlighted: batsmanData.onStrike,
                  ))
              .toList() ??
          [],
    );

    //  [
    //   Batter(
    //       name: 'Heather Knight',
    //       runs: '8',
    //       balls: '10',
    //       fours: '2',
    //       sixes: '0',
    //       strikeRate: '80.0',
    //       isPlaying: true,
    //       pship: ' 13(24)',
    //       lastwkt: 'S Dunkley 4(5)',
    //       highlighted: false),
    //   Batter(
    //       name: 'Vikas Singh',
    //       runs: '3',
    //       balls: '11',
    //       fours: '0',
    //       sixes: '0',
    //       strikeRate: '27.4',
    //       isPlaying: false,
    //       pship: ' 13(24)',
    //       lastwkt: 'S Dunkley 4(5)',
    //       highlighted: false),
    // ],
  }

  Widget _buildViewAllScoreLink(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.0.w),
      child: Align(
        alignment: Alignment.centerRight,
        child: InkWell(
          onTap: () {
            //TODO: Scoreboard page
            // NavigatorService.pushNamed(AppRoutes.scoreboardpage);
          },
          child: Text(
            Lang.of(context).lbl_view_all_score,
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontSize: 14.0.sp,
                  fontWeight: FontWeight.w600,
                  decoration: TextDecoration.underline,
                  decorationColor: Theme.of(context).primaryColor,
                  color: Theme.of(context).primaryColor,
                ),
          ),
        ),
      ),
    );
  }

  Widget _buildReviewsSection(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            Lang.of(context).lbl_reviews,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  fontSize: 18.0.sp,
                  fontWeight: FontWeight.w400,
                ),
          ),
          buildSizedBoxH(16),
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: ThemeData().customColors.textfieldfillcolor,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              children: [
                CustomImageView(
                  imagePath: AssetConstants.icMessage,
                  height: 24.h,
                ),
                buildSizedboxW(16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '57,049',
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w600,
                          ),
                    ),
                    buildSizedBoxH(3),
                    Text(
                      Lang.of(context).lbl_total_votes,
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w400,
                            color: ThemeData().customColors.onboardingH1Color,
                          ),
                    ),
                  ],
                ),
                const Spacer(),
                CustomElevatedButton(
                  onPressed: () {
                    Get.toNamed(AppRoutes.quizPage,
                        arguments: eventId.toString());
                  },
                  height: 45.0.h,
                  buttonTextStyle:
                      Theme.of(context).textTheme.bodyLarge?.copyWith(
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
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  bool get canDisposeController => false;

  @override
  void onDispose() {
    _cron.close();
  }

  @override
  void onInit() {
    controller.getscoreDetails(eventId);

    _cron.schedule(Schedule.parse('*/3 * * * * *'), () {
      controller.getscoreDetails(eventId);
    });
  }
}
