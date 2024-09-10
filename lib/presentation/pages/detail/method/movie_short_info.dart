import '../../../../domain/movie_detail.dart';
import '../../../extensions/format_runtime.dart';
import '../../../misc/method.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

List<Widget> movieShortInfo(
        {required AsyncValue<MovieDetail?> asycnMovieDetail,
        required ThemeData theme,
        required BuildContext context}) =>
    [
      Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.watch_later,
              ),
              horizontalSpace(5),
              Text(asycnMovieDetail.valueOrNull != null
                  ? formatRuntime(asycnMovieDetail.valueOrNull?.runTime ?? 0)
                  : ''),
              horizontalSpace(15),
              Container(
                width: 1,
                height: 20,
                color: theme.colorScheme.onPrimary,
              ),
              horizontalSpace(15),
              Row(
                children: [
                  const Icon(
                    Icons.star,
                    color: Colors.yellow,
                  ),
                  horizontalSpace(5),
                  Text(asycnMovieDetail.valueOrNull != null
                      ? '${asycnMovieDetail.valueOrNull?.voteAverage.toStringAsFixed(1)}'
                      : ''),
                ],
              ),
            ],
          ),
          verticalSpace(10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: SizedBox(
                  child: asycnMovieDetail.when(
                    data: (movieDetail) {
                      String genre = movieDetail?.genres.join(', ') ?? '-';
                      return Text(
                        genre,
                        maxLines: 2,
                        textAlign: TextAlign.center,
                        overflow: TextOverflow.ellipsis,
                      );
                    },
                    error: (error, stackTrace) => const Text('-'),
                    loading: () => const Text('-'),
                  ),
                ),
              ),
            ],
          ),
          verticalSpace(10),
        ],
      ),
    ];
