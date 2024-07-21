import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '/core/core.dart';
import '/login/login.dart';
import '/widgets/widgets.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const LoginViewBody(),
    );
  }
}

class LoginViewBody extends StatelessWidget {
  const LoginViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        /// [1] Logo
        _BtkAkademiLogo(),
        SizedBox(height: 60),

        /// [2] Username Field
        _UsernameField(),

        /// [3] Password Field
        SizedBox(height: 16),
        _PasswordField(),

        /// [4] Login Button
        SizedBox(height: 16),
        _LoginButton(),
      ],
    );
  }
}

class _BtkAkademiLogo extends StatelessWidget {
  const _BtkAkademiLogo();

  @override
  Widget build(BuildContext context) {
    return Assets.logos.btkAkademiLogo.image(
      width: 300,
      height: 150,
    );
  }
}

class _UsernameField extends StatelessWidget {
  const _UsernameField();

  @override
  Widget build(BuildContext context) {
    final read = context.read<LoginBloc>();
    final state = context.watch<LoginBloc>().state;

    return AppTextField(
      hintText: 'Kullanıcı Adı',
      autoFillHints: const [AutofillHints.username],
      keyboardType: TextInputType.emailAddress,
      textInputAction: TextInputAction.next,
      prefix: const Icon(
        Icons.account_circle,
      ),

      /// [Event Tetikle]
      onChanged: (username) => read.add(
        LoginUsernameChanged(username),
      ),

      errorText: state.username.displayError?.errorText,
    );
  }
}

class _PasswordField extends StatelessWidget {
  const _PasswordField();

  @override
  Widget build(BuildContext context) {
    final read = context.read<LoginBloc>();
    final state = context.watch<LoginBloc>().state;

    return AppTextField(
      hintText: 'Parola',
      autoFillHints: const [AutofillHints.password],
      keyboardType: TextInputType.visiblePassword,
      textInputAction: TextInputAction.done,
      obscureText: true,
      // obscureText parametresi sebebiyle min/maxLine'a elle değer
      minLines: 1,
      maxLines: 1,
      prefix: const Icon(
        Icons.lock,
      ),

      /// [Event Tetikle]
      onChanged: (password) => read.add(
        LoginPasswordChanged(password),
      ),

      errorText: state.password.displayError?.errorText,
    );
  }
}

class _LoginButton extends StatelessWidget {
  const _LoginButton();

  @override
  Widget build(BuildContext context) {
    final read = context.read<LoginBloc>();
    final state = context.watch<LoginBloc>().state;

    ///
    return BlocListener<LoginBloc, LoginState>(
      listener: (context, state) {
        /// Giriş Hataylıysa
        if (state.status == LoginStatus.failure) {
          const snackBar = SnackBar(
            content: Text('Giriş Hatalı'),
          );

          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        }

        ///
        if (state.status == LoginStatus.authenticated) {
          final snackBar = SnackBar(
            content: Text('Giriş Başarılı. Hoşgeldin: ${state.username.value}'),
          );

          ScaffoldMessenger.of(context).showSnackBar(snackBar);

          GoRouter.of(context).go('/dashboard');
        }
      },

      ///
      child: ElevatedButton(
        ///
        onPressed: state.isValid
            ? () {
                /// Dismiss the Keyboard - Klavyeyi Kapat/Gizle
                FocusScope.of(context).unfocus();

                /// Kullanıcı Giriş İşlemi
                read.add(
                  LoginSubmitted(
                    state.username.value,
                    state.password.value,
                  ),
                );
              }

            /// isValid değilse Disable olarak göster
            : null,

        ///
        child: state.status == LoginStatus.loading ||
                state.status == LoginStatus.authenticated
            ? const CircularProgressIndicator(
                color: Colors.white,
              )
            : Text(
                'Oturum Aç',
                style: TextStyle(
                  fontSize: Theme.of(context).textTheme.titleMedium?.fontSize,
                ),
              ),
      ),
    );
  }
}
