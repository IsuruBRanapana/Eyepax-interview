import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app_eyepax_practical/core/util/app_colors.dart';

import 'core/util/navigation_routes.dart';
import 'flavors.dart';

class App extends StatefulWidget {
  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(288, 624),
      minTextAdapt: true,
      builder: (_, child) => MaterialApp(
        initialRoute: Routes.HOME_VIEW,
        title: F.title,
        onGenerateRoute: Routes.generateRoute,
        theme: ThemeData(
          visualDensity: VisualDensity.adaptivePlatformDensity,
          primaryColor: AppColors.colorPrimary,
          scaffoldBackgroundColor: Colors.white,
        ),
      ),
    );
  }
}
