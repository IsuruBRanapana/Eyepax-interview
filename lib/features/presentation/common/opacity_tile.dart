import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app_eyepax_practical/core/util/app_colors.dart';

///Created By Isuru B. Ranapana
/// 2022-05-28 19:51

class OpacityTile extends StatefulWidget {
  const OpacityTile({Key? key}) : super(key: key);

  @override
  _OpacityTileState createState() => _OpacityTileState();
}

class _OpacityTileState extends State<OpacityTile> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30.w),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10.h),
        child: Container(
          color: AppColors.appGrayColor.withOpacity(0.2),
          height: 110.h,
          child: Stack(
            children: [
              Positioned(
                  top: 10.h,
                  child: Padding(
                    padding: EdgeInsets.only(left: 15.w, right: 15.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "by Isuru Ranapana",
                          style: TextStyle(fontSize: 8.sp),
                        ),
                        SizedBox(
                          height: 5.h,
                        ),
                        Container(
                            width: 180.w,
                            child: Text(
                              "by Isuru Ranapana by Isuru Ranapana by Isuru Ranapana by Isuru Ranapana by Isuru Ranapana by Isuru Ranapana by Isuru Ranapana by Isuru Ranapana by Isuru Ranapana by Isuru Ranapana by Isuru Ranapana by Iuru Ranapana by Isuru Ranapana by Isuru Ranapana by Isuru Ranapana by Isuru Ranapana v",
                              style:
                              TextStyle(fontSize: 14.sp,fontWeight: FontWeight.bold),
                              maxLines: 3,
                              overflow: TextOverflow.ellipsis,
                            )),
                        SizedBox(
                          height: 10.h,
                        ),
                        Text(
                          "by Isuru Ranapana",
                          style: TextStyle(fontSize: 9.sp,fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}