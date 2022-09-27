import 'package:equatable/equatable.dart';

class GeneresEntity extends Equatable {
  final String name;
  final int id;

  const GeneresEntity({required this.name,required this.id});

  @override
  List<Object> get props => [name, id];
}