import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app_eyepax_practical/app.dart';
import 'package:news_app_eyepax_practical/core/services/dependency_injection.dart';
import 'package:news_app_eyepax_practical/core/util/app_colors.dart';
import 'package:news_app_eyepax_practical/features/presentation/bloc/base_bloc.dart';
import 'package:news_app_eyepax_practical/features/presentation/bloc/base_event.dart';
import 'package:news_app_eyepax_practical/features/presentation/bloc/base_state.dart';
import 'package:news_app_eyepax_practical/features/presentation/bloc/home/home_bloc.dart';
import 'package:news_app_eyepax_practical/features/presentation/common/opacity_tile.dart';

import 'base_view.dart';

///Created By Isuru B. Ranapana
/// 2022-05-28 23:28

class SinglePostViewPage extends BaseView {
  SinglePostViewPage({Key? key});

  @override
  _SinglePostViewPageState createState() => _SinglePostViewPageState();
}

class _SinglePostViewPageState extends BaseViewState<SinglePostViewPage> {
  var bloc = injection<HomeBloc>();

  @override
  Widget buildView(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        // backgroundColor: AppColors.appColorWhite,
        body: Stack(
          children: [
            Positioned(
              top: 0,
              child: SizedBox(
                height: 300.h,
                width: 288.w,
                child: Image.network(
                  'https://scx2.b-cdn.net/gfx/news/2022/elon-musk-has-clashed.jpg',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              child: Container(
                height: 300.h,
                width: 288.w,
                decoration: BoxDecoration(
                    color: AppColors.appColorWhite,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(25.h),
                      topRight: Radius.circular(25.h),
                    )),
                child: Padding(
                  padding: EdgeInsets.only(left: 10.w, right: 10.w),
                  child: Container(
                    margin: EdgeInsets.only(top: 50.h),
                    child: SingleChildScrollView(
                      child: Text(
                        'Flutter is Google’s mobile UI open source framework to build high-quality native (super fast) interfaces for iOS and Android apps with the unified codebase. by Isuru Ranapana by Isuru Ranapana by Isuru Ranapana by Isuru Ranapana by Isuru Ranapana by Isuru Ranapana by Isuru Ranapana by Isuru Ranapana by Isuru Ranapana by Isuru Ranapana by Isuru Ranapana by Iuru Ranapana by Isuru Ranapana by Isuru Ranapana by Isuru Ranapana by Isuru Ranapana v',
                        textAlign: TextAlign.justify,
                        style: TextStyle(fontSize: 12.sp),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
                top: 190.h,
                child: Container(width: 280.w, child: OpacityTile())),
            Positioned(
                top: 15.h,
                left: 15.w,
                child: InkResponse(
                  onTap: (){
                    Navigator.pop(context);
                  },
                  child: Container(
                    width: 20.w,
                    height: 20.w,
                    decoration: BoxDecoration(
                      color: AppColors.appGrayColor,
                      borderRadius: BorderRadius.circular(4.h)
                    ),
                    child: Padding(
                      padding: EdgeInsets.only(left: 5.w),
                      child: Icon(
                        Icons.arrow_back_ios,
                        size: 15.h,
                        color: AppColors.appColorBlack,
                      ),
                    ),
                  ),
                )),
            Positioned(bottom: 30.h,right: 10.w,child: FloatingActionButton(
              onPressed: (){},
              child: Icon(Icons.favorite_outline_rounded,color: AppColors.appColorWhite,),
              backgroundColor: AppColors.colorPrimary,
            ),)
          ],
        ),
      ),
    );
  }

  @override
  Base<BaseEvent, BaseState> getBloc() {
    return bloc;
  }
}
