
import 'package:dartz/dartz.dart';

import '../../core/error/failure.dart';
import '../../core/utils/movie_details_parameters.dart';
import '../../core/utils/recommendation_parameters.dart';
import '../entities/moveis_entity.dart';
import '../entities/movie_details_entity.dart';
import '../entities/recommendation_entity.dart';

abstract class BaseMovieRepository {
  Future<Either<Failure,List<MoviesEntity>>> getNowPlayingMovies();

  Future<Either<Failure,List<MoviesEntity>>> getPopularMovies();

  Future<Either<Failure,List<MoviesEntity>>> getTopRatedMovies();

  Future<Either<Failure,MovieDetailsEntity>> getMovieDetails(MovieDetailsParameters parameters);

  Future<Either<Failure,List<RecommendationEntity>>> getRecommendedMovies(RecommendationParameters parameters);
}
