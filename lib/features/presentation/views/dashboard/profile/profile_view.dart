import 'package:flutter/cupertino.dart';
import 'package:news_app_eyepax_practical/core/services/dependency_injection.dart';
import 'package:news_app_eyepax_practical/features/presentation/bloc/base_bloc.dart';
import 'package:news_app_eyepax_practical/features/presentation/bloc/base_event.dart';
import 'package:news_app_eyepax_practical/features/presentation/bloc/base_state.dart';
import 'package:news_app_eyepax_practical/features/presentation/bloc/home/home_bloc.dart';
import 'package:news_app_eyepax_practical/features/presentation/views/base_view.dart';

///Created By Isuru B. Ranapana
/// 2022-05-28 16:19

class ProfileView extends BaseView {
  final ScrollController controller;

  ProfileView({
    Key? key,
    required this.controller,
  });

  @override
  _ProfileViewState createState() => _ProfileViewState();
}

class _ProfileViewState extends BaseViewState<ProfileView> {
  var bloc = injection<HomeBloc>();

  @override
  Widget buildView(BuildContext context) {
    return ListView(
      controller: widget.controller,
      children: [Text("Profile")],
    );
  }

  @override
  Base<BaseEvent, BaseState> getBloc() {
    return bloc;
  }
}
