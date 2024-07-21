import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'auth/auth.dart';
import 'core/core.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    ///
    return BlocProvider<LoginBloc>(
      create: (context) => getIt<LoginBloc>(),

      ///
      child: MaterialApp.router(
        title: 'BTK Todo',
        debugShowCheckedModeBanner: false,

        /// [Router]
        routerConfig: router,

        /// [Theme]
        theme: AppTheme.lightTheme,
        darkTheme: AppTheme.darkTheme,

        /// [L10n]
        /// Delegate: Temsilci Listesi
        localizationsDelegates: AppLocalizations.localizationsDelegates,

        /// Desteklenen Diller
        supportedLocales: AppLocalizations.supportedLocales,
      ),
    );
  }
}
