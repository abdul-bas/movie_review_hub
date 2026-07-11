import 'package:first_project/core/theme/app_colors.dart';
import 'package:first_project/model/movie_model.dart';
import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class MoviePage extends StatefulWidget {
  const MoviePage({super.key, required this.movie, required this.accentColor});

  final MovieModel movie;
  final Color accentColor;

  @override
  State<MoviePage> createState() => _MoviePageState();
}

class _MoviePageState extends State<MoviePage> {
  late final YoutubePlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = _buildController(widget.movie.link);
  }

  @override
  void dispose() {
    _controller.close();
    super.dispose();
  }

  YoutubePlayerController _buildController(String url) {
    final videoId = YoutubePlayerController.convertUrlToId(url);
    return YoutubePlayerController.fromVideoId(
      videoId: videoId ?? '',
      autoPlay: false,
      params: const YoutubePlayerParams(
        showControls: true,
        showFullscreenButton: true,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 0),
      child: Column(
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(AppColors.cardRadius),
              child: YoutubePlayer(controller: _controller),
            ),
          ),
          Container(
            color: AppColors.surface,
            padding: const EdgeInsets.fromLTRB(16, 14, 16, 16),
            child: Row(
              children: [
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                  decoration: BoxDecoration(
                    color: widget.accentColor.withValues(alpha: 0.15),
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      color: widget.accentColor.withValues(alpha: 0.4),
                    ),
                  ),
                  child: Text(
                    widget.movie.genre,
                    style: TextStyle(
                      color: widget.accentColor,
                      fontSize: 11,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 0.5,
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    widget.movie.tittle,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style:  TextStyle(
                      color: AppColors.onSurface,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8, bottom: 4),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children:  [
                Icon(Icons.keyboard_arrow_up_rounded,
                    color: AppColors.onSurfaceSubtle, size: 18),
                SizedBox(width: 4),
                Text(
                  'Swipe for next',
                  style: TextStyle(
                    color: AppColors.onSurfaceSubtle,
                    fontSize: 12,
                  ),
                ),
                SizedBox(width: 4),
                Icon(Icons.keyboard_arrow_down_rounded,
                    color: AppColors.onSurfaceSubtle, size: 18),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
