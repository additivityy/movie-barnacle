import 'package:flutter/material.dart';
import 'package:flutter_application_1/bloc/movies_bloc.dart';
import 'package:flutter_application_1/presentation/home_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: BlocProvider(
          create: (BuildContext context) => MoviesBloc(),
          child: const HomePage(),
        ));
  }
}
