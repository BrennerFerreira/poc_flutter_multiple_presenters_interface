import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'components/components.dart';
import 'components/loading_dialog.dart';
import 'components/snack_bar.dart';
import 'login_presenter.dart';

class LoginPage extends StatelessWidget {
  final LoginPresenter loginPresenter;
  const LoginPage(this.loginPresenter, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    void _hideKeyboard() {
      final currentFocus = FocusScope.of(context);
      if (!currentFocus.hasPrimaryFocus) {
        currentFocus.unfocus();
      }
    }

    return Scaffold(
      body: Builder(
        builder: (context) {
          loginPresenter.isLoadingStream.listen((isLoading) {
            if (isLoading) {
              showLoading(context);
            } else {
              hideLoading(context);
            }
          });

          loginPresenter.authErrorStream.listen((authError) {
            if (authError?.isNotEmpty == true) {
              showErrorMessage(context, text: authError!);
            }
          });

          loginPresenter.authSuccessStream.listen((success) {
            if (success) {
              showSuccessMessage(context);
            }
          });

          return GestureDetector(
            onTap: _hideKeyboard,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(32.0),
                    child: Provider<LoginPresenter>(
                      create: (context) => loginPresenter,
                      child: Form(
                        child: Column(
                          children: [
                            const EmailInput(),
                            const Padding(
                              padding: EdgeInsets.only(top: 8.0, bottom: 32),
                              child: PasswordInput(),
                            ),
                            const LoginButton(),
                            TextButton.icon(
                              onPressed: () {},
                              icon: const Icon(Icons.person),
                              label: const Text("Criar conta"),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
