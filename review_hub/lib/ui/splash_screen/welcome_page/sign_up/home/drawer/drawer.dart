import 'package:flutter/material.dart';
import 'package:review_hub/depending_data/depending_colors.dart';
import 'package:review_hub/depending_data/navigations.dart';
import 'package:review_hub/function/hive_functions/log_functions/get_user_db.dart';
import 'package:review_hub/function/pop_up.dart';
import 'package:review_hub/model/sign_up_model.dart';
import 'package:review_hub/ui/splash_screen/welcome_page/sign_up/home/drawer/account/account.dart';
import 'package:review_hub/ui/splash_screen/welcome_page/sign_up/home/drawer/control_panel/validation.dart';
import 'package:review_hub/ui/splash_screen/welcome_page/sign_up/home/drawer/depending_widgets/profile.dart';
import 'package:review_hub/ui/splash_screen/welcome_page/sign_up/home/drawer/favorate.dart/favorate.dart';
import 'package:review_hub/ui/splash_screen/welcome_page/sign_up/home/drawer/genre/Action.dart';
import 'package:review_hub/ui/splash_screen/welcome_page/sign_up/home/drawer/genre/Comedy.dart';
import 'package:review_hub/ui/splash_screen/welcome_page/sign_up/home/drawer/genre/Fantecy.dart';
import 'package:review_hub/ui/splash_screen/welcome_page/sign_up/home/drawer/genre/Horror.dart';
import 'package:review_hub/ui/splash_screen/welcome_page/sign_up/home/drawer/genre/Thriller.dart';
import 'package:review_hub/ui/splash_screen/welcome_page/sign_up/home/drawer/log_out/log_out.dart';
import 'package:review_hub/ui/splash_screen/welcome_page/sign_up/home/drawer/settings/settings.dart';
import 'package:review_hub/widget/container_widget.dart';
import 'package:review_hub/widget/text_widget.dart';

import 'control_panel/movie_add/depending_widgets/text_button_icon.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({super.key, required this.id});
  final String id;
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    getUserData();
    return Drawer(
        backgroundColor: bagroundBlack,
        child: ValueListenableBuilder(
            valueListenable: usersDetails,
            builder: (context, user, child) {

              if (user.isEmpty) {
                return  const Center(
                  child: TextWidget(text: 'movies are not available')
                );
              }
              final SignUpModel currentModel = user.firstWhere(
                (element) => element.id == id,
              );
              return ContainerWidget(
                  height: 0.1,
               
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Flexible(
                          child:
                              SafeArea(
                                child: SizedBox(height: width*0.38,width: double.infinity,
                                  child: ProfileWidgetWidget(currentModel: currentModel)),
                              )),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 15.0),
                        child: Divider(),
                      ),
                      TextButtonIconWidget(
                        label: 'Home',
                        icon: Icons.home,
                        function:()=> popUp(context),
                      ),
                       TextButtonIconWidget(
                        label: 'Account',function: () => navigateFromSde(context, AccountPage(userId: currentModel.id!,)),
                        icon: Icons.account_circle,
                      ),
                       TextButtonIconWidget(
                        label: 'Favorate',function:() =>navigateFromSde(context, FavoriteScreen(userId: currentModel,))  ,
                        icon: Icons.favorite,
                      ),
                      const TextWidget(
                        text: 'Movie Categories',
                        size: 20,
                        paddingH: 0.02,
                        bold: FontWeight.w900,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: width * 0.05),
                        child:  Column(
                          children: [
                            TextButtonIconWidget(
                              label: 'Comedy',function: () => navigateFromSde(context,ComedyScreen(userId: id) ),
                              
                            ),
                            TextButtonIconWidget(
                              label: 'Horror',function: () => navigateFromSde(context,HorrorScreen(userId: id) ),
                              
                            ),
                            TextButtonIconWidget(
                              label: 'Thriller',function: () => navigateFromSde(context,ThrillerScreen(userId: id) ),
                             
                            ),
                            TextButtonIconWidget(
                              label: 'Fantecy',function: () => navigateFromSde(context,FantecyScreen(userId: id) ),
                              
                            ),
                            TextButtonIconWidget(
                              label: 'Action',function: () => navigateFromSde(context, ActionPage(userId: id)),
                              
                            ),
                          ],
                        ),
                      ),
                       TextButtonIconWidget(
                        label: 'Settings',function: () => navigateFromSde(context, SettingsMenu()),
                        icon: Icons.settings,
                      ),
                      TextButtonIconWidget(function: ()=>navigateFromSde(context,Validation(userId: id)),
                        label: 'Control Panel',
                        icon: Icons.admin_panel_settings,
                        color: Colors.lightBlue[900],
                      ),
                      TextButtonIconWidget(
                        function:()=>showAdaptiveDialog(context: context, builder: (context) => LogOut(id: id,),),
                        label: 'Log Out',
                        icon: Icons.logout,
                        color: Colors.red[900],
                      ),
                    ],
                  ));
            }));
  }
}

