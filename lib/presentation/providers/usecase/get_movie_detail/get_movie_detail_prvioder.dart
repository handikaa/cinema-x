import '../../../../domain/usecase/get_movie_detail/get_movie_detail.dart';
import '../../repositories/movie_repository/movie_repository_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'get_movie_detail_prvioder.g.dart';

@riverpod
GetMovieDetail getMovieDetail(GetMovieDetailRef ref) =>
    GetMovieDetail(movieRepositorie: ref.watch(movieRepositorieProvider));
