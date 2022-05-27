import 'package:flutter/material.dart';
import 'package:news_app_eyepax_practical/features/presentation/views/pages/my_home_page.dart';
import 'package:page_transition/page_transition.dart';

///Created By Isuru B. Ranapana
/// 2022-05-27 22:42

class Routes {
  static const String HOME_VIEW = "HOME_VIEW";

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.HOME_VIEW:
        return PageTransition(
            child: MyHomePage(), type: PageTransitionType.fade);

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