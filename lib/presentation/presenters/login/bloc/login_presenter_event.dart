part of 'login_presenter_bloc.dart';

@immutable
abstract class LoginPresenterEvent {}

class PasswordChanged extends LoginPresenterEvent {
  final String newPassword;

  PasswordChanged(this.newPassword);

  @override
  String toString() => 'PasswordChanged(newPassword: $newPassword)';
}

class EmailChanged extends LoginPresenterEvent {
  final String newEmail;

  EmailChanged(this.newEmail);

  @override
  String toString() => 'EmailChanged(newEmail: $newEmail)';
}

class ValidateFormRequested extends LoginPresenterEvent {}

class LoginRequested extends LoginPresenterEvent {}

class ShowLoading extends LoginPresenterEvent {}

class HideLoading extends LoginPresenterEvent {}

class ShowAuthError extends LoginPresenterEvent {
  final String message;

  ShowAuthError(this.message);

  @override
  String toString() => 'ShowAuthError(message: $message)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ShowAuthError && other.message == message;
  }

  @override
  int get hashCode => message.hashCode;
}
