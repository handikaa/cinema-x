import 'package:dio/dio.dart';
import '../../domain/actor.dart';
import '../../domain/movie.dart';
import '../../domain/movie_detail.dart';
import '../../domain/result.dart';
import '../di/inject_container.dart';
import '../repositories/movie_repositorie.dart';

class TmdbRepository implements MovieRepositorie {
  final Dio? _dio;

  TmdbRepository({Dio? dio}) : _dio = dio ?? inject<Dio>();

  @override
  Future<Result<List<Actor>>> getActors({required int id}) async {
    try {
      final response = await _dio!.get('/$id/credits?language=en-US"');
      final result = List<Map<String, dynamic>>.from(response.data['cast']);
      return Result.success(result.map((e) => Actor.fromJSON(e)).toList());
    } on DioException catch (e) {
      return Result.failed(e.message!);
    }
  }

  @override
  Future<Result<MovieDetail>> getMovieDetail({required int id}) async {
    try {
      final response = await _dio!.get('/$id?language=en-US');

      return Result.success(MovieDetail.fromJSON(response.data));
    } on DioException catch (e) {
      return Result.failed(e.message!);
    }
  }

  @override
  Future<Result<List<Movie>>> getNowPlaying({int page = 1}) =>
      _getMovies(_MovieCategory.nowplaying.toString(), page: page);

  @override
  Future<Result<List<Movie>>> getUpComing({int page = 1}) =>
      _getMovies(_MovieCategory.upcoming.toString(), page: page);

  Future<Result<List<Movie>>> _getMovies(String category,
      {int page = 1}) async {
    try {
      final response = await _dio!.get('/$category?page=$page&language=en-US');

      final result = List<Map<String, dynamic>>.from(response.data['results']);

      return Result.success(result.map((e) => Movie.fromJSON(e)).toList());
    } on DioException catch (e) {
      return Result.failed(e.message!);
    }
  }
}

enum _MovieCategory {
  nowplaying('now_playing'),
  upcoming('upcoming');

  final String _instring;

  const _MovieCategory(String instring) : _instring = instring;

  @override
  String toString() => _instring;
}
