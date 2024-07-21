import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '/auth/auth.dart';
import '/core/core.dart';

class DashboardView extends StatelessWidget {
  const DashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      ///
      appBar: AppBar(
        title: const Text('Dashboard View'),
        actions: const [
          _LogOutButton(),
        ],
      ),

      ///
      body: const Center(
        child: Text(
          'DashboardView',
        ),
      ),
    );
  }
}

class _LogOutButton extends StatelessWidget {
  const _LogOutButton();

  @override
  Widget build(BuildContext context) {
    ///
    return BlocListener<LoginBloc, LoginState>(
      ///
      listener: _onStateChangedListener,

      ///
      child: IconButton(
        icon: const Icon(
          Icons.logout_outlined,
        ),
        onPressed: () async {
          ///
          context.read<LoginBloc>().add(LogoutRequested());
        },
      ),
    );
  }

  void _onStateChangedListener(BuildContext context, LoginState state) {
    ///
    if (state.status == LoginStatus.unAuthenticated) {
      final successText = Text(
        context.translate.logoutMessageSuccess,
        style: const TextStyle(
          color: Colors.white,
        ),
      );
      final snackBar = SnackBar(
        content: successText,
        backgroundColor: Theme.of(context).colorScheme.primary,
      );

      ScaffoldMessenger.of(context)
        ..hideCurrentSnackBar()
        ..showSnackBar(snackBar);

      /// [Login Sayfasına Git]
      context.go('/login');
    }
  }
}
