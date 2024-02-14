import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_app/shared/cubit/modetheme_state.dart';
import 'package:social_app/shared/network/local/Cache_helper.dart';


class ModethemeCubit extends Cubit<ModethemeState> {
  ModethemeCubit() : super(ModethemeInitial());

  static ModethemeCubit get(context) => BlocProvider.of(context);
  bool isDark = true;

  void changeMode({bool? fromShared}) {
    if (fromShared != null) {
      isDark = fromShared;
      emit(NewsModeChange());
    } else {
      isDark = !isDark;
      CacheHelper.putData(key: 'isDark', value: isDark).then((value) {
        emit(NewsModeChange());
      });
    }
  }
}