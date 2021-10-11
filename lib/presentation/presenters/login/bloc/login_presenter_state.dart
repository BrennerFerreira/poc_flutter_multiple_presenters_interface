part of 'login_presenter_bloc.dart';

@immutable
class LoginPresenterState {
  final String? emailError;
  final String? passwordError;
  final String? authError;
  final bool authSuccess;
  final bool isFormValid;
  final bool isLoading;
  final bool emailTouched;
  final bool passwordTouched;
  final String email;
  final String password;

  LoginPresenterState({
    this.emailError,
    this.passwordError,
    this.authError,
    required this.authSuccess,
    required this.emailTouched,
    required this.passwordTouched,
    required this.isFormValid,
    required this.isLoading,
    required this.email,
    required this.password,
  });

  LoginPresenterState copyWith({
    String? emailError,
    String? passwordError,
    String? authError,
    bool? authSuccess,
    bool? isFormValid,
    bool? emailTouched,
    bool? passwordTouched,
    bool? isLoading,
    String? email,
    String? password,
  }) {
    return LoginPresenterState(
      emailError: emailError == "" ? null : emailError ?? this.emailError,
      passwordError:
          passwordError == "" ? null : passwordError ?? this.passwordError,
      authError: authError == "" ? null : authError ?? this.authError,
      authSuccess: authSuccess ?? this.authSuccess,
      emailTouched: emailTouched ?? this.emailTouched,
      passwordTouched: passwordTouched ?? this.passwordTouched,
      isFormValid: isFormValid ?? this.isFormValid,
      isLoading: isLoading ?? this.isLoading,
      email: email ?? this.email,
      password: password ?? this.password,
    );
  }

  @override
  String toString() {
    return 'LoginPresenterState(emailError: $emailError, passwordError: $passwordError, authError: $authError, authSuccess: $authSuccess, emailTouched: $emailTouched, passwordTouched: $passwordTouched, isFormValid: $isFormValid, isLoading: $isLoading, email: $email, password: $password)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is LoginPresenterState &&
        other.emailError == emailError &&
        other.passwordError == passwordError &&
        other.authError == authError &&
        other.authSuccess == authSuccess &&
        other.emailTouched == emailTouched &&
        other.passwordTouched == passwordTouched &&
        other.isFormValid == isFormValid &&
        other.isLoading == isLoading &&
        other.email == email &&
        other.password == password;
  }

  @override
  int get hashCode {
    return emailError.hashCode ^
        passwordError.hashCode ^
        authError.hashCode ^
        authSuccess.hashCode ^
        emailTouched.hashCode ^
        passwordTouched.hashCode ^
        isFormValid.hashCode ^
        isLoading.hashCode ^
        email.hashCode ^
        password.hashCode;
  }
}

class LoginPresenterInitial extends LoginPresenterState {
  LoginPresenterInitial()
      : super(
          authSuccess: false,
          email: "",
          password: "",
          emailTouched: false,
          passwordTouched: false,
          isFormValid: false,
          isLoading: false,
        );
}
