import 'package:flutter/material.dart';
import 'package:social_app/modules/Auth/login_screen/login_screen.dart';

import '../network/local/Cache_helper.dart';

const kPrimaryColor = Colors.blue;
const kScaffoldBackGround = 'assets/images/shopapp-logo.png';

String? uId = '';

const kTestImage = 'assets/images/—Pngtree—business man avatar_8855195.png';

void signOut(context) {
  CacheHelper.removeData(
    key: 'uId',
  ).then((value) {
    if (value) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const LoginScreen(),
        ),
      );
    }
  });
}


/*
email verification
if (!FirebaseAuth.instance.currentUser!.emailVerified)
                    Container(
                      color: Colors.amber.withOpacity(0.6),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                        ),
                        child: Row(
                          children: [
                            const Icon(
                              Icons.info_outline,
                            ),
                            const SizedBox(
                              width: 15,
                            ),
                            const Expanded(
                              child: Text(
                                'please verify your email',
                                style: TextStyle(
                                  fontSize: 18,
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 15,
                            ),
                            TextButton(
                              onPressed: () {
                                FirebaseAuth.instance.currentUser
                                    !.sendEmailVerification()
                                    .then((value) {
                                  showToast(
                                    text: 'check your mail',
                                    state: ToastStates.SUCCESS,
                                  );
                                }).catchError((error) {});
                              },
                              child: const Text(
                                'SEND',
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.blue,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),*/
