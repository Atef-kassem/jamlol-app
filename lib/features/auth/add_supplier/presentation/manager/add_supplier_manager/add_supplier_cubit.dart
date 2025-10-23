import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:obour/core/api/api-manager.dart';
import 'package:obour/core/errors/failures.dart';
import 'package:obour/features/auth/add_supplier/data/data_sources/remote/add_supplier_remote_ds.dart';
import 'package:obour/features/auth/add_supplier/data/data_sources/remote/add_supplier_remote_ds_impl.dart';
import 'package:obour/features/auth/add_supplier/data/repositories/add_supplier_repo_impl.dart';
import 'package:obour/features/auth/add_supplier/domain/entities/add_supplier_entity.dart';
import 'package:obour/features/auth/add_supplier/domain/repositories/add_supplier_repo.dart';
import 'package:obour/features/auth/add_supplier/domain/use_cases/add_supplier_use_case.dart';

part 'add_supplier_state.dart';

class AddSupplierCubit extends Cubit<AddSupplierState> {
  AddSupplierCubit() : super(AddSupplierInitial());

  static AddSupplierCubit get(context) => BlocProvider.of(context);

  Future<void> addSupplier({
    required String name,
    required String phone,
    required String idNum,
    required String idType,
    required String address,
    required String supplierType,
    required String status,
    required int regionId,
  }) async {
    emit(AddSupplierLoading());
    ApiManager apiManager = ApiManager();
    AddSupplierRemoteDs remoteDs = AddSupplierRemoteDsImpl(apiManager);
    AddSupplierRepo repo = AddSupplierRepoImpl(remoteDs);
    AddSupplierUseCase useCase = AddSupplierUseCase(repo);
    var response = await useCase.call(
      name: name,
      phone: phone,
      idNum: idNum,
      idType: idType,
      address: address,
      supplierType: supplierType,
      status: status,
      regionId: regionId,
    );
    response.fold((l) => emit(AddSupplierFailure(l)), (r) {
      emit(AddSupplierSuccess(r));
      print("AddSupplier cubit+++++ data: ${r.data}");
    });
  }
}
