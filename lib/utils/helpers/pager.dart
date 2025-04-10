import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tok_tok/cubits/forget/forget_cubit.dart';
import 'package:tok_tok/cubits/profile/profile_cubit.dart';
import 'package:tok_tok/cubits/signin/signin_cubit.dart';
import 'package:tok_tok/cubits/signup/signup_cubit.dart';
import 'package:tok_tok/cubits/verify/verify_cubit.dart';
import 'package:tok_tok/locator.dart';
import 'package:tok_tok/ui/pages/forget/forget_password.dart';
import 'package:tok_tok/ui/pages/profile/profile_page.dart';
import 'package:tok_tok/ui/pages/sign_in/sign_in_page.dart';
import 'package:tok_tok/ui/pages/verify/verify_page.dart';
import '../../ui/pages/onboard/onboard_page.dart';
import '../../ui/pages/sign_up/sign_up_page.dart';
import '../../ui/pages/splash/splash_page.dart';
import '../../ui/pages/welcome/welcome_page.dart';

class Pager {
  Pager._();

  static Widget get splash => const SplashPage();
 static Widget get signUp => BlocProvider<SignUpCubit>(
        create: (_) => locator(),
        child: const SignUpPage(),
      );
       static Widget get forget => BlocProvider<ForgetCubit>(
        create: (_) => locator(),
        child: const ForgetPassword(),
      );
  static Widget get signin => BlocProvider<SignInCubit>(
        create: (_) => locator(),
        child: const SignInPage(),
      );

  static Widget get onboard => OnboardPage();
  static Widget get welcome => const WelcomePage();
    static Widget get verify => BlocProvider<VerifyCubit>( 
    create: (_) =>  locator(),
    child: const VerifyPage(),
);
  static Widget get profile => BlocProvider<ProfileCubit>(
        create: (_) => locator(),
        child: const ProfilePage(),
      );



}
