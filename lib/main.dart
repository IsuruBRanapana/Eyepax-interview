import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:news_app_eyepax_practical/app.dart';
import 'package:news_app_eyepax_practical/core/services/dependency_injection.dart' as di;
import 'package:news_app_eyepax_practical/flavors.dart';
import 'package:path_provider/path_provider.dart';

import 'features/data/datasources/local_data_source.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  var path = await getApplicationDocumentsDirectory();
  Hive
      .init(path.path);
  Hive.initFlutter();
  // await Hive.openBox(favoritesBox);
  await di.setupLocator();
  F.appFlavor = Flavor.DEV;
  runApp(App());
}
