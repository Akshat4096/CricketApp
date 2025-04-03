import 'package:intl/intl.dart';
import 'package:ny_cricket_app/app/generated/l10n.dart';
import 'package:ny_cricket_app/app/ui/pages/home/widgets/team_row.dart';
import 'package:ny_cricket_app/app/utils/helpers/dimenson.dart';
import 'package:ny_cricket_app/app/utils/helpers/exporter.dart';

class UpcomingMatchCard extends StatelessWidget {
  final String title;
  final String eventTime ;
  final String team1Name;
  final String team1Flag;
  final String team2Name;
  final String team2Flag;

  const UpcomingMatchCard({
    super.key,
    required this.eventTime,
    required this.title,
    required this.team1Name,
    required this.team1Flag,
    required this.team2Name,
    required this.team2Flag,
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
        TeamRow(flag: team1Flag, name: team1Name, score: '', overs: ''),
        _buildVsLabel(context),
        TeamRow(flag: team2Flag, name: team2Name, score: ''),
        buildSizedBoxH(16),
        Text(
          formatToIST(eventTime),
          style: textStyle?.copyWith(
            fontSize: 14.0.sp,
          ),
        )
      ],
              ),
    );
  }
String formatToIST(String utcTime) {
    DateTime utcDateTime = DateTime.parse(utcTime).toUtc();
    DateTime istDateTime = utcDateTime.add(Duration(hours: 5, minutes: 30));

    return DateFormat('dd MMM yyyy, hh:mm a').format(istDateTime);
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
}
