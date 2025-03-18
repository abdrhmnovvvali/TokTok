import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:tok_tok/utils/constants/app_colors.dart';
import 'package:tok_tok/utils/extensions/num_extension.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              232.h,
              Image.asset(
                "assets/png/splash.png",
                width: 346.52,
                height: 334,
              ),
              141.h,

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
