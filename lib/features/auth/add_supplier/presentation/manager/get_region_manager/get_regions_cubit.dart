import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:obour/core/api/api-manager.dart';
import 'package:obour/core/errors/failures.dart';
import 'package:obour/features/auth/add_supplier/data/data_sources/remote/add_supplier_remote_ds.dart';
import 'package:obour/features/auth/add_supplier/data/data_sources/remote/add_supplier_remote_ds_impl.dart';
import 'package:obour/features/auth/add_supplier/data/repositories/add_supplier_repo_impl.dart';
import 'package:obour/features/auth/add_supplier/domain/entities/get_regions_entity.dart';
import 'package:obour/features/auth/add_supplier/domain/repositories/add_supplier_repo.dart';
import 'package:obour/features/auth/sign_up/data/data_sources/remote/sign_up_remote_ds_impl.dart';

import '../../../domain/use_cases/get_regions_use_case.dart';

part 'get_regions_state.dart';

class GetRegionsCubit extends Cubit<GetRegionsState> {
  GetRegionsCubit() : super(GetRegionsInitial());
  static GetRegionsCubit get(context) => BlocProvider.of(context);

  List<Regions> regionsData=[];


   getRegions() async {
    emit(GetRegionsLoading());
    ApiManager apiManager = ApiManager();
    AddSupplierRemoteDs remoteDs = AddSupplierRemoteDsImpl(apiManager);
AddSupplierRepo repo = AddSupplierRepoImpl(remoteDs);
GetRegionsUseCase useCase = GetRegionsUseCase(repo);
    var response = await useCase.call();
    response.fold(
          (l) => emit(GetRegionsFailure(l)),
          (r) {
            regionsData=r.regions??[];
        emit(GetRegionsSuccess(r));
        print("get regions cubit+++++ data: ${regionsData}");
      },
    );
  }
}
