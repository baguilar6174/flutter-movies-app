import 'package:flutter_movies_app/domain/entities/entities.dart';

abstract class ActorDatasource {
  Future<List<Actor>> getActorsByMovie(String id);
}
