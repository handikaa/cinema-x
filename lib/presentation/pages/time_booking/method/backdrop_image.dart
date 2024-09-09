import 'package:flutter/material.dart';
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

Stack backdropimage(double maxWidth, BuildContext context,
    {required MovieDetail movieDetail}) {
  return Stack(
    children: [
      NetworkImageCard(
          width: maxWidth - 48,
          height: (maxWidth - 48) * 0.6,
          imageUrl:
              '${ApiConstant.baseUrlImage}${movieDetail.backdropPath ?? movieDetail.posterPath}',
          title: ''),
      SizedBox(
        width: maxWidth - 48,
        height: (maxWidth - 48) * 0.6,
        child: Align(
          alignment: Alignment.center,
          child: Container(
            width: 100,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white.withOpacity(0.7),
              border: Border.all(color: Colors.black, width: 2),
            ),
            child: IconButton(
                onPressed: () {
                  _dialogBuilder(context);
                },
                icon: const Icon(
                  Icons.play_arrow,
                  size: 50,
                  color: Colors.black,
                )),
          ),
        ),
      ),
    ],
  );
}
