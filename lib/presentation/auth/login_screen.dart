// import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/presentation/auth/sign_up_screen.dart';
import 'package:news_app/presentation/news/news_screen.dart';
import 'package:news_app/presentation/utils/info_toast.dart';

import '../../application/auth_bloc/auth_bloc.dart';
import 'widgets/gradient_button.dart';
import 'widgets/login_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

AuthBloc authBloc = AuthBloc();

class _LoginScreenState extends State<LoginScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  bool isObscured = true;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    authBloc.add(UserAlreadySignedInEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: BlocConsumer<AuthBloc, AuthState>(
          bloc: authBloc,
          listener: (context, state) {
            if (state is AuthSuccess) {
              InfoToast.successToast(context, "Login successful");
              Navigator.of(context).pushReplacement(MaterialPageRoute(
                builder: (context) => const NewsScreen(),
              ));
            }
            if (state is AuthFailure) {
              InfoToast.errorToast(context, state.error);
            }
            if (state is SignInFailed) {}
          },
          builder: (context, state) {
            return Center(
              child: Column(
                children: [
                  const SizedBox(height: 40),
                  Image.asset('assets/signin_balls.png'),
                  const Text(
                    'Sign In.',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 50,
                    ),
                  ),
                  const SizedBox(height: 50),
                  LoginField(
                    hintText: 'Email',
                    controller: emailController,
                  ),
                  const SizedBox(height: 15),
                  LoginField(
                    hintText: 'Password',
                    controller: passwordController,
                    isPasswordField: true,
                    isObscureText: isObscured,
                    onTap: () {
                      setState(() {
                        isObscured = !isObscured;
                      });
                    },
                  ),
                  const SizedBox(height: 20),
                  state is AuthLoading
                      ?
                      // CupertinoActivityIndicator
                      const CupertinoActivityIndicator()
                      : GradientButton(
                          text: "Sign in",
                          onPressed: () {
                            authBloc.add(SignInEvent(
                              email: emailController.text.trim(),
                              password: passwordController.text.trim(),
                            ));
                          },
                        ),
                  const SizedBox(
                    height: 10,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (context) => const SignUpScreen(),
                      ));
                    },
                    child: const Text.rich(
                        TextSpan(text: "Don't have Account ? ", children: [
                      TextSpan(
                          text: "Sign Up",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                              decoration: TextDecoration.underline))
                    ])),
                  )
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
