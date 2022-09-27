

import 'package:equatable/equatable.dart';

import '../../core/utils/enums.dart';
import '../../domain/entities/movie_details_entity.dart';

class MovieDetailsState extends Equatable {
  const MovieDetailsState({
    this.movieDetailsEntity,
    this.requestState = RequestState.isLoaded,
    this.movieDetailsMessage = '',
  });

  final MovieDetailsEntity? movieDetailsEntity;
  final RequestState requestState;
  final String movieDetailsMessage;

  MovieDetailsState copyWith({
    MovieDetailsEntity? movieDetailsEntity,
    RequestState? requestState,
    String? movieDetailsMessage,
  }) {
    return MovieDetailsState(
        movieDetailsEntity: movieDetailsEntity ?? this.movieDetailsEntity,
        requestState: requestState ?? this.requestState,
        movieDetailsMessage: movieDetailsMessage ?? this.movieDetailsMessage);
  }

  @override
  List<Object?> get props => [
        movieDetailsEntity,
        requestState,
        movieDetailsMessage,
      ];
}
