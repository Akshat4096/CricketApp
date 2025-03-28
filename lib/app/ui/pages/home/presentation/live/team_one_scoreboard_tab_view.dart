import 'package:ny_cricket_app/app/ui/pages/home/widgets/batter_stats_card.dart';
import 'package:ny_cricket_app/app/utils/helpers/dimenson.dart';
import 'package:ny_cricket_app/app/utils/helpers/exporter.dart';

class TeamOneScoreBoardTabView extends StatelessWidget {
  const TeamOneScoreBoardTabView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        buildSizedBoxH(30),
        _buildBattersTable(),
      ],
    );
  }

  Widget _buildBattersTable() {
    return BatterStatsCard(
      batters: [
        Batter(
            name: 'Heather Knight',
            runs: '8',
            balls: '10',
            fours: '2',
            sixes: '0',
            strikeRate: '80.0',
            isPlaying: true,
            pship: ' 13(24)',
            lastwkt: 'S Dunkley 4(5)',
            highlighted: false),
        Batter(
            name: 'Vikas Singh',
            runs: '17',
            balls: '11',
            fours: '1',
            sixes: '0',
            strikeRate: '27.4',
            isPlaying: false,
            pship: ' 13(24)',
            lastwkt: 'S Dunkley 4(5)',
            highlighted: false),
        Batter(
            name: 'Healther Knight (c)',
            runs: '11',
            balls: '16',
            fours: '2',
            sixes: '0',
            strikeRate: '27.4',
            isPlaying: false,
            pship: ' 13(24)',
            lastwkt: 'S Dunkley 4(5)',
            highlighted: true),
        Batter(
            name: 'Net Sciver-Brunt',
            runs: '0',
            balls: '3',
            fours: '2',
            sixes: '0',
            strikeRate: '80.0',
            isPlaying: true,
            pship: ' 13(24)',
            lastwkt: 'S Dunkley 4(5)',
            highlighted: true),
      ],
    );
  }
}
