
import 'package:dartz/dartz.dart';

import '../../core/error/failure.dart';
import '../../core/usecases/base_usecase.dart';
import '../entities/moveis_entity.dart';
import '../repository/base_movie_repository.dart';

class GetPopularMoviesUseCase extends BaseUseCase<List<MoviesEntity>,NoParameters>{
  final BaseMovieRepository baseMovieRepository;

  GetPopularMoviesUseCase(this.baseMovieRepository);

  @override
  Future<Either<Failure,List<MoviesEntity>>> call(NoParameters parameters) async{
    return await baseMovieRepository.getPopularMovies();
  }



}