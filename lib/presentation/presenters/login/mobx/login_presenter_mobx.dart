import 'dart:async';

import 'package:mobx/mobx.dart';

import '../../../../ui/pages/login/login_presenter.dart';
import '../../../protocols/validation.dart';

part 'login_presenter_mobx.g.dart';

class LoginPresenterMobx = _LoginPresenterMobxBase with _$LoginPresenterMobx;

abstract class _LoginPresenterMobxBase with Store implements LoginPresenter {
  final Validation validation;

  _LoginPresenterMobxBase({required this.validation});

  final emailErrorController = StreamController<String?>();
  final passwordErrorController = StreamController<String?>();
  final authErrorController = StreamController<String?>();
  final authSuccessController = StreamController<bool>();
  final isFormValidController = StreamController<bool>();
  final isLoadingController = StreamController<bool>();

  @observable
  late ObservableStream<String?> emailError = ObservableStream<String?>(
    emailErrorController.stream,
    initialValue: null,
  );

  @observable
  late ObservableStream<String?> passwordError = ObservableStream<String?>(
    passwordErrorController.stream,
    initialValue: null,
  );

  @observable
  Observable<String> email = Observable("");

  @observable
  Observable<String> password = Observable("");

  @observable
  late ObservableStream<String?> authError = ObservableStream<String?>(
    authErrorController.stream,
    initialValue: null,
  );

  @observable
  late ObservableStream<bool> authSuccess = ObservableStream<bool>(
    authSuccessController.stream,
    initialValue: false,
  );

  @observable
  late ObservableStream<bool> isFormValid = ObservableStream<bool>(
    isFormValidController.stream,
    initialValue: false,
  );

  @observable
  late ObservableStream<bool> isLoading = ObservableStream<bool>(
    isLoadingController.stream,
    initialValue: false,
  );

  @action
  void _onValidateForm() {
    final isFormValid = emailError.value == null && passwordError.value == null;

    isFormValidController.add(isFormValid);
  }

  @action
  void _onEmailChangeEvent(String newEmail) {
    final emailValidation = validation.validate(
      field: "email",
      value: newEmail,
    );

    authErrorController.add(null);
    email.value = newEmail;
    emailErrorController.add(emailValidation);
    authSuccessController.add(false);

    _onValidateForm();
  }

  @action
  void _onPasswordChangeEvent(String newPassword) {
    final passwordValidation = validation.validate(
      field: "password",
      value: newPassword,
    );

    authErrorController.add(null);
    password.value = newPassword;
    passwordErrorController.add(passwordValidation);
    authSuccessController.add(false);

    _onValidateForm();
  }

  @action
  void _onShowLoadingEvent() {
    isLoadingController.add(true);
  }

  @action
  void _onHideLoadingEvent() {
    isLoadingController.add(false);
  }

  @action
  void _onAuthErrorEvent(String error) {
    authErrorController.add(error);
    _onHideLoadingEvent();
  }

  @action
  Future<void> _onLoginRequested() async {
    _onShowLoadingEvent();

    await Future.delayed(const Duration(seconds: 3));

    if (email.value == 'teste@teste.com' && password.value == '123456') {
      authSuccessController.add(true);
    } else {
      authErrorController.add("E-mail e/ou senha incorretos");
    }

    _onHideLoadingEvent();
  }

  @override
  Stream<String?> get emailErrorStream => emailError;

  @override
  Stream<String?> get passwordErrorStream => passwordError;

  @override
  Stream<String?> get authErrorStream => authError;

  @override
  Stream<bool> get authSuccessStream => authSuccess;

  @override
  Stream<bool> get isFormValidStream => isFormValid;

  @override
  Stream<bool> get isLoadingStream => isLoading;

  @override
  void validateEmail(String email) => _onEmailChangeEvent(email);

  @override
  void validatePassword(String password) => _onPasswordChangeEvent(password);

  @override
  Future<void> auth() => _onLoginRequested();

  @override
  Future<void> dispose() async {
    emailErrorController.close();
    passwordErrorController.close();
    authErrorController.close();
    authSuccessController.close();
    isFormValidController.close();
    isLoadingController.close();
  }
}
