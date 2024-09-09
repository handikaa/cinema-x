import '../../../data/repositories/movie_repositorie.dart';
import '../../movie_detail.dart';
import 'get_movie_detail_param.dart';
import '../usecase.dart';

import '../../result.dart';

class GetMovieDetail
    implements Usecase<Result<MovieDetail>, GetMovieDetailParam> {
  final MovieRepositorie _movieRepositorie;

  GetMovieDetail({required MovieRepositorie movieRepositorie})
      : _movieRepositorie = movieRepositorie;

  @override
  Future<Result<MovieDetail>> call(GetMovieDetailParam params) async {
    final movieDetail =
        await _movieRepositorie.getMovieDetail(id: params.movie.id);

    if (movieDetail.isSuccess) {
      return Result.success(movieDetail.resultValue!);
    } else {
      return Result.failed(movieDetail.errorMessage!);
    }
  }
}
