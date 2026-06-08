import 'package:first_project/depending_data/depending_colors.dart';
import 'package:first_project/function/hive_functions/log_functions/favorate.dart';
import 'package:first_project/function/hive_functions/log_functions/get_user_db.dart';
import 'package:first_project/function/hive_functions/log_functions/rating.dart';
import 'package:first_project/function/hive_functions/movie_add_functions/comment.dart';
import 'package:first_project/function/hive_functions/movie_add_functions/date_and_time.dart';
import 'package:first_project/function/hive_functions/movie_add_functions/get_movie.dart';
import 'package:first_project/function/pop_up.dart';
import 'package:first_project/main.dart';
import 'package:first_project/model/movie_model.dart';
import 'package:first_project/model/sign_up_model.dart';
import 'package:first_project/ui/splash_screen/welcome_page/Welcome_Page.dart';
import 'package:first_project/ui/splash_screen/welcome_page/sign_up/home/home_page.dart';
import 'package:first_project/widget/container_widget.dart';
import 'package:first_project/widget/text_button_widget.dart';
import 'package:first_project/widget/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'package:youtube_player_flutter/youtube_player_flutter.dart';

// ignore: must_be_immutable
class MovieDeteals extends StatelessWidget {
  MovieDeteals(
      {super.key, required this.id, required this.url, required this.userId});
  final String id;
  final String url;
  final String? userId;

  ValueNotifier<bool> isVisible = ValueNotifier<bool>(true);

  int currentIndex = 0;

  @override
  // ignore: override_on_non_overriding_member
  final TextEditingController controller = TextEditingController();
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

  // ignore: annotate_overrides
  Widget build(BuildContext context) {
    getMovie();
    final height = MediaQuery.of(context).size.height;
    final videoController = _initializeController(url);
    return Placeholder(
      child: Scaffold(
        backgroundColor: bagroundBlack,
        body: ValueListenableBuilder(
            valueListenable: usersDetails,
            builder: (context, user, child) {
              if (user.isEmpty) {
                return const Center(
                  child: TextWidget(text: 'No Data Available'),
                );
              }
              final usermodel = user.firstWhere(
                (element) => element.id == userId,
              );

              return ValueListenableBuilder(
                  valueListenable: movieDetailes,
                  builder: (context, value, child) {
                    if (value.isEmpty) {
                      return const Center(
                        child: TextWidget(text: 'No Data Available'),
                      );
                    }

                    final model = value.firstWhere(
                      (element) => element.id == id,
                    );
                    return CustomScrollView(
                      slivers: [
                        SliverAppBar(
                          expandedHeight: height * 0.24,
                          floating: true,
                          elevation: 0.1,
                          pinned: true,
                          backgroundColor: bagroundBlack,
                          leading: IconButtonWidget(
                            icon: Icons.arrow_back,color: constWeght,
                            function: () => popUp(context),
                          ),
                          flexibleSpace: FlexibleSpaceBar(
                            background: SafeArea(
                                child: ContainerWidget(
                              child: YoutubePlayer(
                                controller: videoController,
                                showVideoProgressIndicator: true,
                              ),
                            )),
                          ),
                        ),
                        SliverToBoxAdapter(
                          child: ValueListenableBuilder(
                            valueListenable: isVisible,
                            builder: (context, visible, child) {
                              return Visibility(
                                visible: visible,
                                child: MovieDteals(
                                    isVisible: isVisible,
                                    model: model,
                                    usermodel: usermodel,
                                    height: height,
                                    currentIndex: currentIndex),
                              );
                            },
                          ),
                        ),
                        SliverToBoxAdapter(
                            child: ValueListenableBuilder(
                          valueListenable: isVisible,
                          builder: (context, visible, child) {
                            return Visibility(
                                visible: !visible,
                                child: CommentWidget(
                                    controller: controller,
                                    movieModel: model,
                                    height: height,
                                    isVisible: isVisible,
                                    usermodel: usermodel));
                          },
                        ))
                      ],
                    );
                  });
            }),
      ),
    );
  }
}

class CommentWidget extends StatelessWidget {
  const CommentWidget(
      {super.key,
      required this.height,
      required this.isVisible,
      required this.usermodel,
      required this.movieModel,
      required this.controller});

