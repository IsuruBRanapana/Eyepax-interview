import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app_eyepax_practical/core/services/dependency_injection.dart';
import 'package:news_app_eyepax_practical/features/data/models/response/login_response_model.dart';
import 'package:news_app_eyepax_practical/features/domain/entities/response/login_response_entity.dart';
import 'package:news_app_eyepax_practical/features/presentation/bloc/base_bloc.dart';
import 'package:news_app_eyepax_practical/features/presentation/bloc/base_event.dart';
import 'package:news_app_eyepax_practical/features/presentation/bloc/base_state.dart';
import 'package:news_app_eyepax_practical/features/presentation/bloc/home/home_bloc.dart';
import 'package:news_app_eyepax_practical/features/presentation/views/base_view.dart';

import '../../../../../core/util/app_colors.dart';
import '../../../../../core/util/enums.dart';
import '../../../common/common_app_button.dart';

///Created By Isuru B. Ranapana
/// 2022-05-28 16:19

class ProfileView extends BaseView {
  final ScrollController controller;
  final LoginResponseEntity loginResponse;

  ProfileView( {
    Key? key,
    required this.controller,
    required this.loginResponse,
  });

  @override
  _ProfileViewState createState() => _ProfileViewState();
}

class _ProfileViewState extends BaseViewState<ProfileView> {
  var bloc = injection<HomeBloc>();

  @override
  Widget buildView(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 10.w, right: 10.w),
      child: ListView(
        controller: widget.controller,
        children: [
          Text(widget.loginResponse.firstName!),
          Text(widget.loginResponse.lastName!),
          Text(widget.loginResponse.email!),
          AppButton(
          buttonColor: AppColors.colorPrimary,
          buttonType: ButtonType.SOLID,
          buttonText: 'Log Out', onTapButton: () {},
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
