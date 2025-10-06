import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:tok_tok/ui/pages/home_page/home_page.dart';
import 'package:tok_tok/ui/pages/sign_in/sign_in_page.dart';
import 'package:tok_tok/utils/helpers/pager.dart';
import '../../../utils/constants/app_colors.dart';
import '../../../data/service/local/auth_hive_service.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    _initAppFlow();
  }

  Future<void> _initAppFlow() async {
    // Splash biraz gözüksün
    await Future.delayed(const Duration(seconds: 2));

    // 1️⃣ Onboarding kontrolü
    final isOnboarded = await AuthHiveService.isOnboarded();
    if (!isOnboarded) {
      if (!mounted) return;
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => Pager.onboard),
      );
      return;
    }

    // 2️⃣ Token kontrolü
    final token = await AuthHiveService.getToken();
    if (!mounted) return;
    if (token != null && token.isNotEmpty) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => Pager.profile), 
      );
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => Pager.signin),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              232.verticalSpace,
              Image.asset(
                "assets/png/splash.png",
                width: 346.52,
                height: 334,
              ),
              141.verticalSpace,
              const SpinKitCircle(
                color: AppColors.primary,
                size: 50,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
