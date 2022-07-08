import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:roadway/application/internet/internet_cubit.dart';
import 'package:roadway/core/constants/colors.dart';
import 'package:roadway/core/toast.dart';
import 'package:roadway/firebase_functions.dart';
import 'package:roadway/presentation/login_and_signup/screens/login/forgot_password_screen.dart';
import 'package:roadway/presentation/login_and_signup/screens/sign_up/email_detials_add_screen.dart';
import 'package:roadway/presentation/login_and_signup/screens/sign_up/mobile_number_verify_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late TextEditingController _emailController;
  late TextEditingController _passwordController;
  GlobalKey<FormState> formKey = GlobalKey();
  @override
  void initState() {
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kWhite,
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Stack(
          children: [
            Positioned(
              top: MediaQuery.of(context).size.height * .1,
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Lottie.asset(
                  'lib/core/assets/lotties/login_car.json',
                ),
              ),
            ),
            Positioned(
              top: 60,
              left: 5,
              child: SignInScreenBackButton(
                onPressed: () {},
              ),
            ),
            Positioned(
              left: 25,
              top: MediaQuery.of(context).size.height * .45,
              child: SizedBox(
                width: MediaQuery.of(context).size.width - 50,
                child: Form(
                  key: formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      SignUpPageTextFieldWidget(
                        keyboardType: TextInputType.emailAddress,
                        obscure: false,
                        controller: _emailController,
                        fieldIcon: Icons.alternate_email_outlined,
                        hintText: 'Email address',
                        validator: (value) {
                          if (!RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                              .hasMatch(value!)) {
                            return 'Enter a valid email address';
                          } else {
                            return null;
                          }
                        },
                      ),
                      const SizedBox(height: 15),
                      SignUpPageTextFieldWidget(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter the password';
                          } else {
                            return null;
                          }
                        },
                        obscure: true,
                        controller: _passwordController,
                        fieldIcon: Icons.lock_outlined,
                        hintText: 'Password',
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: ((context) => const ForgetPasswordScreen()),
                            ),
                          );
                        },
                        child: Text(
                          'Forget password?',
                          style: GoogleFonts.poppins(
                            fontSize: 12,
                            color: kBlack,
                          ),
                        ),
                      ),
                      BlocBuilder<InternetCubit, InternetState>(
                        builder: (context, state) {
                          return SignInScreenLargeButton(
                            onPressed: () async {
                              if (!state.networkOn) {
                                showToast(
                                  msg: 'No network connection, Please check your connection',
                                  bgcolor: kBlack,
                                );

                                return;
                              }
                              if (!formKey.currentState!.validate()) {
                                return;
                              }
                              await loginWithEmailAndPassword(
                                context: context,
                                password: _passwordController.text.trim(),
                                email: _emailController.text.trim(),
                              );
                            },
                            text: 'Login In',
                          );
                        },
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            'Not a member?',
                            style: GoogleFonts.poppins(
                              fontSize: 12,

                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: ((context) => const MobileVerificationScreen()),
                                ),
                              );
                            },
                            child: Text(
                              'Sign In',
                              style: GoogleFonts.poppins(
                                fontSize: 12,
                                color: kOrenge,
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class LoginScreenTextFieldWidget extends StatelessWidget {
  final String labelText;

  const LoginScreenTextFieldWidget({
    required this.labelText,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        labelText: labelText,
        labelStyle: const TextStyle(fontSize: 18, color: kBlack),
        floatingLabelBehavior: FloatingLabelBehavior.always,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: kBlack, width: .6),
        ),
        fillColor: kGray.withOpacity(.4),
        filled: true,
      ),
    );
  }
}
