import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app_eyepax_practical/core/util/app_colors.dart';
import 'package:readmore/readmore.dart';

///Created By Isuru B. Ranapana
/// 2022-05-28 19:01

class DescriptionNewsTile extends StatefulWidget {
  const DescriptionNewsTile({Key? key}) : super(key: key);

  @override
  _DescriptionNewsTileState createState() => _DescriptionNewsTileState();
}

class _DescriptionNewsTileState extends State<DescriptionNewsTile> {
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10.h),
      child: SizedBox(
        width: 270.w,
        // height: 300.h,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10.h),
              child: SizedBox(
                width: 270.w,
                height: 100.h,
                child: Image.network(
                  'https://scx2.b-cdn.net/gfx/news/2022/elon-musk-has-clashed.jpg',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            Padding(
              padding: EdgeInsets.only(left: 5.w, right: 5.w),
              child: Text(
                "Sunday, 29 May 2022",
                style: TextStyle(fontSize: 8.sp),
              ),
            ),
            SizedBox(
              height: 5.h,
            ),
            Padding(
              padding: EdgeInsets.only(left: 5.w, right: 5.w),
              child: SizedBox(
                  width: 240.w,
                  height: 30.h,
                  child: Text(
                    "by Isuru Ranapana by Isuru Ranapana by ",
                    style:
                        TextStyle(fontSize: 12.sp, fontWeight: FontWeight.bold),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                  )),
            ),
            SizedBox(
              height: 5.h,
            ),
            Padding(
              padding: EdgeInsets.only(left: 5.w, right: 5.w),
              child: SizedBox(
                  width: 240.w,
                  // height: 70.h,
                  child: const ReadMoreText(
                    'Flutter is Google’s mobile UI open source framework to build high-quality native (super fast) interfaces for iOS and Android apps with the unified codebase. by Isuru Ranapana by Isuru Ranapana by Isuru Ranapana by Isuru Ranapana by Isuru Ranapana by Isuru Ranapana by Isuru Ranapana by Isuru Ranapana by Isuru Ranapana by Isuru Ranapana by Isuru Ranapana by Iuru Ranapana by Isuru Ranapana by Isuru Ranapana by Isuru Ranapana by Isuru Ranapana v',
                    trimLines: 5,
                    colorClickableText: AppColors.colorSecondary,
                    trimMode: TrimMode.Line,
                    trimCollapsedText: '...Read More',
                    trimExpandedText: ' Read Less',
                    style: TextStyle(color: Colors.black),
                  )),
            ),
            SizedBox(
              height: 10.h,
            ),
            Padding(
              padding: EdgeInsets.only(left: 5.w, right: 5.w),
              child: Text(
                "Published by Isuru",
                style: TextStyle(fontSize: 8.sp, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
          ],
        ),
      ),
    );
  }
}
