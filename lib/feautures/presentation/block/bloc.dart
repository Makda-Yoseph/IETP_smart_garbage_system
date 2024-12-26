import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ietp_project/feautures/Domain/usecase/Get_Detail.dart';
import 'package:ietp_project/feautures/Domain/usecase/Get_Garbage_List.dart';
import 'package:ietp_project/feautures/Domain/usecase/Update_Garbage.dart';
import 'package:ietp_project/feautures/presentation/block/Event.dart';
import 'package:ietp_project/feautures/presentation/block/State.dart';

class GarbageBloc extends Bloc<GarbageEvent, GarbageState> {
  final GetGarbageList getGarbageList;
  final GetDetail getDetail;
  final UpdateGarbage updateGarbage;

  GarbageBloc({
    required this.getGarbageList,
    required this.getDetail,
    required this.updateGarbage,
  }) : super(GarbageInitial()) {
    on<GetGarbageListEvent>((event, emit) async {
      emit(GarbageLoading());
      final result = await getGarbageList.exicute();
      result.fold(
        (failure) => emit(GarbageError(failure.message)),
        (garbageList) => emit(GarbageListLoaded(garbageList)),
      );
    });

    on<GetGarbageDetailEvent>((event, emit) async {
      emit(GarbageLoading());
      final result = await getDetail.exicute(event.id);
      result.fold(
        (failure) => emit(GarbageError(failure.message)),
        (garbage) => emit(GarbageDetailLoaded(garbage)),
      );
    });

    on<UpdateGarbageEvent>((event, emit) async {
      emit(GarbageLoading());
      final result = await updateGarbage.exicute(event.garbageCanModel);
      result.fold(
        (failure) => emit(GarbageError(failure.message)),
        (updatedGarbage) => emit(GarbageUpdated(updatedGarbage)),
      );
    });
  }
}
