import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import '../../../utils/constants/app_colors.dart';
import '../../../utils/extensions/num_extension.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

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

              // const SpinKitCircle(
              //     color:AppColors.primary,
              //     size: 100,
              //     )
            ],
          ),
        ),
      ),
    );
  }
}
