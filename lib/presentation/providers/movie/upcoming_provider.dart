import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../domain/movie.dart';
import '../../../domain/result.dart';
import '../../../domain/usecase/get_movie_list/get_movie_list.dart';
import '../../../domain/usecase/get_movie_list/get_movie_param.dart';
import '../usecase/get_movie_list/get_movie_list.dart';

part 'upcoming_provider.g.dart';

@Riverpod(keepAlive: true)
class Upcoming extends _$Upcoming {
  @override
  FutureOr<List<Movie>> build() => const [];

  Future<void> getMovies({int page = 1}) async {
    state = const AsyncLoading();

    GetMovieList getMovieList = ref.read(getMovieListProvider);

    var result = await getMovieList(
        GetMovieListParam(movieCategory: MovieCategory.upcoming, page: page));

    switch (result) {
      case Success(value: final movieList):
        state = AsyncData(movieList);
      case Failed(message: _):
        state = const AsyncData([]);
    }
  }
}
