import 'dart:io';

import 'package:flutter/material.dart';
import 'package:review_hub/depending_data/depending_colors.dart';
import 'package:review_hub/depending_data/navigations.dart';
import 'package:review_hub/function/hive_functions/log_functions/get_user_db.dart';
import 'package:review_hub/function/pop_up.dart';
import 'package:review_hub/ui/splash_screen/welcome_page/sign_up/home/drawer/account/edit_profile/edit_profile.dart';
import 'package:review_hub/ui/splash_screen/welcome_page/sign_up/home/drawer/favorate.dart/favorate.dart';
import 'package:review_hub/ui/splash_screen/welcome_page/sign_up/home/drawer/log_out/log_out.dart';
import 'package:review_hub/ui/splash_screen/welcome_page/sign_up/home/home_page.dart';
import 'package:review_hub/widget/container_widget.dart';
import 'package:review_hub/widget/text_widget.dart';


class AccountPage extends StatelessWidget {
  const AccountPage({super.key, required this.userId});
  final String userId;
  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> list = [
      {
        'text': "Edit Profile",
        'icon': Icons.edit,
        'dialog': EditProfile(
          userId: userId,
        )
      },
      {
        'text': 'Your Liked Items',
        'icon': Icons.favorite,
      },
      {'text': 'Log Out', 'icon': Icons.logout, 'dialog': LogOut(id: userId)}
    ];
    final screenSize = MediaQuery.sizeOf(context).height;
    return Scaffold(
        backgroundColor: bagroundBlack,
        body: ValueListenableBuilder(
            valueListenable: usersDetails,
            builder: (context, user, child) {
              
              final model = user.firstWhere((e) => e.id == userId);
              return CustomScrollView(
                slivers: [
                  SliverAppBar(
                    leading: IconButtonWidget(
                      icon: Icons.arrow_back,color: constWeght,
                      function: () => popUp(context),
                    ),
                    expandedHeight: screenSize * 0.42,
                    backgroundColor: bagroundBlack,
                    flexibleSpace: FlexibleSpaceBar(
                      background: Stack(children: [
                        const Column(
                          children: [
                            ContainerWidget(
                              alignment: Alignment.bottomCenter,
                              // ignore: sort_child_properties_last
                              child: Opacity(
                                opacity: 0.3,
                                child: ContainerWidget(
                                  assetImage:
                                      'assets/Screenshot_2024-12-28_142342-removebg-preview.png',
                                ),
                              ),
                              height: 0.34,
                              gredient1: true,
                              radiusBottom: Radius.circular(50),
                            )
                          ],
                        ),
                        Positioned.fill(
                            top: screenSize * 0.25,
                            child: Column(
                              children: [
                                Flexible(
                                  child: ContainerWidget(
                                    shape: true,
                                    color: opendecityBlack,
                                    radius: 20,
                                    height: 0.19,
                                    // ignore: sort_child_properties_last
                                    child: Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          ProfileWidget(image: model.image,),
                                          OverFlowWidget(
                                            screenSize: screenSize,
                                            text: model.fullName,
                                            size: 20,
                                            bold: FontWeight.w700,
                                          ),
                                          OverFlowWidget(
                                            screenSize: screenSize,
                                            text: model.email,
                                          ),
                                        ],
                                      ),
                                    ),
                                    width: 0.8,
                                  ),
                                ),
                              ],
                            ))
                      ]),
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(3, (index) {
                        return ContainerWidget(
                          onTap: () => list[index]['dialog'] != null
                              ? showDialog(
                                  context: context,
                                  builder: (context) => list[index]['dialog'],
                                )
                              : navigateFromBottomPush(
                                  context, FavoriteScreen(userId: model)),
                          paddingV: 0.02,
                          paddingH: 0.05,
                          radius: 15,
                          // ignore: sort_child_properties_last
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              spacing: 10,
                              children: [
                                CircleAvatar(
                                  // ignore: sort_child_properties_last
                                  child: Icon(
                                    list[index]['icon'],
                                    color: Colors.white70,
                                  ),
                                  backgroundColor:
                                      // ignore: deprecated_member_use
                                      Colors.black.withOpacity(0.5),
                                  radius: 30,
                                ),
                                TextWidget(text: list[index]['text'],color: Colors.white70,)
                              ],
                            ),
                          ),
                          height: 0.1,
                          gredient1: true,
                        );
                      }),
                    ),
                  )
                ],
              );
            }));
  }
}

class ProfileWidget extends StatelessWidget {
  const ProfileWidget({super.key, this.onTap, this.image});
  final Function()? onTap;
  final String? image;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (onTap != null) {
          onTap!();
        }
      },
      child: CircleAvatar(
        backgroundColor: Colors.grey[500],
        // ignore: sort_child_properties_last
        child:image==null? Icon(
          Icons.person,
          size: 50,
          color: Colors.grey[800],
        ):null,backgroundImage:image!=null? FileImage(File(image!)):null,
        radius: 40,
      ),
    );
  }
}

class OverFlowWidget extends StatelessWidget {
  const OverFlowWidget(
      {super.key,
      required this.screenSize,
      required this.text,this.alignment,
      this.bold,
      this.size});

  final double screenSize;
  final String text;
  final dynamic bold;
  final double? size;
  final TextAlign ? alignment;
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.sizeOf(context).height;
    return Expanded(
      flex: 3,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ConstrainedBox(
              constraints: BoxConstraints(maxWidth: screenSize * 0.7),
              child: TextNormalWidget(
                text: text,
                bold: bold,
                size: size,
                alignment:alignment ,
              )),
        ],
      ),
    );
  }
}
