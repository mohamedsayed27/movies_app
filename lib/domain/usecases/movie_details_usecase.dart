
import 'package:dartz/dartz.dart';

import '../../core/error/failure.dart';
import '../../core/usecases/base_usecase.dart';
import '../../core/utils/movie_details_parameters.dart';
import '../entities/movie_details_entity.dart';
import '../repository/base_movie_repository.dart';

class MovieDetailsUseCase extends BaseUseCase<MovieDetailsEntity, MovieDetailsParameters>{
  final BaseMovieRepository baseMovieRepository;

  MovieDetailsUseCase(this.baseMovieRepository);
  @override
  Future<Either<Failure, MovieDetailsEntity>> call(MovieDetailsParameters parameters) async{
    return await baseMovieRepository.getMovieDetails(parameters);
  }

}
