import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:social_app/models/user_model/user_model.dart';
import 'package:social_app/modules/chats/chats_screen.dart';
import 'package:social_app/modules/feeds/feeds_screen.dart';
import 'package:social_app/modules/settings/settings_screen.dart';
import 'package:social_app/modules/users/users_screens.dart';
import 'package:social_app/shared/components/constant.dart';

part 'social_state.dart';

class SocialCubit extends Cubit<SocialStates> {
  SocialCubit() : super(SocialInitialState());

  static SocialCubit get(context) => BlocProvider.of(context);

  UserModel? userModel;

  void getUserData() {
    emit(SocialGetUserLoadingState());

    FirebaseFirestore.instance.collection('users').doc(uId).get().then((value) {
      userModel = UserModel.fromJson(value.data()!);
      emit(SocialGetUserSuccessState());
    }).catchError((error) {
      emit(
        SocialGetUserErrorState(
          error.toString(),
        ),
      );
    });
  }

  int currentIndex = 0;
  List<Widget> screens = [
    const FeedsScreen(),
    const ChatsScreen(),
    const UsersScreen(),
    const SettingsScreen(),
  ];
  List<String> titles = [
    'Home',
    'Chats',
    'Users',
    'Settings',
  ];
  List<BottomNavigationBarItem> items = [
    const BottomNavigationBarItem(
      icon: Icon(
        Icons.home_filled,
      ),
      label: 'Home',
    ),
    const BottomNavigationBarItem(
      icon: Icon(
        Icons.chat_bubble_outline,
      ),
      label: 'Chat',
    ),
    const BottomNavigationBarItem(
      icon: Icon(
        Icons.near_me_outlined,
      ),
      label: 'Users',
    ),
    const BottomNavigationBarItem(
      icon: Icon(
        Icons.settings,
      ),
      label: 'Setting',
    ),
  ];

  void changeBottemNav(int index) {
    currentIndex = index;
    emit(SocialChangeBottomNavBarState());
  }
}
