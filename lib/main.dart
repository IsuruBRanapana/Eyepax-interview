import 'package:flutter/material.dart';
import 'package:news_app_eyepax_practical/app.dart';
import 'package:news_app_eyepax_practical/core/services/dependency_injection.dart' as di;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.setupLocator();
  runApp(App());
}
