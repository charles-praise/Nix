import 'package:shoplax_by_charles/service/service.dart';

import '../../export.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());
  final AuthLocalService authLocalService = AuthLocalService();

  Future<void> checkRegistrationStatus() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? email = prefs.getString('email');
      String? password = prefs.getString('password');
      if (email != null && password != null) {
        emit(AuthRegistered(email, password));
      } else {
        emit(AuthNotRegistered());
      }
    } catch (e) {
      emit(AuthError("Failed to check registration status."));
    }
  }

  Future<void> registerUser(String email, String password) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString('username', email);
      await prefs.setString('password', password);
      emit(AuthRegistered(email, password));
    } catch (e) {
      emit(AuthError("Failed to register user."));
    }
  }

  Future<void> logoutUser() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.remove('username');
      emit(AuthNotRegistered());
    } catch (e) {
      emit(AuthError("Failed to log out."));
    }
  }
}
