import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app_eyepax_practical/core/services/dependency_injection.dart';
import 'package:news_app_eyepax_practical/features/presentation/bloc/base_bloc.dart';
import 'package:news_app_eyepax_practical/features/presentation/bloc/base_event.dart';
import 'package:news_app_eyepax_practical/features/presentation/bloc/base_state.dart';
import 'package:news_app_eyepax_practical/features/presentation/bloc/home/home_bloc.dart';
import 'package:news_app_eyepax_practical/features/presentation/views/base_view.dart';

import '../../../../../core/util/app_colors.dart';

///Created By Isuru B. Ranapana
/// 2022-05-28 16:18

class FavouriteView extends BaseView {
  final ScrollController controller;

  FavouriteView({Key? key, required this.controller});

  @override
  _FavouriteViewState createState() => _FavouriteViewState();
}

class _FavouriteViewState extends BaseViewState<FavouriteView> {
  var bloc = injection<HomeBloc>();
  var numb = [1, 2, 3, 4];

  @override
  Widget buildView(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 10.w, right: 10.w),
      child: ListView(
        controller: widget.controller,
        children: [
          SizedBox(
            height: 200.h,
          ),
          Center(
              child: Text(
            "No More Favourites (Not Implemented)",
            style: TextStyle(fontSize: 12.sp, color: AppColors.colorPrimary),
          ))
        ],
      ),
    );
  }

  @override
  Base<BaseEvent, BaseState> getBloc() {
    return bloc;
  }
}
