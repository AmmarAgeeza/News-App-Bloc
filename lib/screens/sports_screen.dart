import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../shared/components/articles_builder.dart';
import '../shared/cubit/app_bloc.dart';
import '../shared/cubit/app_states.dart';

class SportsScreen extends StatelessWidget {
  const SportsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
        builder: (context, state) {
          return ArticlesBuilder(AppCubit.get(context).sportsData);
        },
        listener: (context, state) {});
  }
}
