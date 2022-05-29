import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_floating_bottom_bar/flutter_floating_bottom_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app_eyepax_practical/core/util/app_colors.dart';
import 'package:news_app_eyepax_practical/features/domain/entities/response/news_response_entity.dart';
import 'package:news_app_eyepax_practical/features/presentation/bloc/base_bloc.dart';
import 'package:news_app_eyepax_practical/features/presentation/bloc/base_event.dart';
import 'package:news_app_eyepax_practical/features/presentation/bloc/base_state.dart';
import 'package:news_app_eyepax_practical/features/presentation/bloc/home/home_event.dart';
import 'package:news_app_eyepax_practical/features/presentation/views/base_view.dart';
import 'package:news_app_eyepax_practical/features/presentation/views/dashboard/favourite/favourite_view.dart';
import 'package:news_app_eyepax_practical/features/presentation/views/dashboard/home/home_view.dart';
import 'package:news_app_eyepax_practical/features/presentation/views/dashboard/profile/profile_view.dart';

import '../../../../core/services/dependency_injection.dart';
import '../../bloc/home/home_bloc.dart';
import '../../bloc/home/home_state.dart';

///Created By Isuru B. Ranapana
/// 2022-05-28 16:16

class DashboardView extends BaseView {
  DashboardView({Key? key}) : super(key: key);

  @override
  _DashboardViewState createState() => _DashboardViewState();
}

class _DashboardViewState extends BaseViewState<DashboardView>
    with SingleTickerProviderStateMixin {
  var bloc = injection<HomeBloc>();
  late int currentPage;
  late NewsResponse normalNews;
  late NewsResponse topNews;
  bool newsLoaded = false;

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
    bloc.add(GetAllNewsEvent());
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
  Widget buildView(BuildContext context) {
    return Scaffold(
      body: BlocProvider<HomeBloc>(
        create: (_) => bloc,
        child: BlocListener<HomeBloc, BaseState<HomeState>>(
          bloc: bloc,
          listener: (_, state) {
            if(state is GetAllNewsSuccessState){
              print(state.responseEntity.totalResults);
              normalNews = state.responseEntity;
              bloc.add(GetTopNewsEvent());
            }else if(state is GetTopNewsSuccessState){
              topNews=state.responseEntity;
              newsLoaded = true;
              setState(() {

              });


            }
          },
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
            start: 2,
            end: 0,
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
                  newsLoaded?HomeView(controller: controller,news: normalNews,newsLoaded: newsLoaded,topNews: topNews,):SizedBox(),
                  FavouriteView(controller: controller),
                  ProfileView(controller: controller)
                ]),
            child: TabBar(
              indicatorPadding: const EdgeInsets.fromLTRB(6, 0, 6, 40),
              controller: tabController,
              indicator: const UnderlineTabIndicator(
                  borderSide: BorderSide(color: AppColors.colorPrimary, width: 4),
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
                          color: currentPage == 0
                              ? AppColors.colorPrimary
                              : AppColors.appGrayColor,
                        ),
                        Text(
                          "Home",
                          style: TextStyle(
                              color: currentPage == 0
                                  ? AppColors.colorPrimary
                                  : AppColors.appGrayColor,
                              fontSize: 8.sp),
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
                          color: currentPage == 1
                              ? AppColors.colorPrimary
                              : AppColors.appGrayColor,
                        ),
                        Text(
                          "Favourite",
                          style: TextStyle(
                              color: currentPage == 1
                                  ? AppColors.colorPrimary
                                  : AppColors.appGrayColor,
                              fontSize: 8.sp),
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
                          color: currentPage == 2
                              ? AppColors.colorPrimary
                              : AppColors.appGrayColor,
                        ),
                        Text(
                          "Profile",
                          style: TextStyle(
                              color: currentPage == 2
                                  ? AppColors.colorPrimary
                                  : AppColors.appGrayColor,
                              fontSize: 8.sp),
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

  @override
  Base<BaseEvent, BaseState> getBloc() {
    return bloc;
  }
}
