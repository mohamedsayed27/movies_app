
import 'package:get_it/get_it.dart';

import '../../data/datasources/movies_remote_data_source.dart';
import '../../data/repository/movies_repository.dart';
import '../../domain/repository/base_movie_repository.dart';
import '../../domain/usecases/get_now_playing_movies_usecase.dart';
import '../../domain/usecases/get_popular_movies_usecase.dart';
import '../../domain/usecases/get_top_rated_movies_usecase.dart';
import '../../presentation/controller/movies_bloc.dart';

final sl = GetIt.instance;
class ServicesLocator{

  void init(){

    ///BLoC
    sl.registerFactory(() => MoviesBloc(sl(),sl(),sl()));

    ///USE CASES
    sl.registerLazySingleton(() => GetNowMoviesPlayingUseCase(sl()));
    sl.registerLazySingleton(() => GetTopRatedMoviesUseCase(sl()));
    sl.registerLazySingleton(() => GetPopularMoviesUseCase(sl()));

    ///REPOSITORY
    sl.registerLazySingleton<BaseMovieRepository>(() => MoviesRepository(sl()));

    ///DATA SOURCE
    sl.registerLazySingleton<BaseMoviesRemoteDatasource>(() => MoviesRemoteDatasource());
  }
}