// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_presenter_mobx.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$LoginPresenterMobx on _LoginPresenterMobxBase, Store {
  final _$emailErrorAtom = Atom(name: '_LoginPresenterMobxBase.emailError');

  @override
  ObservableStream<String?> get emailError {
    _$emailErrorAtom.reportRead();
    return super.emailError;
  }

  @override
  set emailError(ObservableStream<String?> value) {
    _$emailErrorAtom.reportWrite(value, super.emailError, () {
      super.emailError = value;
    });
  }

  final _$passwordErrorAtom =
      Atom(name: '_LoginPresenterMobxBase.passwordError');

  @override
  ObservableStream<String?> get passwordError {
    _$passwordErrorAtom.reportRead();
    return super.passwordError;
  }

  @override
  set passwordError(ObservableStream<String?> value) {
    _$passwordErrorAtom.reportWrite(value, super.passwordError, () {
      super.passwordError = value;
    });
  }

  final _$emailAtom = Atom(name: '_LoginPresenterMobxBase.email');

  @override
  Observable<String> get email {
    _$emailAtom.reportRead();
    return super.email;
  }

  @override
  set email(Observable<String> value) {
    _$emailAtom.reportWrite(value, super.email, () {
      super.email = value;
    });
  }

  final _$passwordAtom = Atom(name: '_LoginPresenterMobxBase.password');

  @override
  Observable<String> get password {
    _$passwordAtom.reportRead();
    return super.password;
  }

  @override
  set password(Observable<String> value) {
    _$passwordAtom.reportWrite(value, super.password, () {
      super.password = value;
    });
  }

  final _$authErrorAtom = Atom(name: '_LoginPresenterMobxBase.authError');

  @override
  ObservableStream<String?> get authError {
    _$authErrorAtom.reportRead();
    return super.authError;
  }

  @override
  set authError(ObservableStream<String?> value) {
    _$authErrorAtom.reportWrite(value, super.authError, () {
      super.authError = value;
    });
  }

  final _$authSuccessAtom = Atom(name: '_LoginPresenterMobxBase.authSuccess');

  @override
  ObservableStream<bool> get authSuccess {
    _$authSuccessAtom.reportRead();
    return super.authSuccess;
  }

  @override
  set authSuccess(ObservableStream<bool> value) {
    _$authSuccessAtom.reportWrite(value, super.authSuccess, () {
      super.authSuccess = value;
    });
  }

  final _$isFormValidAtom = Atom(name: '_LoginPresenterMobxBase.isFormValid');

  @override
  ObservableStream<bool> get isFormValid {
    _$isFormValidAtom.reportRead();
    return super.isFormValid;
  }

  @override
  set isFormValid(ObservableStream<bool> value) {
    _$isFormValidAtom.reportWrite(value, super.isFormValid, () {
      super.isFormValid = value;
    });
  }

  final _$isLoadingAtom = Atom(name: '_LoginPresenterMobxBase.isLoading');

  @override
  ObservableStream<bool> get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(ObservableStream<bool> value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  final _$_onLoginRequestedAsyncAction =
      AsyncAction('_LoginPresenterMobxBase._onLoginRequested');

  @override
  Future<void> _onLoginRequested() {
    return _$_onLoginRequestedAsyncAction.run(() => super._onLoginRequested());
  }

  final _$_LoginPresenterMobxBaseActionController =
      ActionController(name: '_LoginPresenterMobxBase');

  @override
  void _onValidateForm() {
    final _$actionInfo = _$_LoginPresenterMobxBaseActionController.startAction(
        name: '_LoginPresenterMobxBase._onValidateForm');
    try {
      return super._onValidateForm();
    } finally {
      _$_LoginPresenterMobxBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void _onEmailChangeEvent(String newEmail) {
    final _$actionInfo = _$_LoginPresenterMobxBaseActionController.startAction(
        name: '_LoginPresenterMobxBase._onEmailChangeEvent');
    try {
      return super._onEmailChangeEvent(newEmail);
    } finally {
      _$_LoginPresenterMobxBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void _onPasswordChangeEvent(String newPassword) {
    final _$actionInfo = _$_LoginPresenterMobxBaseActionController.startAction(
        name: '_LoginPresenterMobxBase._onPasswordChangeEvent');
    try {
      return super._onPasswordChangeEvent(newPassword);
    } finally {
      _$_LoginPresenterMobxBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void _onShowLoadingEvent() {
    final _$actionInfo = _$_LoginPresenterMobxBaseActionController.startAction(
        name: '_LoginPresenterMobxBase._onShowLoadingEvent');
    try {
      return super._onShowLoadingEvent();
    } finally {
      _$_LoginPresenterMobxBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void _onHideLoadingEvent() {
    final _$actionInfo = _$_LoginPresenterMobxBaseActionController.startAction(
        name: '_LoginPresenterMobxBase._onHideLoadingEvent');
    try {
      return super._onHideLoadingEvent();
    } finally {
      _$_LoginPresenterMobxBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void _onAuthErrorEvent(String error) {
    final _$actionInfo = _$_LoginPresenterMobxBaseActionController.startAction(
        name: '_LoginPresenterMobxBase._onAuthErrorEvent');
    try {
      return super._onAuthErrorEvent(error);
    } finally {
      _$_LoginPresenterMobxBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
emailError: ${emailError},
passwordError: ${passwordError},
email: ${email},
password: ${password},
authError: ${authError},
authSuccess: ${authSuccess},
isFormValid: ${isFormValid},
isLoading: ${isLoading}
    ''';
  }
}
