import 'package:ny_cricket_app/app/global/asset_constants.dart';
import 'package:ny_cricket_app/app/utils/helpers/exporter.dart';
import 'package:ny_cricket_app/app/utils/helpers/extensions/extensions.dart';
import 'package:ny_cricket_app/app/utils/helpers/injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

ValueNotifier<String> profileImageNotifier = ValueNotifier(
    (getIt<SharedPreferences>().getprofile ?? "").isEmpty
        ? AssetConstants.pngSuccess
        : getIt<SharedPreferences>().getprofile!);
