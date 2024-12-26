import 'package:equatable/equatable.dart';
import 'package:ietp_project/feautures/Domain/entities/garbage_can_model.dart';

abstract class GarbageState extends Equatable {
  const GarbageState();

  @override
  List<Object?> get props => [];
}

class GarbageInitial extends GarbageState {}

class GarbageLoading extends GarbageState {}

class GarbageListLoaded extends GarbageState {
  final List<GarbageCanModel> garbageList;

  const GarbageListLoaded(this.garbageList);

  @override
  List<Object?> get props => [garbageList];
}

class GarbageDetailLoaded extends GarbageState {
  final GarbageCanModel garbageCan;

  const GarbageDetailLoaded(this.garbageCan);

  @override
  List<Object?> get props => [garbageCan];
}

class GarbageUpdated extends GarbageState {
  final GarbageCanModel garbageCan;

  const GarbageUpdated(this.garbageCan);

  @override
  List<Object?> get props => [garbageCan];
}

class GarbageError extends GarbageState {
  final String message;

  const GarbageError(this.message);

  @override
  List<Object?> get props => [message];
}
