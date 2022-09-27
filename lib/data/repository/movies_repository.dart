
import 'package:dartz/dartz.dart';

import '../../core/error/exception.dart';
import '../../core/error/failure.dart';
import '../../core/utils/movie_details_parameters.dart';
import '../../core/utils/recommendation_parameters.dart';
import '../../domain/entities/moveis_entity.dart';
import '../../domain/entities/movie_details_entity.dart';
import '../../domain/entities/recommendation_entity.dart';
import '../../domain/repository/base_movie_repository.dart';
import '../datasources/movies_remote_data_source.dart';

class MoviesRepository extends BaseMovieRepository{
  final BaseMoviesRemoteDatasource baseMoviesRemoteDatasource;

  MoviesRepository(this.baseMoviesRemoteDatasource);
  @override
  Future<Either<Failure,List<MoviesEntity>>> getNowPlayingMovies() async{
    final result = await baseMoviesRemoteDatasource.getNowPlayingMovies();
    try{
      return Right(result);
    }on ServerModelException catch(error){
      return left(ServerFailure(error.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, List<MoviesEntity>>> getPopularMovies() async{
    final result = await baseMoviesRemoteDatasource.getPopularMovies();
    try{
      return Right(result);
    }on ServerModelException catch(error){
      return left(ServerFailure(error.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, List<MoviesEntity>>> getTopRatedMovies() async{
    final result = await baseMoviesRemoteDatasource.getTopRatedMovies();
    try{
      return Right(result);
    }on ServerModelException catch(error){
      return left(ServerFailure(error.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, MovieDetailsEntity>> getMovieDetails(MovieDetailsParameters parameters) async{
    final result = await baseMoviesRemoteDatasource.getMovieDetails(parameters);
    try{
      return Right(result);
    }on ServerModelException catch(error){
      return left(ServerFailure(error.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, List<RecommendationEntity>>> getRecommendedMovies(RecommendationParameters parameters) async{
    final result = await baseMoviesRemoteDatasource.getRecommendedMovies(parameters);
    try{
      return Right(result);
    }on ServerModelException catch(error){
      return left(ServerFailure(error.errorMessageModel.statusMessage));
    }
  }



}