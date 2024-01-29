import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/application/news_bloc.dart';
import 'package:news_app/presentation/auth/login_screen.dart';

 import 'presentation/utils/constants.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Assignment',
      // theme: ThemeData.dark().copyWith(
      //   scaffoldBackgroundColor: Pallete.backgroundColor,
      // ),
      // theme: ThemeData(
      //   colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      //   appBarTheme: const AppBarTheme(backgroundColor: Colors.teal),
      //   useMaterial3: true,
      // ),
      home:
          //
          BlocProvider(
        create: (_) => NewsBloc(),
        child: const LoginScreen(),
        // child: const NewsScreen(),
      ),
    );
  }
}
