import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tok_tok/data/service/local/auth_hive_service.dart';
import 'package:tok_tok/locator.dart';
import 'package:tok_tok/ui/pages/home_page/home_page.dart';
import 'package:tok_tok/ui/pages/profile/profile_page.dart';
import 'package:tok_tok/ui/pages/splash/splash_page.dart';
import 'package:tok_tok/ui/pages/user_account/user_account_page.dart';

import '../utils/helpers/pager.dart';

class MyApp extends StatelessWidget {
  final bool isOnboarded;
  const MyApp({super.key, this.isOnboarded = false});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(430, 932),
      child: MaterialApp(
        title: 'Tok Tok',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        debugShowCheckedModeBanner: false,
        home:  Pager.splash,
        navigatorKey: navigatorKey,
      ),
    );
  }
}
