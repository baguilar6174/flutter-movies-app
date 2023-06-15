import 'package:flutter_movies_app/domain/entities/entities.dart';

abstract class ActorRepository {
  Future<List<Actor>> getActorsByMovie(String id);
}
