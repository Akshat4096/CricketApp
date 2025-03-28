import 'package:ny_cricket_app/app/utils/helpers/exporter.dart';

class MyAppThemeHelper {
  static const Color primaryColor = Color(0XFFE8C900); // Primary color
  static const Color secondaryColor = Color(0xFF222222); // Secondary color
  static const Color whiteColor = Color(0xFFFFFFFF);
  static const Color blackColor = Color(0xFF000000);
  static const Color hintColor = Color(0xFFA7A7A7);

  static ThemeData get lightTheme {
    return ThemeData(
      colorScheme: ColorScheme.light(
        primary: primaryColor,
        secondary: secondaryColor,
        onPrimary: whiteColor,
        onSecondary: whiteColor,
        surface: whiteColor,
        onSurface: Colors.black,
      ),
      tabBarTheme: TabBarTheme(
        indicatorSize: TabBarIndicatorSize.tab,
        indicator: BoxDecoration(
          color: primaryColor,
          borderRadius: BorderRadius.circular(25.r),
        ),
        splashFactory: NoSplash.splashFactory,
        labelColor: ThemeData().customColors.blackColor,
        unselectedLabelColor: ThemeData().customColors.lablecolor,
      ),
      splashFactory: NoSplash.splashFactory,
      materialTapTargetSize: MaterialTapTargetSize.padded,
      applyElevationOverlayColor: false,
      dividerTheme: DividerThemeData(thickness: 1, color: Color(0xff222222)),
      brightness: Brightness.light,
      scaffoldBackgroundColor: blackColor,
      dialogTheme: DialogTheme(
          backgroundColor: ThemeData().customColors.textfieldfillcolor),
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      hintColor: hintColor,
      checkboxTheme: CheckboxThemeData(
          fillColor: WidgetStateProperty.all(primaryColor),
          checkColor: WidgetStateProperty.all(blackColor),
          splashRadius: 0.0,
          shape: BeveledRectangleBorder()),
      textTheme: GoogleFonts.latoTextTheme()
          .apply(
            bodyColor: whiteColor,
            displayColor: whiteColor,
          )
          .copyWith(
            titleLarge: GoogleFonts.roboto(
              fontSize: 28.0.sp,
              fontWeight: FontWeight.w500,
              color: primaryColor,
            ),
          ),
      appBarTheme: AppBarTheme(
        color: Colors.transparent,
        surfaceTintColor: Colors.transparent,
        titleTextStyle: GoogleFonts.lato(
          fontSize: 20,
          fontWeight: FontWeight.w500,
          color: whiteColor,
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0.r),
          borderSide: BorderSide(color: primaryColor, width: 1),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0.r),
          borderSide: BorderSide(
              color: ThemeData().customColors.textfieldfillcolor, width: 1),
        ),
        errorMaxLines: 2,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0.r),
          borderSide: BorderSide(color: primaryColor, width: 1),
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: primaryColor,
          disabledBackgroundColor: primaryColor.withOpacity(0.2),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24.0.r),
          ),
        ),
      ),
    );
  }

  static ThemeData get darkTheme {
    return ThemeData(
      colorScheme: ColorScheme.light(
        primary: primaryColor,
        secondary: secondaryColor,
        onPrimary: whiteColor,
        onSecondary: whiteColor,
        surface: whiteColor,
        onSurface: Colors.black,
      ),
      tabBarTheme: TabBarTheme(
        indicatorSize: TabBarIndicatorSize.tab,
        indicator: BoxDecoration(
          color: primaryColor,
          borderRadius: BorderRadius.circular(25.r),
        ),
        splashFactory: NoSplash.splashFactory,
        labelColor: ThemeData().customColors.blackColor,
        unselectedLabelColor: ThemeData().customColors.lablecolor,
      ),
      splashFactory: NoSplash.splashFactory,
      materialTapTargetSize: MaterialTapTargetSize.padded,
      applyElevationOverlayColor: false,
      dividerTheme: DividerThemeData(thickness: 1, color: Color(0xff222222)),
      brightness: Brightness.light,
      scaffoldBackgroundColor: blackColor,
      dialogTheme: DialogTheme(
          backgroundColor: ThemeData().customColors.textfieldfillcolor),
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      hintColor: hintColor,
      checkboxTheme: CheckboxThemeData(
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
        visualDensity: VisualDensity.compact,
        checkColor: WidgetStateProperty.all(blackColor),
        fillColor: WidgetStateProperty.resolveWith(
          (states) {
            if (states.contains(WidgetState.selected)) {
              return primaryColor;
            }
            return whiteColor;
          },
        ),
      ),
      textTheme: GoogleFonts.latoTextTheme()
          .apply(
            bodyColor: whiteColor,
            displayColor: whiteColor,
          )
          .copyWith(
            titleLarge: GoogleFonts.roboto(
              fontSize: 28.0.sp,
              fontWeight: FontWeight.w500,
              color: primaryColor,
            ),
          ),
      appBarTheme: AppBarTheme(
        color: Colors.transparent,
        surfaceTintColor: Colors.transparent,
        titleTextStyle: GoogleFonts.lato(
          fontSize: 20,
          fontWeight: FontWeight.w500,
          color: whiteColor,
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0.r),
          borderSide: BorderSide(color: primaryColor, width: 1),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0.r),
          borderSide: BorderSide(
              color: ThemeData().customColors.textfieldfillcolor, width: 1),
        ),
        errorMaxLines: 2,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0.r),
          borderSide: BorderSide(color: primaryColor, width: 1),
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          disabledBackgroundColor: primaryColor.withOpacity(0.2),
          backgroundColor: primaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24.0.r),
          ),
        ),
      ),
    );
  }
}

extension ThemeExtensions on ThemeData {
  static const lightCustomColors = CustomColors(
      greyColor: Color(0xFF858585),
      onboardingH1Color: Color(0xFF949494),
      whiteColor: Color(0XFFFFFFFF),
      textfieldfillcolor: Color(0xFF171717),
      blackColor: Color(0xFF000000),
      lablecolor: Color(0xffB1B1B1),
      redcolor: Color(0xffE80000),
      lightgreycolor: Color(0xFF222222));

  static const darkCustomColors = CustomColors(
      greyColor: Color(0xFF858585),
      onboardingH1Color: Color(0xFF949494),
      whiteColor: Color(0XFFFFFFFF),
      textfieldfillcolor: Color(0xFF171717),
      blackColor: Color(0xFF000000),
      lablecolor: Color(0xffB1B1B1),
      redcolor: Color(0xffE80000),
      lightgreycolor: Color(0xFF222222));

  CustomColors get customColors {
    return brightness == Brightness.light
        ? lightCustomColors
        : darkCustomColors;
  }
}

class CustomColors {
  final Color greyColor;
  final Color onboardingH1Color;
  final Color textfieldfillcolor;
  final Color whiteColor;
  final Color blackColor;
  final Color lablecolor;
  final Color redcolor;
  final Color lightgreycolor;

  const CustomColors({
    required this.greyColor,
    required this.onboardingH1Color,
    required this.textfieldfillcolor,
    required this.whiteColor,
    required this.blackColor,
    required this.lablecolor,
    required this.redcolor,
    required this.lightgreycolor,
  });
}