  final double height;
  final ValueNotifier<bool> isVisible;
  final SignUpModel usermodel;
  final TextEditingController controller;
  final MovieModel movieModel;
  @override
  Widget build(BuildContext context) {
    return ContainerWidget(
      height: 0.7,
      // ignore: deprecated_member_use
      color: isDark.value?Colors.grey.withOpacity(0.15):Colors.grey.withOpacity(0.3),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  TextWidget(
                    text: 'Comments',
                    paddingH: height * 0.00003,
                    bold: FontWeight.w600,
                    size: height * 0.022,
                  ),
                  IconButtonWidget(
                    icon: Icons.close,
                    function: () {
                      isVisible.value = true;
                      // ignore: invalid_use_of_protected_member, invalid_use_of_visible_for_testing_member
                      isVisible.notifyListeners();
                    },
                  )
                ],
              ),
              const Divider(),
              movieModel.comment != null && movieModel.userId != null
                  ? Comment(movieModel: movieModel, height: height)
                  : const Center(
                      child: TextWidget(
                          text: 'NO Comment Yet! \tAdd Your Comment'),
                    )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              CircleAvatar(
                // ignore: sort_child_properties_last
                child: TextWidget(
                  text: usermodel.fullName[0].toUpperCase(),
                ),
                radius: height * 0.029,
              ),
              Flexible(
                  child: SizedBox(height: height*0.06,
                    child: TextFormFieldWidget(hint: 'Post Comment',hintColor: opendecityBlack,
                                    controller: controller,
                                    radius: height * 0.02,
                                    filled: true,
                                    filledColor: textWeight,textColor: textBlack,
                                    height: 0.06,
                                    width: 0.65,
                                  ),
                  )),
              IconButtonWidget(
                icon: Icons.send,
                size: height * 0.04,
                function: () => comment(),
              )
            ],
          )
        ],
      ),
    );
  }

  comment() {
    final comment = controller.text.trim();
    if (comment.isNotEmpty) {
      commentAdd(
          movieId: movieModel.id!, userId: usermodel.id!, comment: comment);
      controller.clear();
    }
  }
}

class Comment extends StatelessWidget {
  const Comment(
      {super.key, required this.movieModel, required this.height, this.leng});

  final MovieModel movieModel;
  final double height;
  final bool? leng;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: usersDetails,
      builder: (context, user, child) {
        return ValueListenableBuilder(
          valueListenable: movieDetailes,
          builder: (context, movie, child) {
            final moviData = movie.firstWhere(
              (element) => element.id == movieModel.id,
            );
            return ContainerWidget(
              // ignore: sort_child_properties_last
              child: ListView.builder(
                  itemCount: leng != null ? 1 : moviData.comment!.length,
                  itemBuilder: (context, index) {
                    SignUpModel signUpModel = user.firstWhere(
                      (element) => element.id == moviData.userId![index],
                    );
                    final commentMap = moviData.comment![index];
                    final commentText = commentMap['comment'] ?? '';
                    final timestamp = commentMap['timestamp'] ?? '';
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding:
                              EdgeInsets.symmetric(horizontal: height * 0.01),
                          child: Row(
                            spacing: height * 0.01,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              CircleAvatar(
                                child: TextWidget(
                                  text: signUpModel.fullName[0],
                                ),
                              ),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    TextNormalWidget(
                                      text: signUpModel.fullName,
                                      paddingH: 0.02,
                                      bold: FontWeight.w700,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    Row(
                                      children: [
                                        Expanded(
                                          child: SizedBox(
                                            width: height * 0.6,
                                            child: TextNormalWidget(
                                              overflow: TextOverflow.ellipsis,
                                              text: signUpModel.email,
                                              size: 11,
                                            ),
                                          ),
                                        ),
                                        TextWidget(
                                          text: formatDateOnly(timestamp),
                                          paddingH: 0.02,
                                          size: 11,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                        TextWidget(
                          text: commentText,
                          alignment: TextAlign.start,
                          paddingH: 0.08,
                          paddingV: 0.01,
                        ),
                        SizedBox(
                          height: height * 0.01,
                        )
                      ],
                    );
                  }),
              height: 0.555,
            );
          },
        );
      },
    );
  }
}

// ignore: must_be_immutable
class MovieDteals extends StatelessWidget {
  MovieDteals(
      {super.key,
      required this.model,
      required this.usermodel,
      required this.height,
      required this.currentIndex,
      required this.isVisible});

