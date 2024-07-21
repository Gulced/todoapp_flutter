import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '/core/core.dart';
import '/login/login.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    ///
    return BlocProvider<LoginBloc>(
      create: (context) => getIt<LoginBloc>(),

      ///
      child: MaterialApp.router(
        routerConfig: router,

        ///
        theme: AppTheme.lightTheme,
        darkTheme: AppTheme.darkTheme,
      ),
    );
  }
}
