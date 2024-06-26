import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zero_waste_app/models/authentication/Login_model.dart';
import 'package:zero_waste_app/modules/authentication/login/cubit/login_state.dart';
import 'package:zero_waste_app/shared/data/online/dio_helper.dart';

class LoginCubit extends Cubit<LoginState> {
// to make initialize super cubit
  LoginCubit() : super(LoginInitialState());
// to make object from cubit use it in any place
  static LoginCubit get(context) => BlocProvider.of(context);
  bool showErrorIcon = false;
  void changeErrorIconFlag() {
    showErrorIcon != showErrorIcon;
    emit(ShowErrorIconFlagState());
  }

  LoginModel? loginModel;
  void userLogin({
    required String email,
    required String password,
  }) {
    // to make load when check data
    emit(LoginLoadingState());
    // make object from Dio to send data to API
    DioHelper.postData(
      url: 'signIn',
      data: {
        'user_email': email,
        'user_password': password,
      },
    ).then((value) {
      // to get data in this model if status success
      loginModel = LoginModel.fromjson(value.data);
      emit(LoginSuccessState(loginModel!));
    }).catchError((onError) {
      // ignore: avoid_print
      print("Error when  Login ${onError.toString()}");
      emit(LoginErrorState(onError.toString()));
    });
  }
}
