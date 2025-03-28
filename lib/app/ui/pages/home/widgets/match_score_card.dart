import 'package:ny_cricket_app/app/ui/widgets/common/image_view.dart';
import 'package:ny_cricket_app/app/utils/helpers/dimenson.dart';
import 'package:ny_cricket_app/app/utils/helpers/exporter.dart';

class MatchScoreCard extends StatelessWidget {
  final String team1FlagUrl;
  final String team2FlagUrl;
  final String team1Name;
  final String team2Name;
  final String team1Score;
  final String team2Score;
  final String crr;
  final String tossWinner;
  final String matchStatus;
  final String matchnumber;

  const MatchScoreCard({
    super.key,
    required this.team1FlagUrl,
    required this.team2FlagUrl,
    required this.team1Name,
    required this.team2Name,
    required this.team1Score,
    required this.team2Score,
    required this.crr,
    required this.tossWinner,
    required this.matchStatus,
    required this.matchnumber,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: ThemeData().customColors.textfieldfillcolor,
        borderRadius: BorderRadius.circular(10.r),
        border: Border(
          left: BorderSide(color: Theme.of(context).primaryColor, width: 4.w),
        ),
      ),
      child: Column(
        children: [
          _buildHeader(context),
          Divider(height: 0),
          _buildMatchDetails(context),
          _buildMatchStatus(context),
        ],
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          _buildTeamInfo(team1FlagUrl, team1Name, team1Score, context),
          const Spacer(),
          _buildMatchNumber(context),
        ],
      ),
    );
  }

  Widget _buildTeamInfo(
      String flagUrl, String teamName, String teamScore, BuildContext context) {
    return Row(
      children: [
        CustomImageView(
          height: 43.h,
          margin: const EdgeInsets.all(2),
          imagePath: flagUrl,
          fit: BoxFit.cover,
          radius: BorderRadius.circular(24.r),
        ),
        buildSizedboxW(10),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              teamName,
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium
                  ?.copyWith(fontSize: 14.0.sp),
            ),
            Text(
              teamScore,
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium
                  ?.copyWith(fontSize: 18.0.sp),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildMatchNumber(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 30.0.w, vertical: 8.0.h),
      decoration: BoxDecoration(
        color: ThemeData().customColors.blackColor,
        borderRadius: BorderRadius.circular(5.r),
      ),
      child: Text(
        matchnumber,
        style: Theme.of(context).textTheme.titleMedium?.copyWith(
            color: Theme.of(context).primaryColor,
            fontSize: 18.0.sp,
            fontWeight: FontWeight.w700),
      ),
    );
  }

  Widget _buildMatchDetails(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.0.w, vertical: 8.0.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildCRRDetails(context),
          _buildTossDetails(context),
        ],
      ),
    );
  }

  Widget _buildCRRDetails(BuildContext context) {
    return Text(
      'CRR: $crr',
      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
            fontSize: 12.sp,
            fontWeight: FontWeight.w400,
            color: ThemeData().customColors.onboardingH1Color,
          ),
    );
  }

  Widget _buildTossDetails(BuildContext context) {
    return Text(
      'Toss: $tossWinner',
      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
            fontSize: 12.sp,
            fontWeight: FontWeight.w400,
            color: ThemeData().customColors.onboardingH1Color,
          ),
    );
  }

  Widget _buildMatchStatus(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16),
      padding: EdgeInsets.symmetric(vertical: 8.0.h, horizontal: 16.0.w),
      decoration: BoxDecoration(
        border: Border.all(color: Theme.of(context).primaryColor),
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: Text(
        matchStatus,
        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              fontSize: 12.sp,
              fontWeight: FontWeight.w400,
              color: Theme.of(context).primaryColor,
            ),
      ),
    );
  }
}
