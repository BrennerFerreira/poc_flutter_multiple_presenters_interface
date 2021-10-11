import '../../../../presentation/presenters/login/bloc/login_presenter_bloc.dart';
import '../../../../presentation/presenters/login/mobx/login_presenter_mobx.dart';
import '../../../../ui/pages/login/login_presenter.dart';
import 'login_validation_factory.dart';

LoginPresenter makeBlocLoginPresenter() {
  return LoginPresenterBloc(
    validation: makeLoginValidation(),
  );
}

LoginPresenter makeMobxLoginPresenter() {
  return LoginPresenterMobx(
    validation: makeLoginValidation(),
  );
}
