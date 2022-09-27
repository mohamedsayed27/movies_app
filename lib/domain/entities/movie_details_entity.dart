
import 'package:equatable/equatable.dart';

import 'generes_entity.dart';

class MovieDetailsEntity extends Equatable {
  final String backdropPath;
  final int id;
  final String overview;
  final String releaseDate;
  final int runtime;
  final String title;
  final double voteAverage;
  final List<GeneresEntity> generes;

  const MovieDetailsEntity({
    required this.backdropPath,
    required this.generes,
    required this.id,
    required this.overview,
    required this.releaseDate,
    required this.runtime,
    required this.title,
    required this.voteAverage,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [
    backdropPath,
    id,
    overview,
    releaseDate,
    generes,
    runtime,
    title,
    voteAverage,
  ];
}
