import '../../../../data/repositories/movie_repositorie.dart';
import '../../../../data/tmdb/tmdb_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'movie_repository_provider.g.dart';

@riverpod
MovieRepositorie movieRepositorie(MovieRepositorieRef ref) => TmdbRepository();
