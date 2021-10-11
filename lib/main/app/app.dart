import 'package:flutter/material.dart';

import '../factories/pages/login/login_page_factory.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login Interface',
      home: makeLoginPage(),
    );
  }
}
