import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tok_tok/ui/pages/home_page/widgets/home_page_app_bar.dart';
import 'package:tok_tok/ui/pages/home_page/widgets/user_avatar.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HomePageAppBar(
        title: "Tok Tok",
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          children: [
            24.verticalSpace,
            Row(
              children: [
                UserAvatar(),
              ],
            )
          ],
        ),
      ),
    );
  }
}
