import 'package:flutter/material.dart';
import 'package:news_app_eyepax_practical/features/presentation/views/Splash_view/splash_view.dart';
import 'package:news_app_eyepax_practical/features/presentation/views/dashboard/dashboard_view.dart';
import 'package:news_app_eyepax_practical/features/presentation/views/login/login_view.dart';
import 'package:news_app_eyepax_practical/features/presentation/views/pages/my_home_page.dart';
import 'package:news_app_eyepax_practical/features/presentation/views/see_all_latest_news_page.dart';
import 'package:news_app_eyepax_practical/features/presentation/views/sign_up/sign_up_view.dart';
import 'package:news_app_eyepax_practical/features/presentation/views/single_post_view_page.dart';
import 'package:page_transition/page_transition.dart';

///Created By Isuru B. Ranapana
/// 2022-05-27 22:42

class Routes {
  static const String HOME_VIEW = "HOME_VIEW";
  static const String DASHBOARD_VIEW = "DASHBOARD_VIEW";
  static const String SEE_ALL_LATEST_POSTS_VIEW = "SEE_ALL_LATEST_POSTS_VIEW";
  static const String SINGLE_POST_VIEW = "SINGLE_POST_VIEW";
  static const String SPLASH_VIEW = "SPLASH_VIEW";
  static const String LOGIN_VIEW = "LOGIN_VIEW";
  static const String SIGN_UP_VIEW = "SIGN_UP_VIEW";

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.HOME_VIEW:
        return PageTransition(
            child: MyHomePage(), type: PageTransitionType.fade);
      case Routes.DASHBOARD_VIEW:
        return PageTransition(
            child: DashboardView(), type: PageTransitionType.fade);
      case Routes.SEE_ALL_LATEST_POSTS_VIEW:
        return PageTransition(
            child: SeeAllLatestNewsPage(), type: PageTransitionType.fade);
      case Routes.SINGLE_POST_VIEW:
        return PageTransition(
            child: SinglePostViewPage(), type: PageTransitionType.fade);
      case Routes.SPLASH_VIEW:
        return PageTransition(
            child: SplashView(), type: PageTransitionType.fade);
      case Routes.LOGIN_VIEW:
        return PageTransition(
            child: LoginView(), type: PageTransitionType.fade);
      case Routes.SIGN_UP_VIEW:
        return PageTransition(
            child: SignUpView(), type: PageTransitionType.fade);

      default:
        return MaterialPageRoute(
          builder: (_) => const Scaffold(
            body: Center(
              child: Text("Invalid Route"),
            ),
          ),
        );
    }
  }
}