import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/presentation/auth/sign_up_screen.dart';

import '../news/news_screen.dart';
import 'widgets/gradient_button.dart';
import 'widgets/login_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
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
              ),
              const SizedBox(height: 20),
              // state is AuthLoading
              //     ?
              //     // CupertinoActivityIndicator
              //     const CupertinoActivityIndicator()
              //     :
              GradientButton(
                text: "Sign in",
                onPressed: () {
                  // context.read<AuthBloc>().add(AuthLoginRequested(
                  //     email: emailController.text.trim(),
                  //     password: passwordController.text.trim()));
                  // context.read<AuthBloc>().add(SignInEvent(
                  //       email: emailController.text.trim(),
                  //       password: passwordController.text.trim(),
                  //     ));
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (context) => const NewsScreen(),
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
        ),
      ),
    );
  }
}
