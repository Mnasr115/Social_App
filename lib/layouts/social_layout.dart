import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_app/layouts/cubit/social_cubit.dart';
import 'package:social_app/modules/new_post/new_post_screen.dart';
import 'package:social_app/shared/components/components.dart';
import 'package:social_app/shared/components/constant.dart';

class SocialLayout extends StatelessWidget {
  const SocialLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SocialCubit, SocialStates>(
      listener: (context, state) {
        if (state is SocialNewPostState) {
          navigateTo(
            context,
            const NewPostScreen(),
          );
        }
      },
      builder: (context, state) {
        var cubit = SocialCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            title: Text(cubit.titles[cubit.currentIndex]),
            actions: [
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.notifications_outlined,
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.search_outlined,
                ),
              ),
            ],
          ),
          body: cubit.screens[cubit.currentIndex],
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: cubit.currentIndex,
            type: BottomNavigationBarType.fixed,
            onTap: (int index) {
              cubit.changeBottemNav(index);
            },
            items: [
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
                  Icons.upload_outlined,
                ),
                label: 'Post',
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
            ],
          ),
        );
      },
    );
  }
}
