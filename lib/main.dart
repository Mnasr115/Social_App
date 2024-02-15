import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_app/layouts/cubit/social_cubit.dart';
import 'package:social_app/layouts/social_layout.dart';
import 'package:social_app/modules/Auth/login_screen/login_screen.dart';
import 'package:social_app/shared/components/constant.dart';
import 'package:social_app/shared/cubit/modetheme_cubit.dart';
import 'package:social_app/shared/cubit/modetheme_state.dart';
import 'package:social_app/shared/network/local/Cache_helper.dart';
import 'package:social_app/shared/network/remote/bloc_observer.dart';
import 'package:social_app/shared/network/remote/dio_helper.dart';
import 'package:social_app/shared/styles/themes.dart';
import 'firebase_options.dart';
import 'modules/onBoarding_screen/onBoarding_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  Bloc.observer = MyBlocObserver();
  DioHelper.init();
  await CacheHelper.init();

  Widget widget;
  bool? isDark = CacheHelper.getData(key: 'isDark');
  bool? onBoarding = CacheHelper.getData(key: 'onBoarding');
  uId = CacheHelper.getData(key: 'uId');

  if (onBoarding != null) {
    if (uId != null) {
      widget = const SocialLayout();
    } else {
      widget = const LoginScreen();
    }
  } else {
    widget = const OnBoardingScreen();
  }

  runApp(MyApp(
    isDark: isDark,
    startWidget: widget,
  ));
}

class MyApp extends StatelessWidget {
  Widget startWidget;
  bool? isDark;

  MyApp({
    super.key,
    required this.startWidget,
    this.isDark,
  });

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => SocialCubit()..getUserData(),
        ),
        BlocProvider(
          create: (context) => ModethemeCubit()
            ..changeMode(
              fromShared: isDark,
            ),
        ),
      ],
      child: BlocConsumer<ModethemeCubit, ModethemeState>(
        listener: (context, state) {},
        builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: lightTheme,
            darkTheme: darkTheme,
            themeMode: ModethemeCubit.get(context).isDark
                ? ThemeMode.dark
                : ThemeMode.light,
            home: startWidget,
          );
        },
      ),
    );
  }
}
