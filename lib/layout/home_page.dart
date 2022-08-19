import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../shared/cubit/app_bloc.dart';
import '../shared/cubit/app_states.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppCubit()..getBusinessData()..getScienceData()..getSportsData(),
      child: BlocConsumer<AppCubit, AppStates>(
          builder: (context, state) {
            var cubit = AppCubit.get(context);
            return Scaffold(
              appBar: AppBar(
                title: const Text('News App'),
                actions: [
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.search,
                    ),
                  ),
                ],
              ),
              body: cubit.screens[cubit.currentIndex],
              bottomNavigationBar: BottomNavigationBar(
                currentIndex: cubit.currentIndex,
                onTap: (index) {
                  cubit.changeCurrentPage(index);
                },
                items: const [
                  BottomNavigationBarItem(
                      icon: Icon(
                        Icons.business_center,
                      ),
                      label: 'Business'),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.sports), label: 'Sports'),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.science), label: 'Science'),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.settings), label: 'Setting'),
                ],
              ),
            );
          },
          listener: (context, state) {}),
    );
  }
}
