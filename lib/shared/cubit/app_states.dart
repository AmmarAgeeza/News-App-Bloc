abstract class AppStates {}

class InitialAppState extends AppStates {}

class BottomNavBarState extends AppStates {}

class GetBusinessDataSuccessfullyState extends AppStates {}

class GetBusinessDataErrorState extends AppStates {
  final String error;

  GetBusinessDataErrorState(this.error);
}

class GetBusinessDataLoadingState extends AppStates {}

class GetScienceDataSuccessfullyState extends AppStates {}

class GetScienceDataErrorState extends AppStates {
  final String error;

  GetScienceDataErrorState(this.error);
}

class GetScienceDataLoadingState extends AppStates {}

class GetSportsDataSuccessfullyState extends AppStates {}

class GetSportsDataErrorState extends AppStates {
  final String error;

  GetSportsDataErrorState(this.error);
}

class GetSportsDataLoadingState extends AppStates {}
