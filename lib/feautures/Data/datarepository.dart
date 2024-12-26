import 'package:either_dart/either.dart';
import 'package:ietp_project/feautures/Data/datasource.dart';
import 'package:ietp_project/feautures/Data/model.dart';
import 'package:ietp_project/feautures/Domain/entities/garbage_can_model.dart';
import 'package:ietp_project/feautures/Domain/repo/garbage_repo.dart';
import 'package:ietp_project/feautures/faulure.dart';

class GarbageRepositoryImpl implements GarbageRepo {
  final GarbageDataSource _dataSource;

  GarbageRepositoryImpl(this._dataSource);

  @override
  Future<Either<Failure, List<GarbageCanModel>>> getGarbageList() async {
    try {
      final data = await _dataSource.getGarbageList();
      return Right(data);
    } catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, GarbageCanModel>> getGarbageDetail(String id) async {
    try {
      final data = await _dataSource.getGarbageDetail(id);
      return Right(data);
    } catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, GarbageCanModel>> updateGarbageLevel(
      GarbageCanModel garbageCanModel) async {
    try {
      await _dataSource.updateGarbageLevel(
          garbageCanModel as GarbageDataModel); // Ensure proper type casting
      return Right(garbageCanModel);
    } catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }
}
