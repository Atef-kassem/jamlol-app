import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:obour/core/api/api-manager.dart';
import 'package:obour/core/errors/failures.dart';
import 'package:obour/features/auth/add_carrier/data/data_sources/remote/add_carrier_remote_ds.dart';
import 'package:obour/features/auth/add_carrier/data/data_sources/remote/add_carrier_remote_ds_impl.dart';
import 'package:obour/features/auth/add_carrier/data/repositories/add_carrier_repo_impl.dart';
import 'package:obour/features/auth/add_carrier/domain/entities/add_carrier_entity.dart';
import 'package:obour/features/auth/add_carrier/domain/repositories/add_carrier_repo.dart';
import 'package:obour/features/auth/add_carrier/domain/use_cases/add_carrier_use_case.dart';

part 'add_carrier_state.dart';

class AddCarrierCubit extends Cubit<AddCarrierState> {
  AddCarrierCubit() : super(AddCarrierInitial());

  static AddCarrierCubit get(context) => BlocProvider.of(context);

  Future<void> addCarrier({
    required String name,
    required String phone,
    required String idNum,
    required String address,
    required String carrierType,
    required String status,
    required int regionId,
  }) async {
    emit(AddCarrierLoading());
    ApiManager apiManager = ApiManager();
    AddCarrierRemoteDs remoteDs = AddCarrierRemoteDsImpl(apiManager);
    AddCarrierRepo repo = AddCarrierRepoImpl(remoteDs);
    AddCarrierUseCase useCase = AddCarrierUseCase(repo);
    var response = await useCase.call(
      name: name,
      phone: phone,
      idNum: idNum,
      address: address,
      carrierType: carrierType,
      status: status,
      regionId: regionId,
    );
    response.fold((l) => emit(AddCarrierFailure(l)), (r) {
      emit(AddCarrierSuccess(r));
      print("Add Carrier cubit+++++ data: ${r.naqel}");
    });
  }
}
