import 'package:dartz/dartz.dart';
import '../../core/error/failure.dart';
import '../../core/usecases/base_usecase.dart';
import '../../core/utils/recommendation_parameters.dart';
import '../entities/recommendation_entity.dart';
import '../repository/base_movie_repository.dart';
class GetRecommendationUseCase extends BaseUseCase<List<RecommendationEntity>, RecommendationParameters>{
  final BaseMovieRepository baseMovieRepository;

  GetRecommendationUseCase(this.baseMovieRepository);
  @override
  Future<Either<Failure, List<RecommendationEntity>>> call(RecommendationParameters parameters) async{
    return await baseMovieRepository.getRecommendedMovies(parameters);

  }

}