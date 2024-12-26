import 'package:equatable/equatable.dart';

class GarbageCanModel extends Equatable {
  final String name;
  final String id;
  final int level_one;
  final int level_two;

  GarbageCanModel(
      {required this.name,
      required this.id,
      required this.level_one,
      required this.level_two});

  @override
  List<Object?> get props => [name, level_one, level_two, id];
}
