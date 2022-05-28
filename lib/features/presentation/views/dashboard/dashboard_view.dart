import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_floating_bottom_bar/flutter_floating_bottom_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app_eyepax_practical/core/util/app_colors.dart';
import 'package:news_app_eyepax_practical/features/presentation/views/dashboard/favourite/favourite_view.dart';
import 'package:news_app_eyepax_practical/features/presentation/views/dashboard/home/home_view.dart';
import 'package:news_app_eyepax_practical/features/presentation/views/dashboard/profile/profile_view.dart';

///Created By Isuru B. Ranapana
/// 2022-05-28 16:16

class DashboardView extends StatefulWidget {
  DashboardView({Key? key}) : super(key: key);

  @override
  _DashboardViewState createState() => _DashboardViewState();
}

class _DashboardViewState extends State<DashboardView>
    with SingleTickerProviderStateMixin {
  //todo: change colors
  late int currentPage;
  late TabController tabController;
  final List<Color> colors = [
    Colors.yellow,
    Colors.red,
    Colors.green,
    // Colors.blue,
    // Colors.pink
  ];

  @override
  void initState() {
    currentPage = 0;
    tabController = TabController(length: 3, vsync: this);
    tabController.animation!.addListener(
      () {
        final value = tabController.animation!.value.round();
        if (value != currentPage && mounted) {
          changePage(value);
        }
      },
    );
    super.initState();
  }

  void changePage(int newPage) {
    setState(() {
      currentPage = newPage;
    });
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.only(bottom: 0),
          child: BottomBar(
            fit: StackFit.expand,
            icon: const Center(
              child: IconButton(
                padding: EdgeInsets.zero,
                onPressed: null,
                icon: Icon(
                  Icons.arrow_upward_rounded,
                  color: AppColors.colorPrimary,
                ),
              ),
            ),
            borderRadius: BorderRadius.circular(500),
            duration: const Duration(seconds: 1),
            curve: Curves.decelerate,
            showIcon: true,
            width: MediaQuery.of(context).size.width * 0.7,
            barColor: AppColors.appColorWhite,
            start: 10,
            end: 5,
            bottom: 30.h,
            alignment: Alignment.bottomCenter,
            iconHeight: 35,
            iconWidth: 35,
            reverse: false,
            hideOnScroll: true,
            scrollOpposite: false,
            onBottomBarHidden: () {},
            onBottomBarShown: () {},
            body: (context, controller) => TabBarView(
                controller: tabController,
                dragStartBehavior: DragStartBehavior.down,
                physics: const BouncingScrollPhysics(),
                children: [
                  HomeView(controller: controller),
                  FavouriteView(controller: controller),
                  ProfileView(controller: controller)
                ]),
            child: TabBar(
              indicatorPadding: const EdgeInsets.fromLTRB(6, 0, 6, 40),
              controller: tabController,
              indicator: const UnderlineTabIndicator(
                  borderSide: BorderSide(
                      color: AppColors.colorPrimary,
                      width: 4),
                  insets: EdgeInsets.fromLTRB(16, 0, 16, 8)),
              tabs: [
                SizedBox(
                  height: 40.h,
                  width: 40.w,
                  child: Center(
                      child: Padding(
                    padding: EdgeInsets.only(top: 8.h),
                    child: Column(
                      children: [
                        Icon(
                          Icons.home_outlined,
                          color: currentPage == 0 ? AppColors.colorPrimary : AppColors.appGrayColor,
                        ),
                        Text(
                          "Home",
                          style: TextStyle(color: currentPage == 0 ? AppColors.colorPrimary : AppColors.appGrayColor,fontSize: 8.sp),
                        )
                      ],
                    ),
                  )),
                ),
                SizedBox(
                  height: 40.h,
                  width: 40.w,
                  child: Center(
                      child: Padding(
                        padding: EdgeInsets.only(top: 8.h),
                        child: Column(
                          children: [
                            Icon(
                    Icons.favorite_border,
                    color: currentPage == 1 ? AppColors.colorPrimary : AppColors.appGrayColor,
                  ),
                            Text(
                              "Favourite",
                              style: TextStyle(color: currentPage == 1 ? AppColors.colorPrimary : AppColors.appGrayColor,fontSize: 8.sp),
                            )
                          ],
                        ),
                      )),
                ),
                SizedBox(
                  height: 40.h,
                  width: 40.w,
                  child: Center(
                      child: Padding(
                        padding: EdgeInsets.only(top: 8.h),
                        child: Column(
                          children: [
                            Icon(
                              Icons.insert_emoticon,
                              color: currentPage == 2 ? AppColors.colorPrimary : AppColors.appGrayColor,
                            ),
                            Text(
                              "Profile",
                              style: TextStyle(color: currentPage == 2 ? AppColors.colorPrimary : AppColors.appGrayColor,fontSize: 8.sp),
                            )
                          ],
                        ),
                      )),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
