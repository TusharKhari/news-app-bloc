import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/presentation/auth/login_screen.dart';
import 'package:news_app/presentation/auth/widgets/gradient_button.dart';
import 'package:news_app/presentation/news/news_screen.dart';
import 'package:news_app/presentation/utils/info_toast.dart';

import '../../application/auth_bloc/auth_bloc.dart';
import 'widgets/login_field.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  AuthBloc authBloc = AuthBloc();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  bool isObscured = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<AuthBloc, AuthState>(
          bloc: authBloc,
          listener: (context, state) {
            // TODO: implement listener
            if (state is AuthSuccess) {
              InfoToast.successToast(context, "SingUp successful");
              Navigator.of(context).pushReplacement(MaterialPageRoute(
                builder: (context) => const NewsScreen(),
              ));
            }
            if (state is AuthFailure) {
              InfoToast.errorToast(context, state.error);
            }
            if (state is SignUpFailed) {}
          },
          builder: (context, state) {
            return SingleChildScrollView(
              child: Center(
                child: Column(
                  children: [
                    const SizedBox(height: 40),
                    Image.asset('assets/signin_balls.png'),
                    const Text(
                      'Sign Up.',
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
                    LoginField(
                      hintText: 'Confirm Password',
                      controller: confirmPasswordController,
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
                        ? const CupertinoActivityIndicator()
                        : GradientButton(
                            text: "Sign up",
                            onPressed: () {
                              if (passwordController.text.length < 6) {
                                InfoToast.errorToast(context,
                                    "password length should be greater than 6");
                              } else if (passwordController.text ==
                                  confirmPasswordController.text) {
                                authBloc.add(SignUpEvent(
                                  email: emailController.text.trim(),
                                  password: passwordController.text.trim(),
                                ));
                              } else {
                                InfoToast.errorToast(
                                    context, "password doesn't match");
                              }
                            },
                          ),
                    const SizedBox(
                      height: 10,
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (context) => const LoginScreen(),
                        ));
                      },
                      child: const Text.rich(
                          TextSpan(text: "Already have Account ? ", children: [
                        TextSpan(
                            text: "Sign In",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                                decoration: TextDecoration.underline))
                      ])),
                    )
                  ],
                ),
              ),
            );
          }),
    );
  }
}
