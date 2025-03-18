import 'package:flutter/widgets.dart';
import 'package:tok_tok/ui/pages/sign_in/sign_in_page.dart';
import '../../ui/pages/onboard/onboard_page.dart';
import '../../ui/pages/sign_up/sign_up_page.dart';
import '../../ui/pages/splash/splash_page.dart';
import '../../ui/pages/welcome/welcome_page.dart';

class Pager {
  Pager._();

  static Widget get splash => const SplashPage();
  static Widget get signUp => const SignUpPage();
    static Widget get signIn =>  SignInPage();

  static Widget get onboard => OnboardPage();
  static Widget get welcome => const WelcomePage();
}
