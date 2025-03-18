import 'package:flutter/widgets.dart';
import 'package:tok_tok/ui/pages/onboard/onboard_page.dart';
import 'package:tok_tok/ui/pages/sign_up/sign_up_page.dart';
import 'package:tok_tok/ui/pages/splash/splash_page.dart';
import 'package:tok_tok/ui/pages/welcome/welcome_page.dart';

class Pager {
  Pager._();

  static Widget get splash => const SplashPage();
  static Widget get signUp => const SignUpPage();
  static Widget get onboard => OnboardPage();
  static Widget get welcome => const WelcomePage();
}
