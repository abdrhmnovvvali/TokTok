import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tok_tok/ui/pages/home_page/widgets/home_page_app_bar.dart';
import 'package:tok_tok/ui/pages/home_page/widgets/user_avatar.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HomePageAppBar(title: "TokTok"),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          children: [
            16.verticalSpace,
            SizedBox(
              height: 100.h,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  const UserAvatar(),
                  12.horizontalSpace,
                  const UserAvatar(),
                  12.horizontalSpace,
                  const UserAvatar(),
                  12.horizontalSpace,
                  const UserAvatar(),
                ],
              ),
            ),
            16.verticalSpace,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      radius: 20.r,
                      backgroundImage:
                          const AssetImage("assets/png/splash.png"),
                    ),
                    8.horizontalSpace,
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text("anny_wilson",
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        Text("Marketing Coordinator",
                            style:
                                TextStyle(fontSize: 12.sp, color: Colors.grey)),
                      ],
                    ),
                  ],
                ),
                const Icon(Icons.more_vert),
              ],
            ),

            16.verticalSpace,

            Container(
              height: 300.h,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(16.r),
              ),
            ),

            12.verticalSpace,

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(5, (index) {
                return Container(
                  margin: EdgeInsets.symmetric(horizontal: 4.w),
                  height: 6.h,
                  width: index == 0 ? 20.w : 6.w,
                  decoration: BoxDecoration(
                    color: index == 0 ? Colors.pink : Colors.grey,
                    borderRadius: BorderRadius.circular(3.r),
                  ),
                );
              }),
            ),

            16.verticalSpace,

            Row(
              children: [
                const Icon(Icons.favorite_border, color: Colors.pink),
                4.horizontalSpace,
                const Text("44,389"),
                16.horizontalSpace,
                const Icon(Icons.comment, color: Colors.grey),
                4.horizontalSpace,
                const Text("26,376"),
                16.horizontalSpace,
                const Icon(Icons.send, color: Colors.grey),
              ],
            ),
            16.verticalSpace,
            Row(
              children: [
                CircleAvatar(
                  radius: 16.r,
                  backgroundImage: const AssetImage("assets/png/splash.png"),
                ),
                8.horizontalSpace,
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("hime_tanuki",
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    Text("Web Designer",
                        style: TextStyle(fontSize: 12.sp, color: Colors.grey)),
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
