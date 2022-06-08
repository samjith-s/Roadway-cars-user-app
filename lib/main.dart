import 'package:flutter/material.dart';
import 'package:roadway/core/constants/colors.dart';
import 'package:roadway/presentation/onbaording/screens/first_onboarding_screen.dart';
import 'package:roadway/presentation/widgets/common_screen_scaffold.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(

        scaffoldBackgroundColor: kScaffoldColor,
        appBarTheme: const AppBarTheme(
          backgroundColor: kWhite,
          elevation: 0,
        ),
        primarySwatch: Colors.blue,
      ),
      home: const OnboardingPageView(),
    );
  }
}
