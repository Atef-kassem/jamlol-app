import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:obour/core/api/api-manager.dart';
import 'package:obour/core/errors/failures.dart';
import 'package:obour/features/auth/add_buyer/data/data_sources/remote/add_buyer_remote_ds.dart';
import 'package:obour/features/auth/add_buyer/data/data_sources/remote/add_buyer_remote_ds_impl.dart';
import 'package:obour/features/auth/add_buyer/data/repositories/add_buyer_repo_impl.dart';
import 'package:obour/features/auth/add_buyer/domain/entities/add_buyer_entity.dart';
import 'package:obour/features/auth/add_buyer/domain/repositories/add_buyer_repo.dart';
import 'package:obour/features/auth/add_buyer/domain/use_cases/add_buyer_use_case.dart';

part 'add_buyer_state.dart';

class AddBuyerCubit extends Cubit<AddBuyerState> {
  AddBuyerCubit() : super(AddBuyerInitial());
  static AddBuyerCubit get(context) => BlocProvider.of(context);

  Future<void> addBuyer({
    required String name,
    required String phone,
    required String address,
    required String status,
    required int regionId,
  }) async {
    emit(AddBuyerLoading());
    ApiManager apiManager = ApiManager();
    AddBuyerRemoteDs remoteDs = AddBuyerRemoteDsImpl(apiManager);
    AddBuyerRepo repo = AddBuyerRepoImpl(remoteDs);
    AddBuyerUseCase useCase = AddBuyerUseCase(repo);
    var response = await useCase.call(
      name: name,
      phone: phone,
      address: address,
      status: status,
      regionId: regionId,
    );
    response.fold((l) => emit(AddBuyerFailure(l)), (r) {
      emit(AddBuyerSuccess(r));
      print("Add Buyer cubit+++++ data: ${r.data}");
    });
  }
}
