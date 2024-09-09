import '../../../../domain/usecase/get_movie_list/get_movie_list.dart';
import '../../repositories/movie_repository/movie_repository_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'get_movie_list.g.dart';

@riverpod
GetMovieList getMovieList(GetMovieListRef ref) =>
    GetMovieList(movieRepositorie: ref.watch(movieRepositorieProvider));
