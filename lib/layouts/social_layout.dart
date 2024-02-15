import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_app/layouts/cubit/social_cubit.dart';
import 'package:social_app/shared/components/components.dart';
import 'package:social_app/shared/components/constant.dart';

class SocialLayout extends StatelessWidget {
  const SocialLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SocialCubit, SocialStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('News Feed'),
          ),
          body: ConditionalBuilder(
            condition: true,//SocialCubit.get(context).userModel != null,
            builder: (context) {
              var model = SocialCubit.get(context);
              return Column(
                children: [
                  //if (!model.userModel!.isEmailVerified!)
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
                    ),
                ],
              );
            },
            fallback: (context) => const Center(
              child: CircularProgressIndicator(),
            ),
          ),
        );
      },
    );
  }
}
