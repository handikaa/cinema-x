import '../../../domain/actor.dart';
import '../../../domain/result.dart';
import '../../../domain/usecase/get_actor/get_actor.dart';
import '../../../domain/usecase/get_actor/get_actor_params.dart';
import '../usecase/get_actors/get_actors.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'actors_provider.g.dart';

@riverpod
Future<List<Actor>> actors(ActorsRef ref, {required int movieId}) async {
  GetActor getActor = ref.read(getActorProvider);

  var result = await getActor(GetActorParams(movieId: movieId));

  return switch (result) {
    Success(value: final listActors) => listActors,
    Failed(message: _) => [],
  };
}
