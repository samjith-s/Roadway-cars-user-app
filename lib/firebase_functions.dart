import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:roadway/core/constants/colors.dart';
import 'package:roadway/core/toast.dart';
import 'package:roadway/presentation/login_and_signup/screens/login/login_screen.dart';
import 'package:roadway/presentation/login_and_signup/screens/sign_up/email_detials_add_screen.dart';
import 'package:roadway/presentation/login_and_signup/screens/sign_up/otp_verification_screen.dart';
import 'package:roadway/presentation/widgets/common_screen_scaffold.dart';

import 'application/signin/signin_cubit.dart';

Future<void> verifyPhoneNumber(
    {required BuildContext context, required String number}) async {
  final auth = FirebaseAuth.instance;
  auth.verifyPhoneNumber(
    phoneNumber: number,
    timeout: const Duration(seconds: 120),
    verificationCompleted: (PhoneAuthCredential credential) async {
      await auth.signInWithCredential(credential).then((value) {
        BlocProvider.of<SigninCubit>(context)
            .changeError(errorMsg: 'Signin successful', showError: true);
      });

      Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(
          builder: (context) => const AddUserDetailsScreen(),
        ),
        (route) => false,
      );
    },
    verificationFailed: (FirebaseAuthException e) {
      if (e.code == 'invalid-phone-number') {
        BlocProvider.of<SigninCubit>(context).changeError(
            errorMsg: 'This is not a valid number', showError: true);
      } else if (e.code == 'network-request-failed') {
        BlocProvider.of<SigninCubit>(context).changeError(
            errorMsg: 'No internet connection. Check your connection',
            showError: true);
      } else {
        BlocProvider.of<SigninCubit>(context)
            .changeError(errorMsg: e.code.toString(), showError: true);
      }
    },
    codeSent: (String verificationId, int? resendToken) async {
      BlocProvider.of<SigninCubit>(context)
          .changeVerificationId(verificationId);
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: ((context) => OTPVerificationScreen(
                mobile: number,
              )),
        ),
      );
    },
    codeAutoRetrievalTimeout: (String verificationId) {
      log('timeout');
    },
  );
}

Future<void> signInWithMobileNumberVerification(
    {required SigninState state,
    required BuildContext context,
    required String smsCode}) async {
  final auth = FirebaseAuth.instance;
  PhoneAuthCredential credential = PhoneAuthProvider.credential(
    verificationId: state.verificationId!,
    smsCode: smsCode,
  );
  BlocProvider.of<SigninCubit>(context).changeError(
    errorMsg: '',
    showError: false,
  );

  try {
    await auth.signInWithCredential(credential).then((value) {
      BlocProvider.of<SigninCubit>(context)
          .changeError(errorMsg: '', showError: false);
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(
            builder: ((context) => const AddUserDetailsScreen()),
          ),
          (route) => false);
    });
  } on FirebaseAuthException catch (e) {
    BlocProvider.of<SigninCubit>(context).changeError(
      errorMsg: e.message.toString(),
      showError: true,
    );
  } catch (e) {
    BlocProvider.of<SigninCubit>(context).changeError(
      errorMsg: 'Something went wrong. Please check otp and your connection.',
      showError: true,
    );
  }
}

Future<void> linkEmailWithPhoneNumber(
    {required AuthCredential credential,
    required BuildContext context,
    required String name}) async {
  BlocProvider.of<SigninCubit>(context).changeError(
    errorMsg: "",
    showError: false,
  );
  try {
    final userCredential = await FirebaseAuth.instance.currentUser
        ?.linkWithCredential(credential)
        .then(
          (value) => value.user!
            ..updateDisplayName(name).then(
              (value) => Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(
                  builder: ((context) => const LoginScreen()),
                ),
                ((route) => false),
              ),
            ),
        );
  } on FirebaseAuthException catch (e) {
    switch (e.code) {
      case "provider-already-linked":
        BlocProvider.of<SigninCubit>(context).changeError(
          errorMsg: 'The provider has already been linked to the user.',
          showError: true,
        );

        break;
      case "invalid-credential":
        BlocProvider.of<SigninCubit>(context).changeError(
          errorMsg: "The provider's credential is not valid.",
          showError: true,
        );
        break;
      case "credential-already-in-use":
        BlocProvider.of<SigninCubit>(context).changeError(
          errorMsg:
              '"The account corresponding to the credential already exists, " "or is already linked to a Firebase User."',
          showError: true,
        );

        break;
      default:
        BlocProvider.of<SigninCubit>(context).changeError(
          errorMsg: e.toString(),
          showError: true,
        );
    }
  }
}

Future<void> loginWithEmailAndPassword(
    {required BuildContext context,
    required String email,
    required String password}) async {
  try {
    final user = (await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: email, //,
      password: password,
    ))
        .user;

    if (user != null) {
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(
            builder: ((context) => const CommonScreenScaffold()),
          ),
          (route) => false);
    } else {
      print('wrong password');
    }
  } on FirebaseAuthException catch (e) {
    showToast(
      msg: e.message.toString(),
      bgcolor: kBlack,
    );
  } catch (e) {
    showToast(
      msg: e.toString(),
      bgcolor: kBlack,
    );
  }
}
