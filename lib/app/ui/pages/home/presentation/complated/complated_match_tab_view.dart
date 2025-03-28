import 'package:ny_cricket_app/app/controller/home_controller.dart';
import 'package:ny_cricket_app/app/utils/helpers/exporter.dart';
import 'package:ny_cricket_app/app/utils/helpers/getItHook/getit_hook.dart';

class ComplatedMatchTabView extends GetItHook<HomeController> {
  const ComplatedMatchTabView({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("No History Found"),
    );
  }

  @override
  bool get canDisposeController => false;

  @override
  void onDispose() {}

  @override
  void onInit() {}
}
