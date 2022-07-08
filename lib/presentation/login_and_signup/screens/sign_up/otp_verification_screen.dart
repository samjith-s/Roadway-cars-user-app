import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:roadway/application/signin/signin_cubit.dart';
import 'package:roadway/core/constants/colors.dart';
import 'package:roadway/firebase_functions.dart';
import 'package:roadway/presentation/login_and_signup/screens/sign_up/mobile_number_verify_screen.dart';

class OTPVerificationScreen extends StatefulWidget {
  final String mobile;
  const OTPVerificationScreen({Key? key, required this.mobile}) : super(key: key);

  @override
  State<OTPVerificationScreen> createState() => _OTPVerificationScreenState();
}

class _OTPVerificationScreenState extends State<OTPVerificationScreen> with SingleTickerProviderStateMixin {
  late TextEditingController _controller;
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 6),
    );

    _animationController.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kWhite,
      body: SingleChildScrollView(
        reverse: true,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 80),
            SignInScreenBackButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            Align(
              child: SizedBox(
                height: MediaQuery.of(context).size.height * .3,
                child: Lottie.asset(
                  'lib/core/assets/lotties/sms_send.json',
                  controller: _animationController,
                  repeat: false,
                ),
              ),
            ),
            // Lottie.asset(
            //   'lib/core/assets/lotties/sms_send.json',
            //   controller: _animationController,
            // ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 22,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const OTPVerificationText(),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      Text(
                        'Enter the OTP send to ',
                        style: GoogleFonts.roboto(
                          fontWeight: FontWeight.w600,
                          color: darkGrey,
                          fontSize: 12,
                          height: 1.5,
                        ),
                      ),
                      Text(
                        widget.mobile,
                        style: GoogleFonts.roboto(
                          fontWeight: FontWeight.w600,
                          color: kBlack,
                          fontSize: 13,
                          height: 1.5,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.only(left: 8, right: 8, bottom: 20),
                    child: PinCodeTextField(
                      controller: _controller,
                      pinTheme: PinTheme(
                        shape: PinCodeFieldShape.underline,
                        activeColor: kGreen,
                        inactiveColor: kGray,
                        selectedColor: kBlack,
                        borderRadius: BorderRadius.circular(15),
                        fieldHeight: 50,
                        activeFillColor: Colors.white,
                        borderWidth: 2,
                      ),
                      appContext: context,
                      length: 6,
                      onChanged: (value) {
                        log(value);
                      },
                      onCompleted: (value) async {},
                    ),
                  ),
                  BlocBuilder<SigninCubit, SigninState>(
                    builder: (context, state) {
                      return Visibility(visible: state.showError, child: Text(state.errorMsg));
                    },
                  ),
                  //const SizedBox(height: 20),
                  BlocBuilder<SigninCubit, SigninState>(
                    builder: (context, state) {
                      return SignInScreenLargeButton(
                        text: 'Submit',

                        onPressed: () async {
                          await signInWithMobileNumberVerification(
                            state: state,
                            context: context,
                            smsCode: _controller.text,
                          );
                        },
                      );
                    },
                  ),
                  //const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        "Don't receive the OTP?",
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w500,
                          color: darkGrey,
                          fontSize: 12,
                          height: 1.5,
                        ),
                      ),
                      //const SizedBox(width: 4),
                      TextButton(
                        onPressed: () async {
                          BlocProvider.of<SigninCubit>(context).changeError(
                              errorMsg: 'Something went wrong. Please check otp and your connection.', showError: true);

                          await verifyPhoneNumber(
                            context: context,
                            number: widget.mobile,
                          );
                        },
                        child: Text(
                          'Resend',
                          style: GoogleFonts.roboto(
                            fontWeight: FontWeight.w600,
                            color: kGreen,
                            fontSize: 12,
                            height: 1.5,
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
