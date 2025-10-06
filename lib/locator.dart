import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:tok_tok/cubits/forget/forget_cubit.dart';
import 'package:tok_tok/cubits/profile/profile_cubit.dart';
import 'package:tok_tok/cubits/signin/signin_cubit.dart';
import 'package:tok_tok/cubits/signup/signup_cubit.dart';
import 'package:tok_tok/cubits/splash/splash_cubit.dart';
import 'package:tok_tok/cubits/verify/verify_cubit.dart';
import 'package:tok_tok/data/i_repo/auth_repo_impl.dart';
import 'package:tok_tok/data/i_repo/profile_repo_impl.dart';
import 'package:tok_tok/data/repo/auth_repo.dart';
import 'package:tok_tok/data/repo/profile_repo.dart';
import 'package:tok_tok/data/service/local/auth_hive_service.dart';
import 'package:tok_tok/data/service/remote/auth_service.dart';
import 'package:tok_tok/data/service/remote/profile_service.dart';


final GetIt locator = GetIt.instance;
final navigatorKey = GlobalKey<NavigatorState>();

BuildContext get appContext => navigatorKey.currentState!.context;

void setupLocator() {
  // Services
  locator.registerLazySingleton(() => AuthService());
    locator.registerLazySingleton(() => AuthHiveService());
  

    locator.registerLazySingleton(() => ProfileService());

  // Repositories
  locator.registerLazySingleton<AuthRepo>(() => AuthRepoImpl(locator(),locator(),locator(),locator()));
    locator.registerLazySingleton<ProfileRepo>(() => ProfileRepoImpl(locator()));



  // locator.registerFactory(() => VerifyCubit());
  // locator.registerFactory(() => ForgotPasswordCubit());
  // locator.registerFactory(() => NewPasswordCubit());
  locator.registerFactory(() => SignInCubit(locator()));
  locator.registerFactory(()=>ProfileCubit(locator()));
  locator.registerFactory(()=>SplashCubit());


  locator.registerFactory(() => SignUpCubit(locator<AuthRepo>()));
    locator.registerFactory(() => ForgetCubit(locator<AuthRepo>()));

        locator.registerFactory(() => VerifyCubit(locator<AuthRepo>()));








}
