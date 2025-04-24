abstract class AuthState {}

class AuthInitial extends AuthState {}

class AuthRegistered extends AuthState {
  final String email;
  final String password;
  AuthRegistered(this.email, this.password);
}

class AuthNotRegistered extends AuthState {}

class AuthError extends AuthState {
  final String message;
  AuthError(this.message);
}
