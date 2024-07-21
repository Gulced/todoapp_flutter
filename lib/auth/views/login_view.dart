import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '/auth/auth.dart';
import '/core/core.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    ///
    return GestureDetector(
      /// Dismiss the Keyboard - Klavyeyi Kapat/Gizle
      onTap: () {
        final currentFocus = FocusScope.of(context);

        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },

      ///
      child: const Scaffold(
        ///
        body: LoginViewBody(),
      ),
    );
  }
}

class LoginViewBody extends StatelessWidget {
  const LoginViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 24,
      ),
      child: ScrollableColumn(
        children: [
          SizedBox(height: 100),

          /// [1] Logo
          _BtkAkademiLogo(),
          SizedBox(height: 50),

          /// [2] Username Field
          _UsernameField(),

          /// [3] Password Field
          SizedBox(height: 10),
          _PasswordField(),

          /// [4] Login Button
          SizedBox(height: 10),
          _LoginButton(),

          /// [5]
          SizedBox(height: 50),
          _DontHaveAnAccount(),
        ],
      ),
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
      hintText: context.translate.authFormUsername,
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

      errorText: state.username.displayError
          ?.errorText(context, context.translate.authFormUsername),
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
      hintText: context.translate.authFormPassword,
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

      errorText: state.password.displayError
          ?.errorText(context, context.translate.authFormPassword),
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
        /// Giriş Hatalı ise
        if (state.status == LoginStatus.failure) {
          final errorText = Text(
            context.translate.loginMessageError,
            style: const TextStyle(
              color: Colors.white,
            ),
          );

          final snackBar = SnackBar(
            content: errorText,
            backgroundColor: Theme.of(context).colorScheme.error,
          );

          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(snackBar);
        }

        ///
        if (state.status == LoginStatus.authenticated) {
          final successText = Text(
            context.translate.loginMessageSuccess(state.username.value),
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

          /// [Dashboard Sayfasına Git]
          context.go('/dashboard');
        }
      },

      ///
      child: AppElevatedButton(
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
            ? CircularProgressIndicator(
                color: Theme.of(context).colorScheme.onPrimary,
              )
            : Text(
                context.translate.authButtonLogIn,
                style: TextStyle(
                  fontSize: Theme.of(context).textTheme.titleMedium?.fontSize,
                ),
              ),
      ),
    );
  }
}

class _DontHaveAnAccount extends StatelessWidget {
  const _DontHaveAnAccount();

  @override
  Widget build(BuildContext context) {
    return AppTextButton(
      onPressed: () {
        /// [signup Sayfasına Git]
        context.go('/signup');
      },
      primaryText: context.translate.authNoAccount,
      actionText: context.translate.authButtonSignUp,
    );
  }
}
