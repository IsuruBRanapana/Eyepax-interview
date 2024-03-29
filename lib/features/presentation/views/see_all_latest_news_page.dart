import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app_eyepax_practical/core/services/dependency_injection.dart';
import 'package:news_app_eyepax_practical/core/util/app_colors.dart';
import 'package:news_app_eyepax_practical/features/domain/entities/response/news_response_entity.dart';
import 'package:news_app_eyepax_practical/features/presentation/bloc/base_bloc.dart';
import 'package:news_app_eyepax_practical/features/presentation/bloc/base_event.dart';
import 'package:news_app_eyepax_practical/features/presentation/bloc/base_state.dart';
import 'package:news_app_eyepax_practical/features/presentation/views/base_view.dart';

import '../bloc/home/home_bloc.dart';
import '../common/description_news_tile.dart';

///Created By Isuru B. Ranapana
/// 2022-05-28 22:44

class SeeAllLatestNewsPage extends BaseView {
  SeeAllLatestNewsPage({
    Key? key,
    required this.news,
  });

  final NewsResponse news;

  @override
  _SeeAllLatestNewsPageState createState() => _SeeAllLatestNewsPageState();
}

class _SeeAllLatestNewsPageState extends BaseViewState<SeeAllLatestNewsPage> {
  var bloc = injection<HomeBloc>();

  @override
  Widget buildView(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.appColorWhite,
      body: Padding(
        padding: EdgeInsets.only(
          left: 10.w,
          right: 10.w,
        ),
        child: ListView(
          children: [
            Container(
              height: 40.h,
              width: 250.w,
              child: Center(
                  child: Row(
                children: [
                  InkWell(
                    onTap: () => Navigator.pop(context),
                    child: Icon(
                      Icons.arrow_back_ios,
                      color: AppColors.appColorBlack,
                      size: 15.h,
                    ),
                  ),
                  Expanded(
                      child: Center(
                    child: Text(
                      'Latest News',
                      style: TextStyle(
                          fontSize: 15.sp,
                          color: AppColors.colorPrimary,
                          fontWeight: FontWeight.w500),
                    ),
                  )),
                  SizedBox(
                    width: 15.h,
                  )
                ],
              )),
            ),
            SizedBox(
              height: 5.h,
            ),
            Container(
              height: 590.h,
              child: ListView.builder(
                itemCount: widget.news.articles.length,
                itemBuilder: (context, index) =>
                    DescriptionNewsTile(news: widget.news.articles[index]),
              ),
            )
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
