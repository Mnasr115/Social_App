part of 'social_cubit.dart';

@immutable
abstract class SocialStates {}

class SocialInitialState extends SocialStates {}
class SocialGetUserLoadingState extends SocialStates {}
class SocialGetUserSuccessState extends SocialStates {}
class SocialGetUserErrorState extends SocialStates {
  final String errorMessage;

  SocialGetUserErrorState(this.errorMessage);
}

class SocialChangeBottomNavBarState extends SocialStates {}
class SocialNewPostState extends SocialStates {}