import '../../../../domain/usecase/get_actor/get_actor.dart';
import '../../repositories/movie_repository/movie_repository_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'get_actors.g.dart';

@riverpod
GetActor getActor(GetActorRef ref) =>
    GetActor(movieRepositorie: ref.watch(movieRepositorieProvider));
