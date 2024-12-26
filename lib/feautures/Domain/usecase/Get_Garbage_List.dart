import 'package:either_dart/either.dart';
import 'package:ietp_project/feautures/Domain/entities/garbage_can_model.dart';
import 'package:ietp_project/feautures/Domain/repo/garbage_repo.dart';
import 'package:ietp_project/feautures/faulure.dart';

class GetGarbageList {
  final GarbageRepo _garbageRepository;

  GetGarbageList(this._garbageRepository);

  Future<Either<Failure, List<GarbageCanModel>>> exicute() {
    return _garbageRepository.getGarbageList();
  }
}
