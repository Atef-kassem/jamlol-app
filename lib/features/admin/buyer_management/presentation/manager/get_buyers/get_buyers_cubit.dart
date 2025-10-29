import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:obour/core/api/api-manager.dart';
import 'package:obour/core/errors/failures.dart';
import 'package:obour/features/admin/buyer_management/data/data_sources/remote/get_buyers_remote_ds.dart';
import 'package:obour/features/admin/buyer_management/data/data_sources/remote/get_buyers_remote_ds_impl.dart';
import 'package:obour/features/admin/buyer_management/data/repositories/get_buyers_repo_impl.dart';
import 'package:obour/features/admin/buyer_management/domain/entities/get_all_buyers_entity.dart';
import 'package:obour/features/admin/buyer_management/domain/repositories/get_buyers_repo.dart';
import 'package:obour/features/admin/buyer_management/domain/use_cases/get_all_buyers_use_case.dart' show GetAllBuyersUseCase;

part 'get_buyers_state.dart';

class GetBuyersCubit extends Cubit<GetBuyersState> {
  GetBuyersCubit() : super(GetBuyersInitial());
  static GetBuyersCubit get(context) => BlocProvider.of(context);

  List<GetAllBuyersClientsEntity> buyers=[];


  getAllBuyers() async {
    emit(GetAllBuyersLoading());
    ApiManager apiManager = ApiManager();
    GetBuyersRemoteDs remoteDs =  GetBuyersRemoteDsImpl(apiManager);
    GetBuyersRepo repo =  GetBuyersRepoImpl(remoteDs);
    GetAllBuyersUseCase useCase = GetAllBuyersUseCase(repo);
    var response = await useCase.call();
    response.fold(
          (l) => emit(GetAllBuyersFailure(l)),
          (r) {
       buyers=r.clients??[];
        emit(GetAllBuyersSuccess(r));
        print(" Get all Buyers cubit+++++ data: ${buyers}");
      },
    );
  }
}
