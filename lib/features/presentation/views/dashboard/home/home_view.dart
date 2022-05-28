import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app_eyepax_practical/core/services/dependency_injection.dart';
import 'package:news_app_eyepax_practical/core/util/app_colors.dart';
import 'package:news_app_eyepax_practical/core/util/enums.dart';
import 'package:news_app_eyepax_practical/core/util/navigation_routes.dart';
import 'package:news_app_eyepax_practical/features/domain/entities/common/category.dart';
import 'package:news_app_eyepax_practical/features/presentation/bloc/base_bloc.dart';
import 'package:news_app_eyepax_practical/features/presentation/bloc/base_event.dart';
import 'package:news_app_eyepax_practical/features/presentation/bloc/base_state.dart';
import 'package:news_app_eyepax_practical/features/presentation/common/common_app_button.dart';
import 'package:news_app_eyepax_practical/features/presentation/common/description_news_tile.dart';
import 'package:news_app_eyepax_practical/features/presentation/common/latest_news_tile.dart';
import 'package:news_app_eyepax_practical/features/presentation/common/normal_news_tile.dart';
import 'package:news_app_eyepax_practical/features/presentation/common/opacity_tile.dart';
import 'package:news_app_eyepax_practical/features/presentation/views/base_view.dart';

import '../../../bloc/home/home_bloc.dart';

///Created By Isuru B. Ranapana
/// 2022-05-28 16:19

class HomeView extends BaseView {
  final ScrollController controller;

  HomeView({
    Key? key,
    required this.controller,
  });

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends BaseViewState<HomeView> {
  var bloc = injection<HomeBloc>();
  List<CategoryEntity> categories = [
    const CategoryEntity(name: "Health", id: 1),
    const CategoryEntity(name: "Technology", id: 2),
    const CategoryEntity(name: "Art", id: 3),
    const CategoryEntity(name: "Finance", id: 4),
    const CategoryEntity(name: "Politics", id: 5)
  ];

  int selectedBtnIndex = 1;

  @override
  Widget buildView(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 10.w, right: 10.w),
      child: ListView(
        controller: widget.controller,
        physics: const ClampingScrollPhysics(),
        children: [
          Container(
            height: 30.h,
          ),
          Container(
            height: 40.h,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Latest News",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16.sp,
                  ),
                ),
                const Expanded(child: SizedBox()),
                InkResponse(
                  onTap: () {
                    Navigator.pushNamed(
                        context, Routes.SEE_ALL_LATEST_POSTS_VIEW);
                  },
                  child: Container(
                    width: 60.w,
                    child: Row(
                      children: [
                        Text(
                          "See All",
                          style: TextStyle(
                              fontSize: 10.sp, color: AppColors.colorSecondary),
                        ),
                        SizedBox(
                          width: 3.w,
                        ),
                        Icon(
                          Icons.arrow_forward,
                          size: 12.h,
                          color: AppColors.colorSecondary,
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: 5.h,
          ),
          CarouselSlider(
            options: CarouselOptions(
                height: 190.h,
                autoPlay: false,
                enableInfiniteScroll: true,
                viewportFraction: 0.8,
                enlargeCenterPage: true,
                enlargeStrategy: CenterPageEnlargeStrategy.values[0]),
            items: [1, 2, 3, 4, 5].map((i) {
              return Builder(
                builder: (BuildContext context) {
                  return InkWell(
                      onTap: () =>
                          Navigator.pushNamed(context, Routes.SINGLE_POST_VIEW),
                      child: LatestNewsTile());
                },
              );
            }).toList(),
          ),
          SizedBox(
            height: 5.h,
          ),
          Container(
            width: 230.w,
            height: 30.h,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: categories.length,
              itemBuilder: (context, index) => Container(
                width: 65.w,
                padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 5.h),
                child: AppButton(
                    buttonColor: selectedBtnIndex == categories[index].id
                        ? AppColors.colorPrimary
                        : AppColors.appColorWhite,
                    textColor: selectedBtnIndex == categories[index].id
                        ? AppColors.appColorWhite
                        : AppColors.appColorBlack,
                    isTextPadding: false,
                    isTextBold: false,
                    fontSize: 8.sp,
                    width: 40.w,
                    buttonText: categories[index].name,
                    onTapButton: () {
                      setState(() {
                        selectedBtnIndex = categories[index].id;
                      });
                    }),
              ),
            ),
          ),
          SizedBox(
            height: 5.h,
          ),
          Container(
            // width: 230.w,
            height: 110.h * categories.length,
            child: ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              itemCount: categories.length,
              itemBuilder: (context, index) => Container(
                width: 65.w,
                padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 5.h),
                child: const NormalNewsTile(),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Base<BaseEvent, BaseState> getBloc() {
    return bloc;
  }
}
