import 'package:ny_cricket_app/app/controller/ad_controller.dart';
import 'package:ny_cricket_app/app/generated/l10n.dart';
import 'package:ny_cricket_app/app/ui/pages/home/presentation/complated/complated_match_tab_view.dart';
import 'package:ny_cricket_app/app/ui/pages/home/presentation/live/live_match_tab_view.dart';
import 'package:ny_cricket_app/app/ui/pages/home/presentation/upcoming/upcoming_match_tab_view.dart';
import 'package:ny_cricket_app/app/ui/pages/home/widgets/home_app_bar.dart';
import 'package:ny_cricket_app/app/utils/helpers/exporter.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  static Widget builder(BuildContext context) {
    return const HomePage();
  }

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => AdController());
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              HomeAppBar(),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 16),
                decoration: BoxDecoration(
                  color: ThemeData().customColors.textfieldfillcolor,
                  borderRadius: BorderRadius.circular(25),
                ),
                child: TabBar(
                  labelStyle: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      fontSize: 14.0.sp, fontWeight: FontWeight.w400),
                  tabs: [
                    Tab(text: Lang.of(context).lbl_upcoming),
                    Tab(text: Lang.of(context).lbl_live),
                    Tab(text: Lang.of(context).lbl_completed)
                  ],
                ),
              ),

              // Tab Bar View
              const Expanded(
                child: TabBarView(children: [
                  UpcomingMatchTabView(),
                  LiveMatchTabView(),
                  ComplatedMatchTabView()
                ]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
