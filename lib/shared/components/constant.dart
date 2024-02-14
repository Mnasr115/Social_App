import 'package:flutter/material.dart';

import '../network/local/Cache_helper.dart';

const kPrimaryColor = Colors.blue;
const kScaffoldBackGround = 'assets/images/background.png';

String? token = '';

void signOut(context) {
  CacheHelper.removeData(
    key: 'token',
  ).then((value) {
    if (value) {
      /*Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const LoginScreen(),
        ),
      );*/
    }
  });
}
