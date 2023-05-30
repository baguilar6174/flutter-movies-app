import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:flutter_movies_app/infraestructure/infraestructure.dart';

// * Inmutable repository
final movieRepositoryProvider = Provider((ref) {
  return MovieRepositoryImpl(datasource: MovieDBDatasourceImpl());
});
