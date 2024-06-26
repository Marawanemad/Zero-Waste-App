import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zero_waste_app/models/authentication/register_model.dart';
import 'package:zero_waste_app/modules/authentication/register/cubit/register_state.dart';
import 'package:zero_waste_app/shared/data/online/dio_helper.dart';

class RegisterCubit extends Cubit<RegisterState> {
// to make initialize super cubit
  RegisterCubit() : super(RegisterInitialState());
// to make object from cubit use it in any place
  static RegisterCubit get(context) => BlocProvider.of(context);

  bool showErrorIcon = false;
  void changeErrorIconFlag() {
    showErrorIcon != showErrorIcon;
    emit(ShowErrorIconFlagState());
  }

  RegisterModel? registerModel;
  void userRegister(
      {required String email,
      required String password,
      required String name,
      required String phone}) async {
    // to make load when check data
    emit(RegisterLoadingState());
    // make object from Dio to send data to API
    DioHelper.postData(
      url: 'signUp',
      data: {
        'name': name,
        'email': email,
        'phone': phone,
        'password': password,
      },
    ).then((value) {
      // to get data in this model if status success
      registerModel = RegisterModel.fromjson(value.data);

      emit(RegisterSuccessState(registerModel!));
    }).catchError((onError) {
      // ignore: avoid_print
      print("Error when  Register ${onError.toString()}");
      emit(RegisterErrorState(onError.toString()));
    });
  }
}
