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
void main() async{
  // WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();
  // FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

  configuration(myApp: const MyApp());
}

// Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
//   await Firebase.initializeApp();
//   print('Handling background message: ${message.messageId}');
// }


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
              title: 'The Match Live',
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

  // FirebaseMessaging messaging = FirebaseMessaging.instance;
  
  @override
  void initState() {
    super.initState();  
    // Request permission
    // messaging.requestPermission();

    // // Get token
    // messaging.getToken().then((token) {
    //   print('FCM Token: $token');
    // });

    // // Foreground message
    // FirebaseMessaging.onMessage.listen((RemoteMessage message) {
    //   print('Foreground message: ${message.notification?.title}');
    // });

    // // When app opened from background
    // FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
    //   print('Notification caused app to open');
    // });
  }


 
  
}
