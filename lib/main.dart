import 'package:bloc_lesson/count/count_bloc_cubit.dart';
import 'package:bloc_lesson/validate/validate_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'count/count_page.dart';
import 'validate/validate_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ValidateCubit(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(

          primarySwatch: Colors.blue,
        ),
        home: const ValidatePage(),
      ),
    );
  }
}


