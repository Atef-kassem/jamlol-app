import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:obour/core/api/api-manager.dart';
import 'package:obour/core/errors/failures.dart';
import 'package:obour/features/admin/supplier_management/data/data_sources/remote/get_suppliers_remote_ds.dart';
import 'package:obour/features/admin/supplier_management/data/data_sources/remote/get_suppliers_remote_ds_impl.dart';
import 'package:obour/features/admin/supplier_management/data/repositories/get_suppliers_repo_impl.dart';
import 'package:obour/features/admin/supplier_management/domain/entities/get_all_suppliers_entity.dart';
import 'package:obour/features/admin/supplier_management/domain/repositories/get_suppliers_repo.dart';
import 'package:obour/features/admin/supplier_management/domain/use_cases/get_all_supplier_use_case.dart';

part 'get_suppliers_state.dart';

class GetSuppliersCubit extends Cubit<GetSuppliersState> {
  GetSuppliersCubit() : super(GetSuppliersInitial());

  static GetSuppliersCubit get(context) => BlocProvider.of(context);

  List<SupplierEntity> suppliers=[];


  getAllSuppliers() async {
    emit(GetAllSuppliersLoading());
    ApiManager apiManager = ApiManager();
    GetSuppliersRemoteDs remoteDs =  GetSuppliersRemoteDsImpl(apiManager);
    GetSuppliersRepo repo =  GetSuppliersRepoImpl(remoteDs);
    GetAllSuppliersUseCase useCase = GetAllSuppliersUseCase(repo);
    var response = await useCase.call();
    response.fold(
          (l) => emit(GetAllSuppliersFailure(l)),
          (r) {
            suppliers=r.data?.suppliers??[];
        emit(GetAllSuppliersSuccess(r));
        print(" Get all Suppliers cubit+++++ data: ${suppliers}");
      },
    );
  }
}
