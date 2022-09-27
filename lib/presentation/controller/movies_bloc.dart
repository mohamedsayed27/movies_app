import 'package:bloc/bloc.dart';
import '../../core/usecases/base_usecase.dart';
import '../../core/utils/enums.dart';
import '../../domain/usecases/get_now_playing_movies_usecase.dart';
import '../../domain/usecases/get_popular_movies_usecase.dart';
import '../../domain/usecases/get_top_rated_movies_usecase.dart';
import 'movies_event.dart';
import 'movies_state.dart';

class MoviesBloc extends Bloc<MoviesEvent, MoviesState> {
  final GetNowMoviesPlayingUseCase getNowMoviesPlayingUseCase;
  final GetPopularMoviesUseCase getPopularMoviesUseCase;
  final GetTopRatedMoviesUseCase getTopRatedMoviesUseCase;

  MoviesBloc(this.getNowMoviesPlayingUseCase, this.getPopularMoviesUseCase,
      this.getTopRatedMoviesUseCase)
      : super(const MoviesState()) {
    on<GetNowPlayingMoviesEvent>(_getNowPlayingMethod);

    on<GetPopularMoviesEvent>(_getPopularMethod);

    on<GetTopRatedMoviesEvent>(_getTopRatedMethod);
  }


  Future<void> _getNowPlayingMethod(event, emit) async {
    final result = await getNowMoviesPlayingUseCase(const NoParameters());
    result.fold(
            (l) => emit(
            state.copyWith(
                nowPlayingState:RequestState.isError,
                nowPlayingMessage: l.message
            )),
            (r) => emit(
            state.copyWith(
                nowPlayingState: RequestState.isLoaded,
                nowPlayingMovies: r
            )));
  }

  Future<void> _getPopularMethod(event, emit) async {
    final result = await getPopularMoviesUseCase(const NoParameters());
    result.fold(
            (l) => emit(state.copyWith(
            popularState: RequestState.isError, popularMessage: l.message)),
            (r) => emit(state.copyWith(
            popularMovies: r, popularState: RequestState.isLoaded)));
  }

  Future<void> _getTopRatedMethod(event, emit) async {
    final result = await getTopRatedMoviesUseCase(const NoParameters());
    result.fold(
            (l) => emit(state.copyWith(
            topRatedMessage: l.message, topRatedState: RequestState.isError)),
            (r) => emit(state.copyWith(
            topRatedMovies: r, topRatedState: RequestState.isLoaded)));
  }

}
