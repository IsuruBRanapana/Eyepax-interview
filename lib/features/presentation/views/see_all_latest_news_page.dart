import 'package:flutter/material.dart';
import 'package:news_app_eyepax_practical/features/presentation/bloc/base_bloc.dart';
import 'package:news_app_eyepax_practical/features/presentation/bloc/base_event.dart';
import 'package:news_app_eyepax_practical/features/presentation/bloc/base_state.dart';
import 'package:news_app_eyepax_practical/features/presentation/views/base_view.dart';

///Created By Isuru B. Ranapana
/// 2022-05-28 22:44

class SeeAllLatestNewsPage extends BaseView {
  SeeAllLatestNewsPage({Key? key});

  @override
  _SeeAllLatestNewsPageState createState() => _SeeAllLatestNewsPageState();
}

class _SeeAllLatestNewsPageState extends BaseViewState<SeeAllLatestNewsPage> {

  @override
  Widget buildView(BuildContext context) {
    // TODO: implement buildView
    throw UnimplementedError();
  }

  @override
  Base<BaseEvent, BaseState> getBloc() {
    // TODO: implement getBloc
    throw UnimplementedError();
  }
}
