import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'app.dart';
import 'flavors.dart';

import 'package:news_app_eyepax_practical/core/services/dependency_injection.dart'
    as di;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.setupLocator();
  F.appFlavor = Flavor.DEV;
  Hive.initFlutter();
  runApp(App());
}