  final MovieModel model;
  final SignUpModel usermodel;
  final double height;
  final int currentIndex;
  ValueNotifier<bool> isVisible;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              flex: 3,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  child: ConstrainedBox(
                    constraints: BoxConstraints(maxWidth: height * 0.7),
                    child: TextNormalWidget(
                      alignment: TextAlign.start,
                      overflow: TextOverflow.ellipsis,
                      text: model.tittle,
                      size: 25,
                      bold: FontWeight.w800,
                      paddingH: 0.03,
                      paddingV: 0.01,
                    ),
                  ),
                ),
              ),
            ),
            FavorateWidget(
              model: usermodel,
              movieId: model.id!,
            ),
          ],
        ),
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Row(
            children: [
              TextButtons(
                height: height,
                text: model.genre,
              ),
              TextButtons(
                text: model.language,
                height: height,
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: RatingWidget(
              movieId: model.id!,
              height: height,
              currentIndex: currentIndex,
              model: usermodel,
            ),
          )
        ]),
        ContainerWidget(
          onTap: () {
            isVisible.value = false;
            // ignore: invalid_use_of_protected_member, invalid_use_of_visible_for_testing_member
            isVisible.notifyListeners();
          },
          height: 0.1,
          // ignore: deprecated_member_use
          color:isDark.value?Colors.grey.withOpacity(0.15):Colors.grey.withOpacity(0.3),
          paddingH: 0.01,
          paddingV: 0.01,
          radius: height * 0.02,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                children: [
                  const TextWidget(
                    text: 'comments',
                    bold: FontWeight.w700,
                    paddingH: 0.025,
                    paddingV: 0.005,
                  ),
                  TextWidget(
                      text: model.comment != null
                          ? '${model.comment!.length}'
                          : '0'),
                ],
              ),
              TextFormFieldWidget(
                  onTap: () {
                    isVisible.value = false;
                    // ignore: invalid_use_of_protected_member, invalid_use_of_visible_for_testing_member
                    isVisible.notifyListeners();
                  },
                  paddingH: 0.08,
                  readOnly: true,
                  hint: 'Add Comment',
                  height: 0.05,
                  radius: height * 0.01)
            ],
          ),
        ),
        TextWidget(
          text: 'Cast',
          paddingV: 0.007,
          paddingH: 0.02,
          size: height * 0.022,
          bold: FontWeight.w600,
        ),
        CastListWidget(model: model, height: height),
        TextWidget(
          text: 'Synopsis',
          bold: FontWeight.w600,
          size: height * 0.022,
          paddingV: 0.02,
          paddingH: 0.02,
        ),
        TextWidget(
          text: model.description,
          alignment: TextAlign.center,
          paddingH: 0.02,
        ),
        TextWidget(
          text: ' Movie Stills',
          bold: FontWeight.w600,
          size: height * 0.022,
          paddingV: 0.02,
          paddingH: 0.02,
        ),
        CarouselSliderWidget(model: model),
        TextWidget(
          text: 'Overview',
          bold: FontWeight.w600,
          size: height * 0.022,
          paddingV: 0.02,
          paddingH: 0.02,
        ),
        TextWidget(
          text: model.points,
          alignment: TextAlign.center,
          paddingH: 0.025,
        ),
        const Opacity(
            opacity: 0.2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 70,
                  width: double.infinity,
                ),
                ContainerWidget(
                  alignment: Alignment.center,
                  height: 0.2,
                  width: 0.35,
                  assetImage:
                      'assets/Screenshot_2024-12-28_142342-removebg-preview.png',
                ),
                SizedBox(
                  height: 70,
                )
              ],
            ))
      ],
    );
  }
}

class CarouselSliderWidget extends StatelessWidget {
   CarouselSliderWidget({
    super.key,
    required this.model,
  });

