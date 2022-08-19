import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_app_bloc/screens/business_screen.dart';
import 'package:new_app_bloc/screens/science_screen.dart';
import 'package:new_app_bloc/screens/sports_screen.dart';

import '../../screens/setting_screen.dart';
import '../network/remote/dio_helper.dart';
import 'app_states.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(InitialAppState());

  static AppCubit get(context) => BlocProvider.of(context);

  //bottom nav bar logic
  List screens = <Widget>[
    const BusinessScreen(),
    const SportsScreen(),
    const ScienceScreen(),
    const SettingScreen(),
  ];
  int currentIndex = 0;

  void changeCurrentPage(int index) {
    currentIndex = index;
    emit(BottomNavBarState());
  }

  List<dynamic> businessData = [];

  void getBusinessData() {
    emit(GetBusinessDataLoadingState());

    DioHelper.getData(url: 'v2/top-headlines', query: {
      'country': 'eg',
      'category': 'business',
      'apiKey': '65f7f556ec76449fa7dc7c0069f040ca'
    }).then((value) {
      businessData = value.data['articles'];
      print(businessData[0]['title']);
      emit(GetBusinessDataSuccessfullyState());
    }).catchError((e) {
      print(e.toString());
      emit(GetBusinessDataErrorState(e.toString()));
    });
  }

  List<dynamic> scienceData = [];

  void getScienceData() {
    emit(GetScienceDataLoadingState());

    DioHelper.getData(url: 'v2/top-headlines', query: {
      'country': 'eg',
      'category': 'science',
      'apiKey': '65f7f556ec76449fa7dc7c0069f040ca'
    }).then((value) {
      scienceData = value.data['articles'];
      print(scienceData[0]['title']);
      emit(GetScienceDataSuccessfullyState());
    }).catchError((e) {
      print(e.toString());
      emit(GetScienceDataErrorState(e.toString()));
    });
  }

  List<dynamic> sportsData = [];

  void getSportsData() {
    emit(GetSportsDataLoadingState());

    DioHelper.getData(url: 'v2/top-headlines', query: {
      'country': 'eg',
      'category': 'sports',
      'apiKey': '65f7f556ec76449fa7dc7c0069f040ca'
    }).then((value) {
      sportsData = value.data['articles'];
      print(sportsData[0]['title']);
      emit(GetSportsDataSuccessfullyState());
    }).catchError((e) {
      print(e.toString());
      emit(GetSportsDataErrorState(e.toString()));
    });
  }
}
