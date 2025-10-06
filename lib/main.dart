import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:tok_tok/data/service/local/auth_hive_service.dart';
import 'package:tok_tok/locator.dart';
import 'ui/app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.black,
    statusBarIconBrightness: Brightness.light,
  ));
  await Hive.initFlutter();

  bool onboarded = await AuthHiveService.isOnboarded();
  setupLocator();
  runApp(MyApp(
    isOnboarded: onboarded,
  ));
}
