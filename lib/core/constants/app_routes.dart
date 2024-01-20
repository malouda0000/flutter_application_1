import 'package:flutter_application_1/Models/emer_item_modle.dart';
import 'package:flutter_application_1/Views/screens/add_more_item_screen.dart';
import 'package:flutter_application_1/Views/screens/edit_item_screen.dart';
import 'package:flutter_application_1/Views/screens/item_details_screen.dart';
import 'package:flutter_application_1/Views/tests/test_widget.dart';
import 'package:flutter_application_1/main.dart';
import 'package:go_router/go_router.dart';

class AppRoute {
// // app inital
//   static const String customOnbordingScreen = '/';
//   static const String customSplashScreen = '/splashScreen';

// // auth
//   static const String signUpScreen = '/signUpScreen';
//   static const String signInScreen = '/SinInScreen';
//   static const String forgetPasswordScreen = '/forgetPasswordScreen';
//   static const String verifyCodeScreenForRestPass =
//       '/verifyCodeScreenForResetPass';
//   static const String verifyCodeScreenForSignup = '/verifyCodeScreenForSignup';
//   static const String resetPasswordScreen = '/resetPasswordScreen';
//   static const String succResetedPasswordScreen = '/succResetedPasswordScreen';
//   static const String successfullySignedupScreen = '/succSignedupScreen';

// main screens
  static const String myHomePage = '/myHomePage';
  static const String addMoreItemsScreen = '/addMoreItemsScreen';
  static const String editItemScreen = '/editItemScreen';
  static const String itemDetailsScreen = '/itemDetailsScreen';
  static const String testWidgetsScreen = '/testWidgetsScreen';
  // static const String aboutScreen = '/aboutScreen';

// // setting screens
//   static const String settingScreen = '/settingScreen';
//   static const String themeScreen = '/themeScreen';
//   static const String localizationScreen = '/localizationScreen';
//   static const String userAccountScreen = '/userAccountScreen';

// // seconders screens

//   static const String underDevelopmentScreen = '/underDevelopmentScreen';
//   static const String errorMessageScreen = '/errorMessageScreen';
}

GoRouter customGoRouter = GoRouter(
  initialLocation: AppRoute.myHomePage,
  // initialLocation: AppRoute.testWidgetsScreen,

  // errorPageBuilder: (context, state) => CustomErorreScreen(errorMassage: state.extra as String ,),

  routes: [
    GoRoute(
      name: AppRoute.myHomePage,
      path: AppRoute.myHomePage,
      builder: (context, state) => const MyHomePage(title: 'Emerging Ideas'),
    ),
    GoRoute(
      name: AppRoute.addMoreItemsScreen,
      path: AppRoute.addMoreItemsScreen,
      builder: (context, state) => AddMoreItemScreen(),
    ),
    GoRoute(
        name: AppRoute.editItemScreen,
        path: AppRoute.editItemScreen,
        builder: (context, state) {
          // final emeritem = state.extra as Emeritem;

          final emeritem = state.extra as Emeritem;
          return EditItemScreen(
            // emeritem: state.extra as Emeritem,
            emeritem: emeritem,
          );
        }),
    GoRoute(
      name: AppRoute.itemDetailsScreen,
      path: AppRoute.itemDetailsScreen,
      builder: (context, state) => ItemDetScreen(
        emeritem: state.extra as Emeritem,
      ),
    ),
    GoRoute(
      name: AppRoute.testWidgetsScreen,
      path: AppRoute.testWidgetsScreen,
      builder: (context, state) => const CustomTestWidget(),
    ),
  ],
);

// class GetPages {
  // initaling app
  // List<GetPage<dynamic>>? getpages = [
  //   GetPage(
  //     name: AppRoute.customOnbordingScreen,
  //     page: () => const CustomOnBordingPageViewBuilder(),
  //     middlewares: [
  //       FirstTimeInit(),
  //     ],
  //   ),

// }

