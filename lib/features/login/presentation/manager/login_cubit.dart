import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:obour/core/api/api-manager.dart';
import 'package:obour/core/errors/failures.dart';
import 'package:obour/features/login/data/data_sources/remote/login_remote_ds.dart';
import 'package:obour/features/login/data/data_sources/remote/login_remote_ds_impl.dart';
import 'package:obour/features/login/data/repositories/login_repo_impl.dart';
import 'package:obour/features/login/domain/entities/login_entity.dart';
import 'package:obour/features/login/domain/repositories/login_repo.dart';
import 'package:obour/features/login/domain/use_cases/login_use_case.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());
  static LoginCubit get(context) => BlocProvider.of(context);


  Future<void> login({required String email,required String password}) async {
      emit(LoginLoading());
      ApiManager apiManager = ApiManager();
      LoginRemoteDs remoteDs = LoginRemoteDsImpl(apiManager);
      LoginRepo loginRepo = LoginRepoImpl(remoteDs);
      LoginUseCase loginUseCase = LoginUseCase(loginRepo);
      var response = await loginUseCase.call(
          email:email, password:password);
      response.fold(
            (l) => emit(LoginFailure(l)),
            (r) {
          emit(LoginSuccess(r));
          print("Login cubit+++++ status: ${r.status}, token: ${r.token}");
        },
      );
  }
}
