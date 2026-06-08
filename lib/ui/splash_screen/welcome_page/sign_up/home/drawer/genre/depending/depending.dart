import 'package:first_project/depending_data/depending_colors.dart';
import 'package:first_project/function/pop_up.dart';
import 'package:first_project/model/movie_model.dart';
import 'package:first_project/ui/splash_screen/welcome_page/sign_up/home/home_page.dart';
import 'package:first_project/widget/text_widget.dart';
import 'package:flutter/material.dart';


import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class GenreDraweScreenWidget extends StatelessWidget {
  // ignore: prefer_const_constructors_in_immutables
  GenreDraweScreenWidget({
    super.key,
    required this.userId,
    required this.genre,
    required this.gredientOne,
    required this.gredientThree,
    required this.gredientTwo,
    required this.icon,
    required this.color,
    required this.movieList,
  });

  final String userId;
  final String genre;
  final IconData icon;
  final Color gredientOne;
  final Color gredientTwo;
  final Color gredientThree;
  final Color color;
  final ValueNotifier<List<MovieModel>> movieList;

  YoutubePlayerController _initializeController(String videoUrl) {
    String? videoId = YoutubePlayer.convertUrlToId(videoUrl);
    return YoutubePlayerController(
      initialVideoId: videoId ?? '',
      flags: const YoutubePlayerFlags(
        autoPlay: false,
        isLive: false,
        startAt: 0,
        mute: false,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          leading: IconButtonWidget(
            icon: Icons.arrow_back,color:constWeght,
            function: () => popUp(context),
          ),
          backgroundColor: bagroundBlack,
          expandedHeight: 150,
          flexibleSpace: FlexibleSpaceBar(
            background: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    gredientOne,
                    gredientTwo,
                    gredientThree,
                  ],
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(30.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(icon, color: color, size: 35),
                    const SizedBox(width: 10),
                    TextWidget(
                      text: '$genre Movies',
                      color: color,
                      bold: FontWeight.w800,
                      size: 26,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        ValueListenableBuilder<List<MovieModel>>(
          valueListenable: movieList,
          builder: (context, value, child) {
            final model =
                value.where((element) => element.genre == genre).toList();

            if (model.isEmpty) {
              return SliverToBoxAdapter(
                child: SizedBox(
                  height: MediaQuery.of(context).size.height * 0.8,
                  child: const Center(
                    child: Text(
                      'No movies available',
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                  ),
                ),
              );
            }

            return SliverToBoxAdapter(
              child: SizedBox(
                height: MediaQuery.of(context).size.height * 0.8,
                child: PageView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: model.length,
                  itemBuilder: (context, index) {
                    final data = model[index];
                    final controller = _initializeController(data.link);

                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10.0),
                      child: Column(
                        children: [
                          Expanded(
                            child: YoutubePlayer(controller: controller),
                          ),
                          const SizedBox(height: 10),
                          TextWidget(
                            text: data.tittle,
                            color: textWeight,
                            bold: FontWeight.bold,
                            size: 18,
                          ),
                          const SizedBox(height: 5),
                          TextWidget(
                            text: 'Genre: ${data.genre}',
                            color: Colors.grey,
                            size: 14,
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
