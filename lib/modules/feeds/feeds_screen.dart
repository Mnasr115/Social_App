import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:social_app/shared/components/constant.dart';
import 'package:social_app/shared/styles/styles.dart';

class FeedsScreen extends StatelessWidget {
  const FeedsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Card(
            clipBehavior: Clip.antiAliasWithSaveLayer,
            elevation: 10,
            margin: const EdgeInsets.all(8),
            child: Stack(
              alignment: AlignmentDirectional.bottomEnd,
              children: [
                const Image(
                  image: AssetImage(kTestImage),
                  fit: BoxFit.cover,
                  height: 200,
                  width: double.infinity,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Communicate with friends',
                    style: Styles.textStyle18.copyWith(color: Colors.white),
                  ),
                )
              ],
            ),
          ),
          Card(
            clipBehavior: Clip.antiAliasWithSaveLayer,
            elevation: 10,
            margin: const EdgeInsets.symmetric(horizontal: 8),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                  Row(
                    children: [
                      const CircleAvatar(
                        radius: 25,
                        child: Image(
                          image: AssetImage(kTestImage),
                        ),
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text(
                                  'Mahmoud Nasr',
                                  style: Styles.textStyle18.copyWith(
                                    height: 1.4,
                                  ),
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                const Icon(
                                  Icons.verified,
                                  color: kPrimaryColor,
                                  size: 18,
                                ),
                              ],
                            ),
                            Text(
                              'January 21, 2024 at 11:00 pm',
                              style: Styles.textStyle14.copyWith(
                                color: Colors.grey[700],
                                height: 1.4,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.more_horiz_outlined,
                          size: 16,
                        ),
                      )
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 15.0),
                    child: Container(
                      width: double.infinity,
                      height: 1.0,
                      color: Colors.grey[300],
                    ),
                  ),
                  Text(
                    'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book',
                    style: Styles.textStyle16.copyWith(
                      height: 1.3,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      bottom: 10,
                      top: 5,
                    ),
                    child: SizedBox(
                      width: double.infinity,
                      child: Wrap(
                        children: [
                          Padding(
                            padding: const EdgeInsetsDirectional.only(
                              end: 6,
                            ),
                            child: SizedBox(
                              height: 25,
                              child: MaterialButton(
                                padding: EdgeInsets.zero,
                                minWidth: 1.0,
                                onPressed: () {},
                                child: Text('#software',
                                style: Styles.textStyle14.copyWith(
                                  color: kPrimaryColor
                                ),),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsetsDirectional.only(
                              end: 6,
                            ),
                            child: SizedBox(
                              height: 25,
                              child: MaterialButton(
                                padding: EdgeInsets.zero,
                                minWidth: 1.0,
                                onPressed: () {},
                                child: Text('#software',
                                  style: Styles.textStyle14.copyWith(
                                      color: kPrimaryColor
                                  ),),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    height: 140,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      image: const DecorationImage(
                        image: AssetImage(kTestImage),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),

                  const Row(
                    children: [
                     Row(
                       children: [
                         Icon(Icons.heart_broken_sharp,
                             color: Colors.red),
                         SizedBox(
                           width: 5,
                         ),
                         Text('120',
                         style: Styles.textStyle16,)
                       ],
                     ),
                      Spacer(),
                      Row(
                        children: [
                          Icon(Icons.comment_outlined),
                          SizedBox(
                            width: 5,
                          ),
                          Text('1200')
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
