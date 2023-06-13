import 'package:flutter_movies_app/domain/domain.dart';

class ActorRepositoryImpl extends ActorRepository {
  final ActorDatasource datasource;

  ActorRepositoryImpl({required this.datasource});

  @override
  Future<List<Actor>> getActorsByMovie(String id) {
    return datasource.getActorsByMovie(id);
  }
}
