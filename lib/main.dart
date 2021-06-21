import 'package:chew_one/network/news_repo.dart';
import 'package:chew_one/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc/news_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //providing bloc to the home screen widget
      home: BlocProvider(
        create: (context) => NewsBloc(newsRepo: NewsRepo()),
        child: HomeScreen(),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
