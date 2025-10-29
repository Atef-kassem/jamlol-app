import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:obour/core/api/api-manager.dart';
import 'package:obour/core/errors/failures.dart';
import 'package:obour/features/admin/carrier_management/data/remote/get_carriers_remote_ds.dart';
import 'package:obour/features/admin/carrier_management/data/remote/get_carriers_remote_ds_impl.dart';
import 'package:obour/features/admin/carrier_management/data/repositories/get_suppliers_repo_impl.dart';
import 'package:obour/features/admin/carrier_management/domain/entities/get_all_carriers_entity.dart';
import 'package:obour/features/admin/carrier_management/domain/repositories/get_carriers_repo.dart';
import 'package:obour/features/admin/carrier_management/domain/use_cases/get_all_carriers_use_case.dart';

part 'get_carriers_state.dart';

class GetCarriersCubit extends Cubit<GetCarriersState> {
  GetCarriersCubit() : super(GetCarriersInitial());

  static GetCarriersCubit get(context) => BlocProvider.of(context);

  List<NaqleenEntity> carriers = [];

  getAllCarriers() async {
    emit(GetAllCarriersLoading());
    ApiManager apiManager = ApiManager();
    GetCarriersRemoteDs remoteDs = GetCarriersRemoteDsImpl(apiManager);
    GetCarriersRepo repo = GetCarriersRepoImpl(remoteDs);
    GetAllCarriersUseCase useCase = GetAllCarriersUseCase(repo);
    var response = await useCase.call();
    response.fold((l) => emit(GetAllCarriersFailure(l)), (r) {
      carriers = r.naqleen ?? [];
      emit(GetAllCarriersSuccess(r));
      print(" Get all Carriers cubit+++++ data: ${carriers}");
    });
  }
}
