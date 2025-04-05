import 'package:intl/intl.dart';
import 'package:ny_cricket_app/app/generated/l10n.dart';
import 'package:ny_cricket_app/app/global/asset_constants.dart';
import 'package:ny_cricket_app/app/ui/pages/home/widgets/team_row.dart';
import 'package:ny_cricket_app/app/ui/widgets/common/image_view.dart';
import 'package:ny_cricket_app/app/utils/helpers/dimenson.dart';
import 'package:ny_cricket_app/app/utils/helpers/exporter.dart';

class MatchCard extends StatelessWidget {
  final String eventTime ;
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
    required this.eventTime,
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
        Column(
          children: [
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
            isCurrentTimeMatching(eventTime) ?
            SizedBox() : 
            Text(
              formatToIST(eventTime),
              style: textStyle?.copyWith(fontSize: 12.sp),
            ),
          ],
        ),
      ],
    );
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

    return DateFormat(' At hh:mm a').format(istDateTime);
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

class ExpandableMatchCard extends StatefulWidget {
  final String title;
  final String team1Flag;
  final String team2Flag;
  final String team1Name;
  final String team2Name;
  final String team1Score;
  final String team2Score;
  final String crr;
  final String tossWinner;
  final String matchStatus;
  final String matchnumber;
  final List<PlayerStats> team1Players;

  const ExpandableMatchCard({
    super.key,
    required this.title,
    required this.team1Flag,
    required this.team2Flag,
    required this.team1Name,
    required this.team2Name,
    required this.team1Score,
    required this.team2Score,
    required this.crr,
    required this.tossWinner,
    required this.matchStatus,
    required this.matchnumber,
    required this.team1Players,
  });

  @override
  State<ExpandableMatchCard> createState() => _ExpandableMatchCardState();
}

class _ExpandableMatchCardState extends State<ExpandableMatchCard> {
  bool _isExpanded = false;
 
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final customColors = theme.customColors;
    final textStyle = theme.textTheme.bodyMedium;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Match Summary (always visible)
        _buildTitleRow(context, customColors, textStyle),
        buildSizedBoxH(16),
        TeamRow(
            isCompleted: true,
            flag: widget.team1Flag,
            name: widget.team1Name,
            score: widget.team1Score,
            ),
        _buildVsLabel(context),
        TeamRow(
           isCompleted: true,
          flag: widget.team2Flag, name: widget.team2Name, score: widget.team2Score),
        buildSizedBoxH(16),
        Divider(height: 0),
        
        // Expandable Leaderboard
        if (_isExpanded) _buildLeaderboard(context),
        // Expand/Collapse Button
        Padding(
          padding: const EdgeInsets.only(left: 150),
          child: _buildExpandButton(context),
        ),
      ],
    );
  }

  Row _buildTitleRow(
      BuildContext context, CustomColors customColors, TextStyle? textStyle) {
    return Row(
      children: [
        Expanded(
          child: Text(
            widget.title,
            style: textStyle?.copyWith(fontSize: 12.sp),
          ),
        ),
        Column(
          children: [
            Row(
              children: [
                // CircleAvatar(
                //   radius: 2,
                //   backgroundColor: customColors.redcolor,
                // ),
                buildSizedboxW(9),
                // Text(
                //   Lang.of(context).lbl_live,
                //   style: textStyle?.copyWith(
                //     color: customColors.redcolor,
                //     fontSize: 12.sp,
                //   ),
                // ),
              ],
            ),
            // isCurrentTimeMatching(eventTime)
            //     ? SizedBox()
            //     : Text(
            //         formatToIST(eventTime),
            //         style: textStyle?.copyWith(fontSize: 12.sp),
            //       ),
          ],
        ),
      ],
    );
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

    return DateFormat(' At hh:mm a').format(istDateTime);
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

  

  Widget _buildLeaderboard(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
      child: Column(
        children: [
          SizedBox(height: 16.h),
          // Team 1 Leaderboard
          SizedBox(height: 8.h),
          _buildPlayerTable(widget.team1Players),
          
          SizedBox(height: 16.h),
        ],
      ),
    );
  }

  Widget _buildPlayerTable(List<PlayerStats> players) {
    return Table(
      columnWidths: const {
        0: FlexColumnWidth(1),
        1: FlexColumnWidth(3),
        2: FlexColumnWidth(2),
      },
      border: TableBorder(
        horizontalInside: BorderSide(
          color: Colors.grey.withOpacity(0.3),
          width: 1,
        ),
      ),
      children: [
        // Header
        TableRow(
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColor.withOpacity(0.1),
          ),
          children: [
            _buildTableHeaderCell('Rank'),
            _buildTableHeaderCell('Player'),
            _buildTableHeaderCell('Score'),
          ],
        ),
        // Player rows
        ...players.map((player) => TableRow(
              children: [
                _buildTableCell(player.rank.toString()),
                _buildTableCell(player.name),
                _buildTableCell(player.runs.toString()),
              ],
            )).toList(),
      ],
    );
  }

  Widget _buildTableHeaderCell(String text) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.h),
      child: Text(
        text,
        style: Theme.of(context).textTheme.bodySmall?.copyWith(
              fontWeight: FontWeight.bold,
              fontSize: 12.sp,
            ),
        textAlign: TextAlign.center,
      ),
    );
  }

  Widget _buildTableCell(String text) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.h),
      child: Text(
        text,
        style: Theme.of(context).textTheme.bodySmall?.copyWith(
              fontSize: 12.sp,
            ),
        textAlign: TextAlign.center,
      ),
    );
  }

  Widget _buildExpandButton(BuildContext context) {
    return InkWell(
      onTap: () {
        setState(() {
          _isExpanded = !_isExpanded;
        });
      },
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 8.h),
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColor.withOpacity(0.05),
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(12.r),
            bottomRight: Radius.circular(12.r),
          ),
        ),
        child: Row(
          children: [
            Text(
              'LeadBoard',
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.bold,
                  ),
            ),
            Icon(
              _isExpanded ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down,
              color: Theme.of(context).primaryColor,
              size: 24.w,
            ),
          ],
        ),
      ),
    );
  }
}

class PlayerStats {
  final int rank;
  final String name;
  final int runs;

  PlayerStats({
    required this.rank,
    required this.name,
    required this.runs,
  });
}

// Example usage:
/*
ExpandableMatchCard(
  team1FlagUrl: 'assets/flags/india.png',
  team2FlagUrl: 'assets/flags/australia.png',
  team1Name: 'India',
  team2Name: 'Australia',
  team1Score: '320/5 (50)',
  team2Score: '315/8 (50)',
  crr: '6.40',
  tossWinner: 'India won the toss',
  matchStatus: 'India won by 5 runs',
  matchnumber: '1',
  team1Players: [
    PlayerStats(rank: 1, name: 'Virat Kohli', runs: 120, wickets: 0),
    PlayerStats(rank: 2, name: 'Rohit Sharma', runs: 85, wickets: 0),
    // More players...
  ],
  team2Players: [
    PlayerStats(rank: 1, name: 'Steve Smith', runs: 110, wickets: 0),
    PlayerStats(rank: 2, name: 'David Warner', runs: 75, wickets: 0),
    // More players...
  ],
)
*/