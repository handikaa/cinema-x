import '../../../domain/movie_detail.dart';
import '../../../domain/result.dart';
import '../../../domain/usecase/get_movie_detail/get_movie_detail.dart';
import '../../../domain/usecase/get_movie_detail/get_movie_detail_param.dart';
import '../usecase/get_movie_detail/get_movie_detail_prvioder.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../domain/movie.dart';

part 'movie_detail_provider.g.dart';

@riverpod
Future<MovieDetail?> movieDetail(MovieDetailRef ref,
    {required Movie movie}) async {
  GetMovieDetail getMovieDetail = ref.read(getMovieDetailProvider);

  var result = await getMovieDetail(GetMovieDetailParam(movie: movie));

  return switch (result) {
    Success(value: final movieDetail) => movieDetail,
    Failed(message: _) => null,
  };
}
