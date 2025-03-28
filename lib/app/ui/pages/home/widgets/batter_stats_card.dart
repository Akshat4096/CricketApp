import 'package:ny_cricket_app/app/generated/l10n.dart';
import 'package:ny_cricket_app/app/global/asset_constants.dart';
import 'package:ny_cricket_app/app/ui/widgets/common/image_view.dart';
import 'package:ny_cricket_app/app/utils/helpers/dimenson.dart';
import 'package:ny_cricket_app/app/utils/helpers/exporter.dart';

class BatterStatsCard extends StatelessWidget {
  final List<Batter> batters;

  const BatterStatsCard({
    super.key,
    this.batters = const [],
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16.0.w),
      decoration: BoxDecoration(
        color: Theme.of(context).customColors.textfieldfillcolor,
        borderRadius: BorderRadius.circular(15.0.r),
      ),
      child: Column(
        children: [
          _buildHeader(context),
          _buildBatterRows(context),
          _buildExtraSection(context)
        ],
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                flex: 3,
                child: Text(
                  Lang.of(context).lbl_batter,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w400,
                        color: Theme.of(context).customColors.onboardingH1Color,
                      ),
                ),
              ),
              ...[
                Lang.of(context).lbl_rb,
                Lang.of(context).lbl_4s,
                Lang.of(context).lbl_6s,
                Lang.of(context).lbl_sr,
              ].map(
                (text) => Expanded(
                  child: Text(
                    text,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          fontSize: 12.0.sp,
                          fontWeight: FontWeight.w400,
                          color:
                              Theme.of(context).customColors.onboardingH1Color,
                        ),
                  ),
                ),
              ),
            ],
          ),
          buildSizedBoxH(16),
          const Divider(height: 0, thickness: 1.0),
        ],
      ),
    );
  }

  Widget _buildBatterRows(BuildContext context) {
    return Column(
      children: batters.map((batter) => _BatterRow(batter: batter)).toList(),
    );
  }

  Widget _buildExtraSection(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          const Divider(height: 0, thickness: 1.0),
          buildSizedBoxH(8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Extra:'),
              Text('1lb, 1w, 1nb'),
            ],
          ),
          const SizedBox(height: 8),
        ],
      ),
    );
  }
}

Widget _buildBowlerHeader(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.all(8),
    child: Row(
      children: [
        Expanded(
          flex: 3,
          child: Text(
            Lang.of(context).lbl_bowler,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  fontSize: 12.0.sp,
                  fontWeight: FontWeight.w400,
                  color: Theme.of(context).customColors.onboardingH1Color,
                ),
          ),
        ),
        ...[
          Lang.of(context).lbl_wr,
          Lang.of(context).lbl_overs,
          Lang.of(context).lbl_econ,
        ].map(
          (text) => Expanded(
            child: Text(
              text,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    fontSize: 12.0.sp,
                    fontWeight: FontWeight.w400,
                    color: Theme.of(context).customColors.onboardingH1Color,
                  ),
            ),
          ),
        ),
      ],
    ),
  );
}

class _BatterRow extends StatelessWidget {
  final Batter batter;

  const _BatterRow({required this.batter});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Expanded(
            flex: 3,
            child: Row(
              children: [
                Text(
                  batter.name,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400,
                      color: batter.highlighted
                          ? Theme.of(context).primaryColor
                          : null),
                ),
                SizedBox(width: 8),
                batter.isPlaying
                    ? CustomImageView(
                        imagePath: AssetConstants.icCricketBat,
                        height: 12.h,
                      )
                    : SizedBox.shrink(),
              ],
            ),
          ),
          Expanded(
            child: Text(
              '${batter.runs} (${batter.balls})',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w400,
                  ),
            ),
          ),
          ...[
            batter.fours,
            batter.sixes,
            batter.strikeRate,
          ].map(
            (text) => Expanded(
              child: Text(
                text,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w400,
                      color: Theme.of(context).customColors.onboardingH1Color,
                    ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _BowlerRow extends StatelessWidget {
  final Bowler bowler;

  const _BowlerRow({required this.bowler});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Expanded(
            flex: 3,
            child: Text(
              bowler.name,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w400,
                  ),
            ),
          ),
          Expanded(
            child: Text(
              bowler.wicketsRuns,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w400,
                  ),
            ),
          ),
          Expanded(
            child: Text(
              bowler.overs,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w400,
                    color: Theme.of(context).customColors.onboardingH1Color,
                  ),
            ),
          ),
          Expanded(
            child: Text(
              bowler.economy,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w400,
                    color: Theme.of(context).customColors.onboardingH1Color,
                  ),
            ),
          ),
        ],
      ),
    );
  }
}

class Batter {
  final String name;
  final String runs;
  final String balls;
  final String fours;
  final String sixes;
  final String strikeRate;
  final bool isPlaying;
  final String pship;
  final String lastwkt;
  final bool highlighted;

  Batter({
    required this.name,
    required this.runs,
    required this.balls,
    required this.fours,
    required this.sixes,
    required this.strikeRate,
    required this.isPlaying,
    required this.pship,
    required this.lastwkt,
    required this.highlighted,
  });
}

class Bowler {
  final String name;
  final String wicketsRuns;
  final String overs;
  final String economy;

  Bowler({
    required this.name,
    required this.wicketsRuns,
    required this.overs,
    required this.economy,
  });
}
