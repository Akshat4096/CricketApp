import 'package:ny_cricket_app/app/generated/l10n.dart';
import 'package:ny_cricket_app/app/global/asset_constants.dart';
import 'package:ny_cricket_app/app/ui/pages/home/widgets/team_row.dart';
import 'package:ny_cricket_app/app/ui/widgets/common/image_view.dart';
import 'package:ny_cricket_app/app/utils/helpers/dimenson.dart';
import 'package:ny_cricket_app/app/utils/helpers/exporter.dart';

class MatchCard extends StatelessWidget {
  final String title;
  final String team1Name;
  final String team1Flag;
  final String team1Score;
  final String team1Overs;
  final String team2Name;
  final String team2Flag;
  final String team2Score;
  final String bowlingTeam;
  final String opinionCount;

  const MatchCard({
    super.key,
    required this.title,
    required this.team1Name,
    required this.team1Flag,
    required this.team1Score,
    required this.team1Overs,
    required this.team2Name,
    required this.team2Flag,
    required this.team2Score,
    required this.bowlingTeam,
    required this.opinionCount,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final customColors = theme.customColors;
    final textStyle = theme.textTheme.bodyMedium;

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: customColors.textfieldfillcolor,
        borderRadius: BorderRadius.circular(15.0.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildTitleRow(context, customColors, textStyle),
          buildSizedBoxH(16),
          TeamRow(
              flag: team1Flag,
              name: team1Name,
              score: team1Score,
              overs: team1Overs),
          _buildVsLabel(context),
          TeamRow(flag: team2Flag, name: team2Name, score: team2Score),
          buildSizedBoxH(16),
          Divider(height: 0),
          buildSizedBoxH(16),
          _buildBowlingAndOpinionRow(context, customColors, textStyle),
        ],
      ),
    );
  }

  Row _buildTitleRow(
      BuildContext context, CustomColors customColors, TextStyle? textStyle) {
    return Row(
      children: [
        Expanded(
          child: Text(
            title,
            style: textStyle?.copyWith(fontSize: 12.sp),
          ),
        ),
        Row(
          children: [
            CircleAvatar(
              radius: 2,
              backgroundColor: customColors.redcolor,
            ),
            buildSizedboxW(9),
            Text(
              Lang.of(context).lbl_live,
              style: textStyle?.copyWith(
                color: customColors.redcolor,
                fontSize: 12.sp,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Padding _buildVsLabel(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8.0.w, vertical: 6.0.h),
      child: Text(
        Lang.of(context).lbl_vs,
        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              fontSize: 12.sp,
              color: Theme.of(context).customColors.onboardingH1Color,
            ),
      ),
    );
  }

  Row _buildBowlingAndOpinionRow(
      BuildContext context, CustomColors customColors, TextStyle? textStyle) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          bowlingTeam,
          style: textStyle?.copyWith(
            fontSize: 12.sp,
            color: Theme.of(context).primaryColor,
          ),
        ),
        Row(
          children: [
            CustomImageView(imagePath: AssetConstants.icMessage, height: 24.h),
            buildSizedboxW(8),
            Text(
              opinionCount,
              style: textStyle?.copyWith(fontSize: 12.sp),
            ),
          ],
        ),
      ],
    );
  }
}
