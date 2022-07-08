import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:roadway/application/Chat/chat_cubit.dart';
import 'package:roadway/application/buy/buy_screen_bloc.dart';
import 'package:roadway/application/internet/internet_cubit.dart';
import 'package:roadway/application/pre_booking/pre_booking_cubit.dart';
import 'package:roadway/application/sell_request/sell_request_cubit.dart';
import 'package:roadway/application/signin/signin_cubit.dart';
import 'package:roadway/application/user/user_cubit.dart';
import 'package:roadway/core/constants/colors.dart';
import 'package:roadway/domain/dependency_injection/injectable.dart';
import 'package:roadway/local_notifications_services.dart';
import 'package:roadway/presentation/widgets/common_screen_scaffold.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();
  LocalNotificationService().initNotification();
  await configureInjection();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    log(' im called from main');

    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => SigninCubit()),
        BlocProvider(create: (context) => getIt<BuyScreenBloc>()),
        BlocProvider(create: (context) => SellRequestCubit()),
        BlocProvider(create: (context) => UserCubit()),
        BlocProvider(create: (context) => InternetCubit()),
        BlocProvider(create: (context) => getIt<ChatCubit>()),
        BlocProvider(create: (context) => getIt<PreBookingCubit>())
      ],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: ThemeData(
            scaffoldBackgroundColor: kScaffoldColor,
            appBarTheme: AppBarTheme(
              backgroundColor: kWhite,
              elevation: 0,
              iconTheme: const IconThemeData(color: kBlack),
              titleTextStyle: GoogleFonts.nunito(
                color: kBlack,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            primarySwatch: Colors.blue,
          ),
          home: CommonScreenScaffold()
          // StreamBuilder(
          //   stream: FirebaseAuth.instance.authStateChanges(),
          //   builder: (BuildContext context, AsyncSnapshot snapshot) {
          //     if (snapshot.connectionState == ConnectionState.active) {
          //       final bool signedIn = snapshot.hasData;
          //       return signedIn ? const CommonScreenScaffold() : const OnboardingPageView();
          //     }
          //     return Container();
          //   },
          // ),
          ),
    );
  }
}
