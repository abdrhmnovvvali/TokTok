import 'package:flutter/material.dart';
import 'package:tok_tok/ui/pages/onboard/onboard_page.dart';
import 'package:tok_tok/ui/pages/splash/splash_page.dart';
import 'package:tok_tok/ui/pages/welcome/welcome_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        
   
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home:  WelcomePage(),
    );
  }
}