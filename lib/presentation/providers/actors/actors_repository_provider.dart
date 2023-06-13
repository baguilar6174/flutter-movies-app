import 'package:flutter_movies_app/infraestructure/infraestructure.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// * Inmutable repository
final actorRepositoryProvider = Provider((ref) {
  return ActorRepositoryImpl(datasource: MovieDBActorsDatasourceImpl());
});
