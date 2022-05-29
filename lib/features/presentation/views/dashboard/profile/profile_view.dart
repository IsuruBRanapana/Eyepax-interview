import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app_eyepax_practical/core/services/dependency_injection.dart';
import 'package:news_app_eyepax_practical/core/util/navigation_routes.dart';
import 'package:news_app_eyepax_practical/features/domain/entities/response/login_response_entity.dart';
import 'package:news_app_eyepax_practical/features/presentation/bloc/base_bloc.dart';
import 'package:news_app_eyepax_practical/features/presentation/bloc/base_event.dart';
import 'package:news_app_eyepax_practical/features/presentation/bloc/base_state.dart';
import 'package:news_app_eyepax_practical/features/presentation/views/base_view.dart';

import '../../../../../core/util/app_colors.dart';
import '../../../../../core/util/enums.dart';
import '../../../bloc/auth/auth_bloc.dart';
import '../../../bloc/auth/auth_event.dart';
import '../../../bloc/auth/auth_state.dart';
import '../../../common/common_app_button.dart';

///Created By Isuru B. Ranapana
/// 2022-05-28 16:19

class ProfileView extends BaseView {
  final ScrollController controller;
  final LoginResponseEntity loginResponse;

  ProfileView({
    Key? key,
    required this.controller,
    required this.loginResponse,
  });

  @override
  _ProfileViewState createState() => _ProfileViewState();
}

class _ProfileViewState extends BaseViewState<ProfileView> {
  var bloc = injection<AuthBloc>();

  @override
  Widget buildView(BuildContext context) {
    return BlocProvider<AuthBloc>(
        create: (_) => bloc,
        child: BlocListener<AuthBloc, BaseState<AuthState>>(
          bloc: bloc,
          listener: (_, state) {
            if (state is GetLoggedOutSuccessState) {
              Navigator.pushNamedAndRemoveUntil(
                  context, Routes.LOGIN_VIEW, (route) => false);
            }
          },
          child: Padding(
            padding: EdgeInsets.only(left: 10.w, right: 10.w),
            child: ListView(
              controller: widget.controller,
              children: [
                SizedBox(
                  height: 100.h,
                ),
                Text(
                  "First Name : ",
                  style:
                      TextStyle(color: AppColors.colorPrimary, fontSize: 16.sp),
                ),
                Center(
                    child: Container(
                        height: 40.h,
                        padding: EdgeInsets.only(
                            left: 20.w, right: 20.w, top: 10.h, bottom: 10.h),
                        decoration: BoxDecoration(
                            color: AppColors.colorTertiary,
                            borderRadius: BorderRadius.circular(5.h)),
                        child: Text(
                          widget.loginResponse.firstName!,
                          style: TextStyle(
                              color: AppColors.appColorBlack,
                              fontSize: 14.sp,
                              fontWeight: FontWeight.bold),
                        ))),
                SizedBox(
                  height: 10.h,
                ),
                Text(
                  "Last Name : ",
                  style:
                      TextStyle(color: AppColors.colorPrimary, fontSize: 16.sp),
                ),
                Center(
                    child: Container(
                        height: 40.h,
                        padding: EdgeInsets.only(
                            left: 20.w, right: 20.w, top: 10.h, bottom: 10.h),
                        decoration: BoxDecoration(
                            color: AppColors.colorTertiary,
                            borderRadius: BorderRadius.circular(5.h)),
                        child: Text(
                          widget.loginResponse.lastName!,
                          style: TextStyle(
                              color: AppColors.appColorBlack,
                              fontSize: 14.sp,
                              fontWeight: FontWeight.bold),
                        ))),
                SizedBox(
                  height: 10.h,
                ),
                Text(
                  "Email Name : ",
                  style:
                      TextStyle(color: AppColors.colorPrimary, fontSize: 16.sp),
                ),
                Center(
                    child: Container(
                        height: 40.h,
                        padding: EdgeInsets.only(
                            left: 20.w, right: 20.w, top: 10.h, bottom: 10.h),
                        decoration: BoxDecoration(
                            color: AppColors.colorTertiary,
                            borderRadius: BorderRadius.circular(5.h)),
                        child: Text(
                          widget.loginResponse.email!,
                          style: TextStyle(
                              color: AppColors.appColorBlack,
                              fontSize: 14.sp,
                              fontWeight: FontWeight.bold),
                        ))),
                SizedBox(
                  height: 30.h,
                ),
                AppButton(
                  buttonColor: AppColors.colorPrimary,
                  buttonType: ButtonType.SOLID,
                  buttonText: 'Log Out',
                  onTapButton: () {
                    bloc.add(GetLoggedOutEvent());
                  },
                ),
              ],
            ),
          ),
        ));
  }

  @override
  Base<BaseEvent, BaseState> getBloc() {
    return bloc;
  }
}
