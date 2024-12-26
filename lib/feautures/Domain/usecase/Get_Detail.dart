import 'package:either_dart/either.dart';
import 'package:ietp_project/feautures/Domain/entities/garbage_can_model.dart';
import 'package:ietp_project/feautures/Domain/repo/garbage_repo.dart';
import 'package:ietp_project/feautures/faulure.dart';

class GetDetail {
  final GarbageRepo _garbageRepository;
  GetDetail(this._garbageRepository);

  Future<Either<Failure, GarbageCanModel>> exicute(String id) {
    return _garbageRepository.getGarbageDetail(id);
  }
}
