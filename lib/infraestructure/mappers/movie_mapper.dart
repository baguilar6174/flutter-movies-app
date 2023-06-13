import 'package:flutter_movies_app/domain/domain.dart';
import 'package:flutter_movies_app/infraestructure/infraestructure.dart';

class MovieMapper {
  static Movie movieDBToEntity(MovieFromMovieDB movieFromMovieDB) => Movie(
        adult: movieFromMovieDB.adult,
        backdropPath: movieFromMovieDB.backdropPath != ''
            ? 'https://image.tmdb.org/t/p/w500${movieFromMovieDB.backdropPath}'
            : 'https://sd.keepcalms.com/i/keep-calm-poster-not-found.png',
        genreIds: movieFromMovieDB.genreIds.map((id) => id.toString()).toList(),
        id: movieFromMovieDB.id,
        originalLanguage: movieFromMovieDB.originalLanguage,
        originalTitle: movieFromMovieDB.originalTitle,
        overview: movieFromMovieDB.overview,
        popularity: movieFromMovieDB.popularity,
        posterPath: movieFromMovieDB.posterPath != ''
            ? 'https://image.tmdb.org/t/p/w500${movieFromMovieDB.posterPath}'
            : 'https://viterbi-web.usc.edu/~zexunyao/itp301/Assignment_07/img.jpeg',
        releaseDate: movieFromMovieDB.releaseDate != null
            ? movieFromMovieDB.releaseDate!
            : DateTime.now(),
        title: movieFromMovieDB.title,
        video: movieFromMovieDB.video,
        voteAverage: movieFromMovieDB.voteAverage,
        voteCount: movieFromMovieDB.voteCount,
      );

  static Movie movieDBDetailsToEntity(MovieDetails movieFromMovieDB) => Movie(
        adult: movieFromMovieDB.adult,
        backdropPath: movieFromMovieDB.backdropPath != ''
            ? 'https://image.tmdb.org/t/p/w500${movieFromMovieDB.backdropPath}'
            : 'https://sd.keepcalms.com/i/keep-calm-poster-not-found.png',
        genreIds: movieFromMovieDB.genres.map((e) => e.name).toList(),
        id: movieFromMovieDB.id,
        originalLanguage: movieFromMovieDB.originalLanguage,
        originalTitle: movieFromMovieDB.originalTitle,
        overview: movieFromMovieDB.overview,
        popularity: movieFromMovieDB.popularity,
        posterPath: movieFromMovieDB.posterPath != ''
            ? 'https://image.tmdb.org/t/p/w500${movieFromMovieDB.posterPath}'
            : 'https://sd.keepcalms.com/i/keep-calm-poster-not-found.png',
        releaseDate: movieFromMovieDB.releaseDate,
        title: movieFromMovieDB.title,
        video: movieFromMovieDB.video,
        voteAverage: movieFromMovieDB.voteAverage,
        voteCount: movieFromMovieDB.voteCount,
      );
}
