import 'package:first_project/depending_data/depending_colors.dart';
import 'package:first_project/depending_data/navigations.dart';
import 'package:first_project/function/hive_functions/log_functions/get_user_db.dart';
import 'package:first_project/function/hive_functions/movie_add_functions/get_movie.dart';
import 'package:first_project/function/pop_up.dart';
import 'package:first_project/model/sign_up_model.dart';
import 'package:first_project/ui/splash_screen/welcome_page/sign_up/home/drawer/account/account.dart';
import 'package:first_project/ui/splash_screen/welcome_page/sign_up/home/home_page.dart';
import 'package:first_project/ui/splash_screen/welcome_page/sign_up/home/pages/movie_deteals/movie_deteals.dart';
import 'package:first_project/widget/container_widget.dart';
import 'package:first_project/widget/text_widget.dart';
import 'package:flutter/material.dart';



class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key, required this.userId});
  final SignUpModel userId;

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.sizeOf(context).height;
    getMovie();
    getUserData();
    return Scaffold(
        backgroundColor: bagroundBlack,
        appBar: AppBar(
            backgroundColor: bagroundBlack,
            leading: IconButtonWidget(
              icon: Icons.arrow_back,
              function: () => popUp(context),
            ),
            title: const TextWidget(text: 'Favorite Movies')),
        body: ValueListenableBuilder(
          valueListenable: usersDetails,
          builder: (context, user, child) {
            final usrerModel = user.firstWhere(
              (element) => element.id == userId.id,
            );
            return ValueListenableBuilder(
              valueListenable: movieDetailes,
              builder: (context, movie, child) {
                final favorite = movie
                    .where(
                      (element) => usrerModel.isFavorate[element.id] == true,
                    )
                    .toList();
                if (favorite.isEmpty) {
                  return const Center(
                    child: TextWidget(text: 'favorite movies  not available'),
                  );
                }

                return Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 10.0, // Space between columns
                      mainAxisSpacing: 20.0, // Space between rows
                      childAspectRatio: 0.75,
                    ),
                    itemCount: favorite.length,
                    itemBuilder: (context, index) {
                      final data = favorite[index];
                      return ContainerWidget(height: 0.1,
                        child: Column(
                          children: [
                          
                            // ignore: sort_child_properties_last
                            ContainerWidget(child: FavorateWidget(model: usrerModel, movieId:data.id!, ),alignment: Alignment.topRight,onTap: () => navigateFromBottom(context, MovieDeteals(id: data.id!, url: data.link, userId: usrerModel.id)),
                              topRadius: const Radius.circular(15),
                              color: blue,
                              height: 0.21,
                              fileImage: data.movieImages[0],
                            ),
                            // ignore: sort_child_properties_last
                            ContainerWidget(onTap: () => navigateFromBottom(context, MovieDeteals(id: data.id!, url: data.link, userId: usrerModel.id)),
                              // ignore: deprecated_member_use
                              color: Colors.grey.withOpacity(0.1),
                              height: 0.065,
                              radiusBottom: const Radius.circular(15),
                              child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 10),
                              child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                                children: [OverFlowWidget(screenSize: screenSize, text: data.tittle), Row(spacing: 5,
                                children: [ const Icon(Icons.star,color: Colors.amber,size: 15,) ,
                                  TextWidget( text:'${data.rating}',color: Colors.amber,),
                                ],
                              ),const SizedBox(height: 8,)],),
                            ),
                            )
                          ],
                        ),
                      );
                    },
                  ),
                );
              },
            );
          },
        ));
  }
}
