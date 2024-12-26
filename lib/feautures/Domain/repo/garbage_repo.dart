import 'package:either_dart/either.dart';
import 'package:ietp_project/feautures/Domain/entities/garbage_can_model.dart';
import 'package:ietp_project/feautures/faulure.dart';

abstract class GarbageRepo {
  Future<Either<Failure, List<GarbageCanModel>>> getGarbageList();
  Future<Either<Failure, GarbageCanModel>> getGarbageDetail(String id);
  Future<Either<Failure, GarbageCanModel>> updateGarbageLevel(
      GarbageCanModel garbageCanModel);
}
