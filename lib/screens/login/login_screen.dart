import 'package:universal_platform/universal_platform.dart';

import '/repositories/auth/auth_repository.dart';
import '/widgets/widgets.dart';
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
    // final height = MediaQuery.of(context).size.height;

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
                          //const SizedBox(height: 100.0),
                          //GreetingsWidget(height: height),
                          const Spacer(),

                          Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const SizedBox(height: 10.0),

                              SizedBox(
                                height: 70.0,
                                width: 70.0,
                                child: Image.asset('assets/cart.png'),
                              ),
                              const SizedBox(
                                height: 20.0,
                              ),
                              const Text(
                                'Cart Creative',
                                style: TextStyle(
                                  fontSize: 28.0,
                                  color: Colors.white,
                                ),
                                textAlign: TextAlign.center,
                              ),

                              // Row(
                              //   mainAxisAlignment: MainAxisAlignment.start,
                              //   children: [
                              //     SizedBox(
                              //       height: 34.0,
                              //       width: 34.0,
                              //       child: Image.asset('assets/cart.png'),
                              //     ),
                              //     const SizedBox(width: 20.0),
                              //     const Text(
                              //       'Cart Creative',
                              //       style: TextStyle(
                              //         fontSize: 28.0,
                              //         color: Colors.white,
                              //       ),
                              //     ),
                              //   ],
                              // ),
                              const SizedBox(height: 150.0),
                              //const Spacer(),

                              const Text(
                                '@ your',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 40.0,
                                  fontWeight: FontWeight.w800,
                                  letterSpacing: 1.2,
                                ),
                                // textAlign: TextAlign.end,
                              ),

                              const Text(
                                '      door Step !',
                                style: TextStyle(
                                  color: Colors.blue,
                                  fontSize: 30,
                                ),
                                // textAlign: TextAlign.center,
                              ),
                            ],
                          ),

                          // SizedBox(height: height < 750 ? 15.0 : 12.0),
                          const Spacer(),

                          RichText(
                            textAlign: TextAlign.center,
                            text: const TextSpan(
                              children: [
                                TextSpan(text: 'By proceding, I Agree to the '),
                                TextSpan(
                                  text: 'T&C',
                                  style: TextStyle(color: Colors.green),
                                )
                              ],
                            ),
                          ),
                          // const Spacer(),
                          const SizedBox(height: 10.0),
                          if (UniversalPlatform.isIOS)
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
                          const SizedBox(height: 70.0)
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
