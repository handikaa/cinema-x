import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../../../../data/dio_client/api_constant.dart';
import '../../../../domain/movie_detail.dart';
import '../../../widgets/network_image_card.dart';

Future<void> _dialogBuilder(BuildContext context) {
  double maxWidth = MediaQuery.of(context).size.width;

  final YoutubePlayerController controller = YoutubePlayerController(
    initialVideoId: 'aKk5x-QZ36c',
    flags: const YoutubePlayerFlags(
      autoPlay: true,
      mute: false,
      loop: false,
    ),
  );
  return showDialog<void>(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        contentPadding: const EdgeInsets.all(0),
        content: SizedBox(
          width: maxWidth - 48,
          height: (maxWidth - 48) * 0.6,
          child: YoutubePlayer(
            controller: controller,
            showVideoProgressIndicator: true,
            progressIndicatorColor: Colors.red,
            progressColors: const ProgressBarColors(
              playedColor: Colors.red,
              handleColor: Colors.redAccent,
            ),
          ),
        ),
      );
    },
  );
}

Widget backDropImage(double maxWidth, AsyncValue<MovieDetail?> asyncMovieDetail,
    BuildContext context) {
  return NetworkImageCard(
      height: maxWidth,
      width: (maxWidth - 50) * 0.7,
      imageUrl: asyncMovieDetail.valueOrNull != null
          ? '${ApiConstant.baseUrlImage}${asyncMovieDetail.value!.posterPath ?? asyncMovieDetail.value!.backdropPath}'
          : null,
      title: '');
}
