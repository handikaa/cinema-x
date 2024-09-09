import 'get_actor_params.dart';
import '../usecase.dart';

import '../../../data/repositories/movie_repositorie.dart';
import '../../actor.dart';
import '../../result.dart';

class GetActor implements Usecase<Result<List<Actor>>, GetActorParams> {
  final MovieRepositorie _movieRepositorie;

  GetActor({required MovieRepositorie movieRepositorie})
      : _movieRepositorie = movieRepositorie;
  @override
  Future<Result<List<Actor>>> call(GetActorParams params) async {
    final result = await _movieRepositorie.getActors(id: params.movieId);

    return switch (result) {
      Success(value: final result) => Result.success(result),
      Failed(:final message) => Result.failed(message),
    };
  }
}
