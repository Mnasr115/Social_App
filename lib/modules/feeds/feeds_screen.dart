import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:social_app/shared/components/constant.dart';
import 'package:social_app/shared/styles/styles.dart';

class FeedsScreen extends StatelessWidget {
  const FeedsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        children: [
          const Card(
            clipBehavior: Clip.antiAliasWithSaveLayer,
            elevation: 5,
            margin: EdgeInsets.all(8),
            child: Stack(
              alignment: AlignmentDirectional.bottomEnd,
              children: [
                Image(
                  image: AssetImage(kTestImage),
                  //fit: BoxFit.cover,
                  height: 200,
                  width: double.infinity,
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    'Communicate with friends',
                    style: Styles.textStyle18,
                  ),
                )
              ],
            ),
          ),
          ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) => buildPostItem(),
            separatorBuilder: (context, index) => const SizedBox(height: 8,),
            itemCount: 5,
          ),
          const SizedBox(
            height: 8,
          ),
        ],
      ),
    );
  }

  Widget buildPostItem() {
    return Card(
      clipBehavior: Clip.antiAliasWithSaveLayer,
      elevation: 5,
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
              padding: const EdgeInsets.only(bottom: 10.0, top: 10),
              child: Container(
                width: double.infinity,
                height: 1.0,
                color: Colors.grey[400],
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
                          child: Text(
                            '#software',
                            style: Styles.textStyle14
                                .copyWith(color: kPrimaryColor),
                          ),
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
                          child: Text(
                            '#software',
                            style: Styles.textStyle14
                                .copyWith(color: kPrimaryColor),
                          ),
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
                  //fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5.0),
              child: Row(
                children: [
                  Expanded(
                    child: InkWell(
                      child: const Padding(
                        padding: EdgeInsets.symmetric(vertical: 5.0),
                        child: Row(
                          children: [
                            Icon(Icons.favorite_outline, color: Colors.red),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              '120',
                              style: Styles.textStyle16,
                            )
                          ],
                        ),
                      ),
                      onTap: () {},
                    ),
                  ),
                  const Spacer(),
                  Expanded(
                    child: InkWell(
                      child: const Padding(
                        padding: EdgeInsets.symmetric(vertical: 5.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Icon(Icons.chat_bubble_outline),
                            SizedBox(
                              width: 3,
                            ),
                            Text(
                              '120 comment',
                            )
                          ],
                        ),
                      ),
                      onTap: () {},
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                bottom: 10.0,
              ),
              child: Container(
                width: double.infinity,
                height: 1.0,
                color: Colors.grey[400],
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: InkWell(
                    child: Row(
                      children: [
                        const CircleAvatar(
                          radius: 18,
                          child: Image(
                            image: AssetImage(kTestImage),
                          ),
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        Text(
                          'write a comment',
                          style: Styles.textStyle16.copyWith(
                            height: 1.4,
                          ),
                        ),
                      ],
                    ),
                    onTap: () {},
                  ),
                ),
                InkWell(
                  child: const Row(
                    children: [
                      Icon(Icons.favorite_outline, color: Colors.red),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        'Like',
                        style: Styles.textStyle16,
                      )
                    ],
                  ),
                  onTap: () {},
                ),
              ],
            ),

          ],
        ),
      ),
    );
  }
}
