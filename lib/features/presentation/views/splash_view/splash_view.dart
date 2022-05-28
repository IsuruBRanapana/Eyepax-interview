import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app_eyepax_practical/core/services/dependency_injection.dart';
import 'package:news_app_eyepax_practical/core/util/app_colors.dart';
import 'package:news_app_eyepax_practical/features/presentation/bloc/auth/auth_bloc.dart';
import 'package:news_app_eyepax_practical/features/presentation/bloc/auth/auth_state.dart';
import 'package:news_app_eyepax_practical/features/presentation/bloc/base_bloc.dart';
import 'package:news_app_eyepax_practical/features/presentation/bloc/base_event.dart';
import 'package:news_app_eyepax_practical/features/presentation/bloc/base_state.dart';
import 'package:news_app_eyepax_practical/features/presentation/views/base_view.dart';

import '../../../../core/util/navigation_routes.dart';

///Created By Isuru B. Ranapana
/// 2022-05-29 00:11

class SplashView extends BaseView {
  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends BaseViewState<SplashView> {
  var bloc = injection<AuthBloc>();

  @override
  void initState() {
    Timer(const Duration(seconds: 2), () {
      Navigator.pushNamedAndRemoveUntil(
          context, Routes.LOGIN_VIEW, (route) => false);
    });
    super.initState();
  }

  @override
  Widget buildView(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.colorPrimary,
      body: BlocProvider<AuthBloc>(
        create: (_) => bloc,
        child: BlocListener<AuthBloc, BaseState<AuthState>>(
          bloc: bloc,
          listener: (_, state){

          },
          child: Center(
            child: Text("NEWS",style: TextStyle(fontSize: 25.sp,color: AppColors.appColorWhite),),
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
