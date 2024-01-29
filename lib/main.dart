import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/application/auth_bloc/auth_bloc.dart';
import 'package:news_app/presentation/auth/login_screen.dart';

import 'application/news bloc/news_bloc.dart';
import 'firebase_options.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
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
        home: MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) => AuthBloc(),
            ),
            BlocProvider(
              create: (context) => NewsBloc(),
            ),
          ],
          child: const LoginScreen(),
        ));
  }
}