  final MovieModel model;
final PageController _controller = PageController();
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Column(
      children: [
        ContainerWidget(
          height: 0.4,
          child: PageView.builder(controller: _controller,
              itemCount: model.movieImages.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return ContainerWidget(
                  paddingH: height * 0.00002,
                  paddingV: 0.02,
                  radius: 15,
                  fileImage: model.movieImages[index],
                );
              }),
        ),  
      SmoothPageIndicator(
                controller:_controller ,
                count: model.movieImages.length, 
                effect:  WormEffect(
                  activeDotColor: textWeight,
                  dotColor: Colors.grey,
                  dotHeight: 10,
                  dotWidth: 10,
                ),
              ),],
    );
  }
}

class CastListWidget extends StatelessWidget {
  const CastListWidget({
    super.key,
    required this.model,
    required this.height,
  });

  final MovieModel model;
  final double height;

  @override
  Widget build(BuildContext context) {
    return ContainerWidget(
      height: 0.14,
      child: ListView.builder(
          itemCount: model.castImages.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            final names = model.castNames[index];
            final images = model.castImages[index];
            return ContainerWidget(
              height: 0.1,
              width: 0.22,
              paddingH: 0.005,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ContainerWidget(
                    fileImage: images,
                    height: 0.1,
                    radius: height,
                  ),
                  ConstrainedBox(
                      constraints: BoxConstraints(maxWidth: height * 0.6),
                      child: TextNormalWidget(
                        text: names,
                        overflow: TextOverflow.ellipsis,
                      ))
                ],
              ),
            );
          }),
    );
  }
}

class TittleRatingWidget extends StatelessWidget {
  const TittleRatingWidget({
    super.key,
    required this.model,
    required this.height,
  });

  final MovieModel model;
  final double height;

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [],
    );
  }
}

// ignore: must_be_immutable
class FavorateWidget extends StatelessWidget {
  const FavorateWidget({
    super.key,
    required this.model,
    required this.movieId,this.iconColor
  });

  final String movieId;
  final SignUpModel model;
  // ignore: prefer_typing_uninitialized_variables
  final iconColor;

  @override
  Widget build(BuildContext context) {
    // Safely get the favorite status
    final bool isFavorate = model.isFavorate[movieId] ?? false;

    return IconButtonWidget(
      icon: isFavorate ? Icons.favorite : Icons.favorite_border_outlined,
      color: isFavorate ? Colors.red[900] :iconColor?? textWeight,
      function: () {
        // Call the favorite toggle function
        favorate(model: model, movieid: movieId, context: context);
      },
    );
  }
}

// ignore: must_be_immutable
class RatingWidget extends StatefulWidget {
  RatingWidget(
      {super.key,
      required this.height,
      this.currentIndex,
      this.movieId,
      this.model});

  final double height;
  int? currentIndex;
  final String? movieId;
  SignUpModel? model;
  @override
  State<RatingWidget> createState() => _RatingWidgetState();
}

class _RatingWidgetState extends State<RatingWidget> {
  @override
  Widget build(BuildContext context) {
    getUserData();
    return Row(
      children: [
        ...List.generate(5, (index) {
          int movieRating = 0;
          if (widget.model != null) {
            movieRating = widget.model!.index[widget.movieId] ?? 0;
          }
          return SizedBox(
              width: widget.height * 0.035,
              child: IconButtonWidget(
                icon: movieRating > index
                    ? Icons.star
                    : Icons.star_border_outlined,
                color: movieRating > index ? Colors.amber : textWeight,
                function: () {
                  setState(() {
                    widget.currentIndex = index + 1;

                    rating(
                        indexValue: widget.currentIndex!,
                        model: widget.model!,
                        movieid: widget.movieId!);
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        backgroundColor: Colors.amberAccent,
                        content: TextWidget(
                            // ignore: unnecessary_brace_in_string_interps
                            text: 'Thank You FOr Rating${movieRating}')));
                  });
                },
              ));
        })
      ],
    );
  }
}

class TextButtons extends StatelessWidget {
  const TextButtons({super.key, required this.height, required this.text});

  final double height;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: height * 0.01),
      child: TextButtonWidget(
        text: text,
        // ignore: deprecated_member_use
        backgroundColor:Colors.grey.withOpacity(0.15),
        size: height * 0.015,
        bold: FontWeight.w500,
      ),
    );
  }
}
