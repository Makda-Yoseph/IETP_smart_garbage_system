import 'package:get_it/get_it.dart';
import 'package:firebase_database/firebase_database.dart';

import 'package:ietp_project/feautures/Data/datarepository.dart';
import 'package:ietp_project/feautures/Data/datasource.dart';
import 'package:ietp_project/feautures/Domain/repo/garbage_repo.dart';
import 'package:ietp_project/feautures/Domain/usecase/Get_Detail.dart';
import 'package:ietp_project/feautures/Domain/usecase/Get_Garbage_List.dart';
import 'package:ietp_project/feautures/Domain/usecase/Update_Garbage.dart';
import 'package:ietp_project/feautures/presentation/block/bloc.dart';

final sl = GetIt.instance;

void setupServiceLocator() {
  // **External Services**
  sl.registerLazySingleton<DatabaseReference>(
      () => FirebaseDatabase.instance.ref());

  // **Data Sources**
  sl.registerLazySingleton<GarbageDataSource>(
    () => GarbageDataSource(sl<DatabaseReference>()),
  );

  // **Repositories**
  sl.registerLazySingleton<GarbageRepo>(
    () => GarbageRepositoryImpl(sl<GarbageDataSource>()),
  );

  // **Use Cases**
  sl.registerLazySingleton(() => GetGarbageList(sl<GarbageRepo>()));
  sl.registerLazySingleton(() => GetDetail(sl<GarbageRepo>()));
  sl.registerLazySingleton(() => UpdateGarbage(sl<GarbageRepo>()));

  // **Blocs**
  sl.registerFactory(
    () => GarbageBloc(
      getGarbageList: sl<GetGarbageList>(),
      getDetail: sl<GetDetail>(),
      updateGarbage: sl<UpdateGarbage>(),
    ),
  );
}
