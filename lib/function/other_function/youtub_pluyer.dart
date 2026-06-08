import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';


inistateFunction({required videoController,required url}){
 if (url != null) {
      final videoId = YoutubePlayer.convertUrlToId(url!);
      if (videoId != null) {
        videoController = YoutubePlayerController(
          initialVideoId: videoId,
          flags: const YoutubePlayerFlags(
            autoPlay: false,
          ),
        );
      } else {
        // Handle invalid URL gracefully
        debugPrint("Invalid YouTube URL");
      }
    } else {
      debugPrint("No URL provided for the YouTube video");
    }
}