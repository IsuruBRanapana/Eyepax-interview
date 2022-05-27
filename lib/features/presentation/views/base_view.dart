import 'dart:io';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:news_app_eyepax_practical/core/error/messages.dart';
import 'package:news_app_eyepax_practical/core/services/dependency_injection.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app_eyepax_practical/features/presentation/bloc/base_bloc.dart';
import 'package:news_app_eyepax_practical/features/presentation/bloc/base_event.dart';
import 'package:news_app_eyepax_practical/features/presentation/bloc/base_state.dart';

import '../../../core/util/app_colors.dart';

///Created By Isuru B. Ranapana
/// 2022-05-27 22:48
///

abstract class BaseView extends StatefulWidget {
  BaseView({Key? key}) : super(key: key);
}

abstract class BaseViewState<Page extends BaseView> extends State<Page> {
  Base<BaseEvent,BaseState> getBloc();

  Widget buildView(BuildContext context);

  logout() async {}

  @override
  void initState() {
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return BlocProvider<Base>(
      create: (_) => getBloc(),
      child: BlocListener<Base, BaseState>(
        listener: (context, state) {
        },
        child: Container(
          margin: EdgeInsets.only(bottom: Platform.isIOS ? 5 : 0),
          child: buildView(context),
        ),
      ),
    );
  }
}
