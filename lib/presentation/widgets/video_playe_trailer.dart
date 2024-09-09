import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class VideoPlayeTrailer extends StatefulWidget {
  const VideoPlayeTrailer({super.key});

  @override
  State<VideoPlayeTrailer> createState() => _VideoPlayeTrailerState();
}

class _VideoPlayeTrailerState extends State<VideoPlayeTrailer> {
  final String urlId = 'aKk5x-QZ36c';
  final YoutubePlayerController _controller = YoutubePlayerController(
    initialVideoId: 'aKk5x-QZ36c',
    flags: const YoutubePlayerFlags(
      autoPlay: true,
      mute: false,
      loop: false,
    ),
  );

  @override
  Widget build(BuildContext context) {
    return YoutubePlayer(
      controller: _controller,
      showVideoProgressIndicator: true,
      progressIndicatorColor: Colors.red,
      progressColors: const ProgressBarColors(
        playedColor: Colors.red,
        handleColor: Colors.redAccent,
      ),
    );
  }
}
