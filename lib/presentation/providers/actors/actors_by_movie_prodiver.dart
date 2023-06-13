import 'package:flutter_movies_app/presentation/providers/providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:flutter_movies_app/domain/domain.dart';

final actorsByMovieProvider =
    StateNotifierProvider<ActorsByMovieNotifier, Map<String, List<Actor>>>(
        (ref) {
  final actorRepository = ref.watch(actorRepositoryProvider);
  return ActorsByMovieNotifier(getActors: actorRepository.getActorsByMovie);
});

typedef GetActorsCallback = Future<List<Actor>> Function(String id);

class ActorsByMovieNotifier extends StateNotifier<Map<String, List<Actor>>> {
  final GetActorsCallback getActors;

  ActorsByMovieNotifier({required this.getActors}) : super({});

  Future<void> loadActors(String id) async {
    if (state[id] != null) return;
    final List<Actor> actors = await getActors(id);
    state = {...state, id: actors};
  }
}
