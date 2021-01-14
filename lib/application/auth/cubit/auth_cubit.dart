import 'package:bloc/bloc.dart';
import 'package:cubit2_app/domain/auth/model/login_request.dart';
import 'package:cubit2_app/domain/auth/model/login_response.dart';
import 'package:cubit2_app/infrastructure/auth/auth_repository.dart';
import 'package:meta/meta.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  AuthRepository _authRepository = AuthRepository();

  void signInUser(LoginRequest loginRequest) async{
    emit(AuthLoading());

    try{
      final _data = await _authRepository.signInUserWithEmail(loginRequest);
      _data.fold(
            (l) => emit(AuthError(l)),
            (r) => emit(AuthSuccess(r)),
      );
    }catch(e){
      emit(AuthError(e));
    }

  }


}
