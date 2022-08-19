import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_app_bloc/shared/components/articles_builder.dart';
import 'package:new_app_bloc/shared/cubit/app_bloc.dart';
import 'package:new_app_bloc/shared/cubit/app_states.dart';


class BusinessScreen extends StatelessWidget {
  const BusinessScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
        builder: (context, state) {
          return ArticlesBuilder(AppCubit.get(context).businessData);
        },
        listener: (context, state) {});
  }
}
