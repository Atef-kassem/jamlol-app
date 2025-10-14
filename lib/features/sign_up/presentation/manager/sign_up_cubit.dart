import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:obour/core/api/api-manager.dart';
import 'package:obour/core/errors/failures.dart';
import 'package:obour/features/login/domain/use_cases/login_use_case.dart';
import 'package:obour/features/sign_up/data/data_sources/remote/sign_up_remote_ds.dart';
import 'package:obour/features/sign_up/data/data_sources/remote/sign_up_remote_ds_impl.dart';
import 'package:obour/features/sign_up/data/repositories/sign_up_repo_impl.dart';
import 'package:obour/features/sign_up/domain/entities/sign_up_entity.dart';
import 'package:obour/features/sign_up/domain/repositories/sign_up_repo.dart';
import 'package:obour/features/sign_up/domain/use_cases/sign_up_use_case.dart';

part 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit() : super(SignUpInitial());
  static SignUpCubit get(context) => BlocProvider.of(context);


  Future<void> signUp({
    required int roleId,
    required String name,
    required String userName,
    required String phone,
    required String email,
    required String password,
    required String address,
    required String personType,
    required String status}) async {
    emit(SignUpLoading());
    ApiManager apiManager = ApiManager();
    SignUpRemoteDs remoteDs = SignUpRemoteDsImpl(apiManager);
    SignUpRepo repo = SignUpRepoImpl(remoteDs);
    SignUpUseCase useCase = SignUpUseCase(repo);
    var response = await useCase.call(
      roleId: roleId,
      name: name,
      userName: userName,
      email: email,
      password: password,
      phone: phone,
      address: address,
      personType: personType,
      status: status,);
    response.fold(
          (l) => emit(SignUpFailure(l)),
          (r) {
        emit(SignUpSuccess(r));
        print("SignUp cubit+++++ data: ${r.data}");
      },
    );
  }
}
