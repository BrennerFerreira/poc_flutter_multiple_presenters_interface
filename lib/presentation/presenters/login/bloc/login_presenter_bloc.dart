import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../../ui/pages/login/login_presenter.dart';
import '../../../protocols/validation.dart';

part 'login_presenter_event.dart';
part 'login_presenter_state.dart';

class LoginPresenterBloc extends Bloc<LoginPresenterEvent, LoginPresenterState>
    implements LoginPresenter {
  final Validation validation;

  LoginPresenterBloc({
    required this.validation,
  }) : super(LoginPresenterInitial()) {
    on<EmailChanged>(_onEmailChangeEvent);
    on<PasswordChanged>(_onPasswordChangeEvent);
    on<ValidateFormRequested>(_onValidateForm);
    on<ShowLoading>(_onShowLoadingEvent);
    on<HideLoading>(_onHideLoadingEvent);
    on<ShowAuthError>(_onAuthErrorEvent);
    on<LoginRequested>(_onLoginRequested);
  }

  void _onValidateForm(
    ValidateFormRequested event,
    Emitter<LoginPresenterState> emit,
  ) {
    final isFormValid = state.emailError == null &&
        state.passwordError == null &&
        state.emailTouched &&
        state.passwordTouched;

    emit(state.copyWith(isFormValid: isFormValid));
  }

  void _onEmailChangeEvent(
    EmailChanged event,
    Emitter<LoginPresenterState> emit,
  ) {
    final emailValidation = validation.validate(
      field: "email",
      value: event.newEmail,
    );

    emit(state.copyWith(
      authError: "",
      email: event.newEmail,
      emailError: emailValidation ?? "",
      emailTouched: true,
      authSuccess: false,
    ));

    add(ValidateFormRequested());
  }

  void _onPasswordChangeEvent(
    PasswordChanged event,
    Emitter<LoginPresenterState> emit,
  ) {
    final passwordValidation = validation.validate(
      field: "password",
      value: event.newPassword,
    );

    emit(state.copyWith(
      authError: "",
      password: event.newPassword,
      passwordError: passwordValidation ?? "",
      passwordTouched: true,
      authSuccess: false,
    ));

    add(ValidateFormRequested());
  }

  void _onShowLoadingEvent(
    ShowLoading event,
    Emitter<LoginPresenterState> emit,
  ) {
    emit(state.copyWith(isLoading: true));
  }

  void _onHideLoadingEvent(
    HideLoading event,
    Emitter<LoginPresenterState> emit,
  ) {
    emit(state.copyWith(isLoading: false));
  }

  void _onAuthErrorEvent(
    ShowAuthError event,
    Emitter<LoginPresenterState> emit,
  ) {
    emit(state.copyWith(authError: event.message, isLoading: false));
  }

  Future<void> _onLoginRequested(
    LoginRequested event,
    Emitter<LoginPresenterState> emit,
  ) async {
    emit(state.copyWith(
      authSuccess: false,
    ));
    add(ShowLoading());
    await Future.delayed(const Duration(seconds: 3));
    if (state.email == 'teste@teste.com' && state.password == '123456') {
      emit(state.copyWith(
        authSuccess: true,
      ));
    } else {
      emit(state.copyWith(
        authError: "Email e/ou senha incorretos",
      ));
    }

    add(HideLoading());
  }

  @override
  Stream<String?> get authErrorStream => stream.map((event) => event.authError);

  @override
  Stream<String?> get emailErrorStream => stream.map(
        (event) => event.emailError,
      );

  @override
  Stream<bool> get isFormValidStream => stream.map(
        (event) => event.isFormValid,
      );

  @override
  Stream<bool> get isLoadingStream =>
      stream.map((event) => event.isLoading).distinct();

  @override
  Stream<bool> get authSuccessStream => stream.map(
        (event) => event.authSuccess,
      );

  @override
  Stream<String?> get passwordErrorStream => stream.map(
        (event) => event.passwordError,
      );

  @override
  void validateEmail(String email) {
    add(EmailChanged(email));
  }

  @override
  void validatePassword(String password) {
    add(PasswordChanged(password));
  }

  @override
  Future<void> auth() async {
    add(LoginRequested());
  }

  @override
  void dispose() {
    super.close();
  }
}
