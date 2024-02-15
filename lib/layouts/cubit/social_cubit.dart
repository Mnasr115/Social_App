import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:social_app/models/user_model/user_model.dart';
import 'package:social_app/shared/components/constant.dart';

part 'social_state.dart';

class SocialCubit extends Cubit<SocialStates> {
  SocialCubit() : super(SocialInitialState());

  static SocialCubit get(context) => BlocProvider.of(context);

 UserModel? userModel;

  void getUserData() {
    emit(SocialGetUserLoadingState());

    FirebaseFirestore.instance
        .collection('users')
        .doc(uId)
        .get()
        .then((value) {
          userModel = UserModel.fromJson(value.data()!);
          emit(SocialGetUserSuccessState());
    })
        .catchError((error) {
          emit(SocialGetUserErrorState(error.toString(),),);
    });
  }
}
