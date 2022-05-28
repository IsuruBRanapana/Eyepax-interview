import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

///Created By Isuru B. Ranapana
/// 2022-05-28 17:03

class LatestNewsTile extends StatefulWidget {
  const LatestNewsTile({Key? key}) : super(key: key);

  @override
  _LatestNewsTileState createState() => _LatestNewsTileState();
}

class _LatestNewsTileState extends State<LatestNewsTile> {
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10.h),
      child: SizedBox(
        width: 230.w,
        height: 180.h,
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10.h),
              child: Container(
                width: 230.w,
                height: 180.h,
                child: Image.network(
                  'https://scx2.b-cdn.net/gfx/news/2022/elon-musk-has-clashed.jpg',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Positioned(
                top: 60.h,
                child: Padding(
                  padding: EdgeInsets.only(left: 15.w, right: 15.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "by Isuru Ranapana",
                        style: TextStyle(color: Colors.white, fontSize: 10.sp,fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      Container(
                          width: 200.w,
                          child: Text(
                            "by Isuru Ranapana by Isuru Ranapana by Isuru Ranapana by Isuru Ranapana by Isuru Ranapana by Isuru Ranapana by Isuru Ranapana by Isuru Ranapana by Isuru Ranapana by Isuru Ranapana by Isuru Ranapana by Iuru Ranapana by Isuru Ranapana by Isuru Ranapana by Isuru Ranapana by Isuru Ranapana v",
                            style:
                                TextStyle(color: Colors.white, fontSize: 14.sp,fontWeight: FontWeight.bold),
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis,
                          )),
                    ],
                  ),
                )),
            Positioned(
                top: 150.h,
                child: Padding(
                  padding: EdgeInsets.only(left: 15.w, right: 15.w),
                  child: Column(
                    children: [
                      Container(
                          width: 200.w,
                          child: Text(
                            "by Isuru Ranapana by Isuru Ranapana by Isuru Ranapana by Isuru Ranapana by Isuru Ranapana by Isuru Ranapana by Isuru Ranapana",
                            style:
                                TextStyle(color: Colors.white, fontSize: 8.sp),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          )),
                    ],
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
