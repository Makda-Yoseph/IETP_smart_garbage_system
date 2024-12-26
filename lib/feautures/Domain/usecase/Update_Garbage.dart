import 'package:either_dart/either.dart';
import 'package:ietp_project/feautures/Domain/entities/garbage_can_model.dart';
import 'package:ietp_project/feautures/Domain/repo/garbage_repo.dart';
import 'package:ietp_project/feautures/faulure.dart';

class UpdateGarbage {
  final GarbageRepo _garbageRepository;
  UpdateGarbage(this._garbageRepository);

  Future<Either<Failure, GarbageCanModel>> exicute(
      GarbageCanModel garbageCanModel) {
    return _garbageRepository.updateGarbageLevel(garbageCanModel);
  }
}
