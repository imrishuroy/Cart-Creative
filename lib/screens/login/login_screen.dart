import 'package:cart_creative/repositories/auth/auth_repository.dart';
import 'package:cart_creative/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';

import 'cubit/login_cubit.dart';

class LoginScreen extends StatelessWidget {
  static const String routeName = '/login';

  const LoginScreen({Key? key}) : super(key: key);

  static Route route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (context) => BlocProvider<LoginCubit>(
        create: (_) =>
            LoginCubit(authRepository: context.read<AuthRepository>()),
        child: const LoginScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;

    // SystemChrome.setSystemUIOverlayStyle(
    //   const SystemUiOverlayStyle(
    //     statusBarColor: Colors.black54,
    //     //statusBarColor: Color.fromRGBO(25, 23, 37, 1),
    //     // statusBarColor: Color(0XFF00286E),
    //     //  statusBarColor: Color.fromRGBO(0, 141, 82, 1),
    //     statusBarIconBrightness: Brightness.light,
    //   ),
    // );
    return WillPopScope(
      onWillPop: () async => false,
      child: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: BlocConsumer<LoginCubit, LoginState>(
          listener: (context, state) {
            if (state.status == LoginStatus.error) {
              showDialog(
                context: context,
                builder: (context) => ErrorDialog(
                  content: state.failure.message,
                ),
              );
            }
          },
          builder: (context, state) {
            return Scaffold(
              backgroundColor: Colors.black54,
              //   backgroundColor: Color.fromRGBO(29, 38, 40, 1),
              body: state.status == LoginStatus.submitting
                  ? const Padding(
                      padding: EdgeInsets.only(top: 20.0),
                      child: Center(
                        child: CircularProgressIndicator(),
                      ),
                    )
                  : Padding(
                      padding: const EdgeInsets.only(
                          top: 22.0, left: 20.0, right: 20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          GreetingsWidget(height: height),
                          // SizedBox(height: height < 750 ? 15.0 : 12.0),
                          const Spacer(),
                          SizedBox(
                            width: 250.0,
                            child: SignInWithAppleButton(
                              onPressed: () {
                                context.read<LoginCubit>().appleLogin();
                              },
                              style: SignInWithAppleButtonStyle.white,
                            ),
                          ),
                          const SizedBox(height: 20.0),
                          GoogleSignInButton(
                            onPressed: () =>
                                context.read<LoginCubit>().googleSignIn(),
                            title: 'Sign in with Google',
                          ),
                          const SizedBox(height: 300.0)
                        ],
                      ),
                    ),
            );
          },
        ),
      ),
    );
  }
}
