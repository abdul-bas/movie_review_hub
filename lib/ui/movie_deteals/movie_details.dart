import 'package:first_project/core/theme/app_colors.dart';
import 'package:first_project/ui/movie_details/widgets/comment_widget/comment_widget.dart';
import 'package:first_project/ui/movie_details/widgets/movie_details/movie_details.dart';
import 'package:first_project/core/database/auth/get_user_db.dart';
import 'package:first_project/core/database/movie_oprations/get_movie.dart';
import 'package:first_project/routes/pop_up.dart';
import 'package:first_project/ui/common/container_widget.dart';
import 'package:first_project/ui/common/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class MovieDetailsScreen extends StatefulWidget {
  const MovieDetailsScreen({
    super.key,
    required this.id,
    required this.url,
    required this.userId,
  });

  final String id;
  final String url;
  final String? userId;

  @override
  State<MovieDetailsScreen> createState() => _MovieDetailsScreenState();
}

class _MovieDetailsScreenState extends State<MovieDetailsScreen> {
  final ValueNotifier<bool> isVisible = ValueNotifier<bool>(true);
  final TextEditingController commentController = TextEditingController();
  int currentIndex = 0;

  late final YoutubePlayerController _videoController;

  @override
  void initState() {
    super.initState();
    final videoId = YoutubePlayerController.convertUrlToId(widget.url);
    _videoController = YoutubePlayerController.fromVideoId(
      videoId: videoId ?? '',
      autoPlay: false,
      params: const YoutubePlayerParams(
        showControls: true,
        showFullscreenButton: true,
      ),
    );

    // Side-effect fetches belong here, not in build().
    WidgetsBinding.instance.addPostFrameCallback((_) {
      getMovie();
      getUserData();
    });
  }

  @override
  void dispose() {
    isVisible.dispose();
    commentController.dispose();
    _videoController.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: AppColors.background,
      body: ValueListenableBuilder(
        valueListenable: usersDetails,
        builder: (context, user, child) {
          if (user.isEmpty) {
            return const Center(
              child: TextWidget(text: 'No Data Available'),
            );
          }

          final usermodel = user.firstWhere(
            (element) => element.id == widget.userId,
            orElse: () => user.first,
          );

          return ValueListenableBuilder(
            valueListenable: movieDetailes,
            builder: (context, value, child) {
              if (value.isEmpty) {
                return const Center(
                  child: TextWidget(text: 'No Data Available'),
                );
              }

              final matches = value.where((e) => e.id == widget.id);
              if (matches.isEmpty) {
                return const Center(
                  child: TextWidget(text: 'Movie not found'),
                );
              }
              final model = matches.first;

              return CustomScrollView(
                slivers: [
                  SliverAppBar(
                    expandedHeight: height * 0.26,
                    pinned: true,
                    elevation: 0,
                    backgroundColor: AppColors.background,
                    leading: Padding(
                      padding: const EdgeInsets.only(left: 4),
                      child: IconButton(
                        icon: Icon(Icons.arrow_back_ios_new_rounded),
                        color: AppColors.onSurface,
                        onPressed: () => popUp(context),
                      ),
                    ),
                    flexibleSpace: FlexibleSpaceBar(
                      background: ClipRRect(
                        borderRadius: const BorderRadius.vertical(
                          bottom: Radius.circular(AppColors.cardRadius),
                        ),
                        child: SafeArea(
                          bottom: false,
                          child: ContainerWidget(
                            child: YoutubePlayer(controller: _videoController),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: ValueListenableBuilder(
                      valueListenable: isVisible,
                      builder: (context, visible, child) {
                        return Visibility(
                          visible: visible,
                          maintainState: true,
                          child: MovieDetails(
                            isVisible: isVisible,
                            model: model,
                            usermodel: usermodel,
                            height: height,
                            currentIndex: currentIndex,
                            onRatingChanged: (i) =>
                                setState(() => currentIndex = i),
                          ),
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
                          maintainState: true,
                          child: CommentWidget(
                            controller: commentController,
                            movieModel: model,
                            height: height,
                            isVisible: isVisible,
                            usermodel: usermodel,
                          ),
                        );
                      },
                    ),
                  ),
                ],
              );
            },
          );
        },
      ),
    );
  }
}
