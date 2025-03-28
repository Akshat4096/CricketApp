// import 'package:flutter_spinkit/flutter_spinkit.dart';
// import 'package:ny_cricket_app/app/utils/helpers/exporter.dart';

// class ProgressDialogUtils {
//   static bool isProgressVisible = false;

//   /// Common method for showing progress dialog
//   static void showProgressDialog(
//       {BuildContext? context, bool isCancellable = false}) async {
//     if (!isProgressVisible &&
//         NavigatorService.navigatorKey.currentState?.overlay?.context != null) {
//       showDialog(
//         barrierDismissible: isCancellable,
//         context: NavigatorService.navigatorKey.currentState!.overlay!.context,
//         builder: (BuildContext context) {
//           return WillPopScope(
//             onWillPop: () async =>
//                 false, // Prevent back button from closing the dialog
//             child: Center(
//               child: Container(
//                 color: Colors.black.withOpacity(0.2),
//                 child: Center(
//                   child: SpinKitFadingCube(
//                     color: Theme.of(context).colorScheme.primary,
//                     size: 50.h,
//                   ),
//                 ),
//               ),
//             ),
//           );
//         },
//       );
//       isProgressVisible = true;
//     }
//   }

//   /// Common method for hiding progress dialog
//   static void hideProgressDialog() {
//     if (isProgressVisible) {
//       Navigator.pop(
//           NavigatorService.navigatorKey.currentState!.overlay!.context);
//     }
//     isProgressVisible = false;
//   }
// }
