import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app_eyepax_practical/core/services/dependency_injection.dart';
import 'package:news_app_eyepax_practical/core/util/app_colors.dart';
import 'package:news_app_eyepax_practical/core/util/enums.dart';
import 'package:news_app_eyepax_practical/features/domain/entities/request/login_request_entity.dart';
import 'package:news_app_eyepax_practical/features/presentation/bloc/auth/auth_bloc.dart';
import 'package:news_app_eyepax_practical/features/presentation/bloc/auth/auth_state.dart';
import 'package:news_app_eyepax_practical/features/presentation/bloc/base_bloc.dart';
import 'package:news_app_eyepax_practical/features/presentation/bloc/base_event.dart';
import 'package:news_app_eyepax_practical/features/presentation/bloc/base_state.dart';
import 'package:news_app_eyepax_practical/features/presentation/common/common_app_button.dart';
import 'package:news_app_eyepax_practical/features/presentation/common/common_app_text_field.dart';
import 'package:news_app_eyepax_practical/features/presentation/views/base_view.dart';

import '../../../../core/util/navigation_routes.dart';
import '../../bloc/auth/auth_event.dart';

///Created By Isuru B. Ranapana
/// 2022-05-29 00:33

class LoginView extends BaseView {
  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends BaseViewState<LoginView> {
  var bloc = injection<AuthBloc>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget buildView(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.colorPrimary,
      body: BlocProvider<AuthBloc>(
        create: (_) => bloc,
        child: BlocListener<AuthBloc, BaseState<AuthState>>(
          bloc: bloc,
          listener: (_, state) {
            if(state is LoginSuccessState){
              if(state.responseEntity.success=='success'){
                Navigator.pushNamed(context, Routes.DASHBOARD_VIEW);
              }
            }
          },
          child: Stack(
            alignment: Alignment.topCenter,
            children: [
              Positioned(
                top: 120.h,
                child: Text(
                  "NEWS",
                  style: TextStyle(
                      fontSize: 25.sp, color: AppColors.appColorWhite),
                ),
              ),
              Positioned(
                top: 170.h,
                child: Text(
                  "Log In",
                  style: TextStyle(
                      fontSize: 18.sp, color: AppColors.appColorWhite,fontWeight: FontWeight.bold),
                ),
              ),
              Positioned(
                top: 220.h,
                child: SizedBox(
                  width: 240.w,
                  height: 80.h,
                  child: CommonAppTextField(
                    label: "Email Address",
                    controller: _emailController,
                    hint: "Enter Email Address",
                  ),
                ),
              ),
              Positioned(
                top: 280.h,
                child: SizedBox(
                  width: 240.w,
                  height: 80.h,
                  child: CommonAppTextField(
                    isObscure: true,
                    label: "Password",
                    controller: _passwordController,
                    hint: "Enter the Password",
                  ),
                ),
              ),
              Positioned(top: 360.h,child: AppButton(
                width: 240.w,
                // textRightPadding: 30.w,
                buttonColor: AppColors.appColorWhite,
                textColor: AppColors.colorPrimary,
                buttonType: ButtonType.SOLID,
                buttonText: 'Login', onTapButton: () {
                  bloc.add(LoginEvent(request: LoginRequestEntity(email: _emailController.text, password: _passwordController.text)));
              },
              ),),
              Positioned(
                  top: 480.h,
                child: Text.rich(TextSpan(
                    text: "Don't you have an account ?",
                    style: TextStyle(fontSize: 14.sp),
                    children: <InlineSpan>[
                      TextSpan(
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Navigator.pushNamed(
                                context, Routes.SIGN_UP_VIEW);
                          },
                        text: " Sign Up",
                        style: TextStyle(fontWeight: FontWeight.bold,fontSize: 14.sp),
                      )
                    ])),
              ),
            ],
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
