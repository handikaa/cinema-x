import '../../../../domain/movie_detail.dart';
import '../../../extensions/format_runtime.dart';
import '../../../misc/method.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

List<Widget> movieShortInfo(
        {required AsyncValue<MovieDetail?> asycnMovieDetail,
        required BuildContext context}) =>
    [
      Column(
        children: [
          Row(
            children: [
              const Icon(
                Icons.watch_later,
              ),
              horizontalSpace(5),
              Text(asycnMovieDetail.valueOrNull != null
                  ? formatRuntime(asycnMovieDetail.valueOrNull?.runTime ?? 0)
                  : ''),
              // Text(asycnMovieDetail.when(
              //   data: (movieDetail) =>
              //       movieDetail != null ? formatRuntime(movieDetail.runTime) : '-',
              //   error: (error, stackTrace) => 'error',
              //   loading: () => 'Loading',
              // )),
            ],
          ),
          verticalSpace(10),
          Row(
            children: [
              const Icon(
                Icons.switch_video,
              ),
              horizontalSpace(5),
              Expanded(
                child: SizedBox(
                  child: asycnMovieDetail.when(
                    data: (movieDetail) {
                      String genre = movieDetail?.genres.join(', ') ?? '-';
                      return Text(
                        genre,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(fontSize: 12),
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
    ];
