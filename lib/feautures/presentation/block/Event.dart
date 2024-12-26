import 'package:equatable/equatable.dart';
import 'package:ietp_project/feautures/Domain/entities/garbage_can_model.dart';

abstract class GarbageEvent extends Equatable {
  const GarbageEvent();

  @override
  List<Object?> get props => [];
}

// Event for fetching garbage list
class GetGarbageListEvent extends GarbageEvent {}

// Event for fetching garbage details
class GetGarbageDetailEvent extends GarbageEvent {
  final String id;

  const GetGarbageDetailEvent(this.id);

  @override
  List<Object?> get props => [id];
}

// Event for updating garbage levels
class UpdateGarbageEvent extends GarbageEvent {
  final GarbageCanModel garbageCanModel;

  const UpdateGarbageEvent(this.garbageCanModel);

  @override
  List<Object?> get props => [garbageCanModel];
}
