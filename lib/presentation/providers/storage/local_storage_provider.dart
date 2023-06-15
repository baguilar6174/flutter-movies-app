import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:flutter_movies_app/infraestructure/infraestructure.dart';

final localStorageRepositoryProvider = Provider((ref) {
  return LocalStorageRepositoryImpl(datasource: IsarDatasourceImpl());
});
