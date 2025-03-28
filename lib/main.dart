import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:ny_cricket_app/app/controller/app_controller.dart';
import 'package:ny_cricket_app/app/generated/l10n.dart';
import 'package:ny_cricket_app/app/routes/app_pages.dart';
import 'package:ny_cricket_app/app/utils/helpers/exporter.dart';
import 'package:ny_cricket_app/app/utils/helpers/extensions/extensions.dart';
import 'package:ny_cricket_app/app/utils/helpers/injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:toastification/toastification.dart';

void main() {
  configuration(myApp: const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    Get.put(AppController());
    FlutterNativeSplash.remove();
    return ScreenUtilInit(
        designSize: Size(
          MediaQuery.of(context).size.width,
          MediaQuery.of(context).size.height,
        ),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return ToastificationWrapper(
            child: GetMaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'Cricket App',
              getPages: AppPages.routes,
              initialRoute: AppRoutes.splash,
              localizationsDelegates: const [
                Lang.delegate,
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
              ],
              supportedLocales: Lang.delegate.supportedLocales,
              locale: Locale(getIt<SharedPreferences>().getAppLocal ?? 'en'),
              themeMode: ThemeMode.light,
              theme: MyAppThemeHelper.lightTheme,
              darkTheme: MyAppThemeHelper.darkTheme,
              builder: EasyLoading.init(),
            ),
          );
        });
  }

  @override
  void initState() {
    super.initState();
  }
}
