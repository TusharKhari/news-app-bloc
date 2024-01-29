import 'package:flutter/material.dart';
import 'package:news_app/presentation/auth/login_screen.dart';
import 'package:news_app/presentation/news/news_screen.dart';

import 'widgets/gradient_button.dart';
import 'widgets/login_field.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

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
              ),
              const SizedBox(height: 20),
              LoginField(
                hintText: 'Confirm Password',
                controller: confirmPasswordController,
              ),
              const SizedBox(height: 20),
              GradientButton(
                text: "Sign up",
                onPressed: () {
                  // if (passwordController.text ==
                  //     confirmPasswordController.text) {
                  //   context.read<AuthBloc>().add(SignUpEvent(
                  //         email: emailController.text.trim(),
                  //         password: passwordController.text.trim(),
                  //       ));
                  // }
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
      ),
    );
  }
}
