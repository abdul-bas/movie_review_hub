import 'package:first_project/depending_data/depending_colors.dart';
import 'package:first_project/depending_data/navigations.dart';
import 'package:first_project/file_structure/ui/common/icon_button.dart';
import 'package:first_project/function/hive_functions/log_functions/get_user_db.dart';
import 'package:first_project/function/hive_functions/movie_add_functions/get_movie.dart';
import 'package:first_project/model/movie_model.dart';
import 'package:first_project/model/sign_up_model.dart';
import 'package:first_project/file_structure/ui/home/home_page.dart';
import 'package:first_project/ui/splash_screen/welcome_page/sign_up/home/pages/movie_deteals/movie_deteals.dart';
import 'package:first_project/widget/container_widget.dart';
import 'package:first_project/widget/text_widget.dart';
import 'package:flutter/material.dart';


class Horror extends StatelessWidget {
  const Horror({super.key, required this.userId});
  final String userId;
  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    final screenSize = MediaQuery.sizeOf(context).height;

    return GenreWidget(
      userId: userId,
      color: red,
      genre: 'Horror',
      icon: Icons.psychology,
    );
  }
}

class GenreWidget extends StatelessWidget {
  const GenreWidget(
      {super.key,
      required this.genre,
      required this.icon,
      required this.color,
      required this.userId});
  final String genre;
  final IconData icon;
  final dynamic color;
  final String userId;

  @override
  Widget build(BuildContext context) {
    getUserData();
    final screenSize = MediaQuery.sizeOf(context).height;

    return ValueListenableBuilder(
      valueListenable:
          movieDetailes, // Assuming movieDetails is a ValueNotifier<List<MovieModel>>
      builder: (context, value, child) {
        if (value.isEmpty) {
          return const Center(
            child: TextWidget(
              text: 'Movies Are Not Available',
              color: Colors.white,
              size: 18,
              bold: FontWeight.bold,
            ),
          );
        }
        final model = value
            .where(
              (element) => element.genre == genre,
            )
            .toList();
        if (model.isEmpty) {
          return Center(
            child: Text(
              'No $genre Movies Found',
              style: const TextStyle(color: Colors.white, fontSize: 18),
            ),
          );
        }
        return SingleChildScrollView(
          child: Column(
            children: List.generate(
              model.length,
              (index) {
                final data = model[index];
                return ValueListenableBuilder(
                  valueListenable: usersDetails,
                  builder: (context, user, child) {
                    if (user.isEmpty) {
                      return const SizedBox.shrink();
                    }
                    final userModel = user.firstWhere(
                      (element) => element.id == userId,
                    );
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Card(
                        color: Colors.grey[900],
                        child: Column(
                          children: [
                            ContainerWidget(
                              fileImage: data.movieImages[0],
                              height: 0.25,
                              topRadius: const Radius.circular(15),
                              child: IconButtonWidget(
                                function: () => navigateFromCenter(
                                  context: context,
                                  navigation: MovieDeteals(
                                    id: data.id!,
                                    userId: userId,
                                    url: data.link,
                                  ),
                                ),
                                icon: Icons.play_circle_outline,
                                size: 50,color: constWeght,
                              ),
                            ),
                            BottomPagesWidget(
                                screenSize: screenSize,
                                data: data,
                                userModel: userModel),
                          ],
                        ),
                      ),
                    );
                  }
                );
              },
            ),
          ),
        );
      },
    );
  }
}

class BottomPagesWidget extends StatelessWidget {
  const BottomPagesWidget({
    super.key,
    required this.screenSize,
    required this.data,
    required this.userModel,
  });

  final double screenSize;
  final MovieModel data;
  final SignUpModel userModel;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ConstrainedBox(
                    constraints: BoxConstraints(maxWidth: screenSize * 0.6),
                    child: TextNormalWidget(
                      text: data.tittle,color: constWeght,
                      overflow: TextOverflow.ellipsis,
                      bold: FontWeight.w800,
                      size: 20,
                      alignment: TextAlign.start,
                    )),
                Row(
                  spacing: 10,
                  children: [
                    const Icon(
                      Icons.star,
                      color: Colors.amber,
                      size: 20,
                    ),
                    TextWidget(
                      text: '${data.rating}',
                      color: Colors.amber,
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
        FavorateWidget(model: userModel,movieId: data.id!,iconColor: constWeght,)
      ],
    );
  }
}
