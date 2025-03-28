import 'package:ny_cricket_app/app/generated/l10n.dart';
import 'package:ny_cricket_app/app/ui/pages/home/presentation/live/live_match_tab_view.dart';
import 'package:ny_cricket_app/app/ui/pages/home/presentation/live/team_one_scoreboard_tab_view.dart';
import 'package:ny_cricket_app/app/ui/widgets/custom/custom_app_bar.dart';
import 'package:ny_cricket_app/app/utils/helpers/dimenson.dart';
import 'package:ny_cricket_app/app/utils/helpers/exporter.dart';

class ScoreBoardPage extends StatelessWidget {
  const ScoreBoardPage({super.key});

  static Widget builder(BuildContext context) {
    return const ScoreBoardPage();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: CustomAppBar(
          iconcolor: ThemeData().customColors.whiteColor,
          title: Lang.of(context).lbl_score_board,
          centerTitle: true,
        ),
        body: SafeArea(
          child: Column(
            children: [
              buildSizedBoxH(31),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 30),
                decoration: BoxDecoration(
                  color: ThemeData().customColors.textfieldfillcolor,
                  borderRadius: BorderRadius.circular(25),
                ),
                child: TabBar(
                  labelStyle: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      fontSize: 14.0.sp, fontWeight: FontWeight.w400),
                  tabs: [
                    Tab(text: 'ENGW 29-3(6.4)'),
                    Tab(text: 'GOA (Yet to bat)'),
                  ],
                ),
              ),

              // Tab Bar View
              const Expanded(
                child: TabBarView(children: [
                  TeamOneScoreBoardTabView(),
                  // LiveMatchTabView(),
                  LiveMatchTabView()
                ]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
