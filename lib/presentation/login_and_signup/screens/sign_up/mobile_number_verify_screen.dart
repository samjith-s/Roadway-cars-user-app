import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:lottie/lottie.dart';
import 'package:roadway/application/signin/signin_cubit.dart';
import 'package:roadway/core/constants/colors.dart';
import 'package:roadway/firebase_functions.dart';

class MobileVerificationScreen extends StatefulWidget {
  const MobileVerificationScreen({Key? key}) : super(key: key);

  @override
  State<MobileVerificationScreen> createState() => _MobileVerificationScreenState();
}

class _MobileVerificationScreenState extends State<MobileVerificationScreen> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late TextEditingController _numberController;
  GlobalKey<FormState> _formKey = GlobalKey();
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: const Duration(seconds: 5));
    _numberController = TextEditingController();
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    _numberController.dispose();
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
                  controller: _controller,
                  repeat: false,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 22,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const OTPVerificationText(),
                  const SizedBox(height: 10),
                  Text(
                    'We will send you a One Time Password on \nthis mobile number',
                    style: GoogleFonts.roboto(
                      fontWeight: FontWeight.w600,
                      color: darkGrey,
                      fontSize: 12,
                      height: 1.5,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Form(
                      key: _formKey,
                      child: IntlPhoneField(
                        validator: (value) {
                          if (value == null || value.completeNumber.isEmpty || value.number.length < 10) {
                            return 'enter a valid number';
                          }
                        },
                        onChanged: (value) {
                          _numberController.text = value.completeNumber;
                        },
                        //controller: _numberController,
                        initialCountryCode: 'IN',
                        showDropdownIcon: false,
                      )),
                  BlocBuilder<SigninCubit, SigninState>(
                    builder: (context, state) {
                      return Visibility(
                        visible: state.showError,
                        child: Text(state.errorMsg),
                      );
                    },
                  ),
                  const SizedBox(height: 30),
                  SignInScreenLargeButton(
                    text: 'Get OTP',
                    onPressed: () async {
                      if (!_formKey.currentState!.validate()) {
                        BlocProvider.of<SigninCubit>(context).changeError(
                          errorMsg: 'This is not a valid number',
                          showError: true,
                        );
                        return;
                      }
                      BlocProvider.of<SigninCubit>(context).changeError(errorMsg: '', showError: false);

                      await verifyPhoneNumber(
                        context: context,
                        number: _numberController.text,
                      );
                    },
                  )
                ],
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}

class SignInScreenLargeButton extends StatelessWidget {
  final String text;
  final void Function() onPressed;
  const SignInScreenLargeButton({
    required this.onPressed,
    required this.text,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          primary: kGreen,
        ),
        child: Text(
          text,
          style: GoogleFonts.poppins(
            fontSize: 16,
            color: kWhite,
            fontWeight: FontWeight.bold
          ),
        ),
      ),
    );
  }
}

class OTPVerificationText extends StatelessWidget {
  const OTPVerificationText({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      'OTP Verification',
      style: GoogleFonts.notoSerif(fontSize: 20, fontWeight: FontWeight.bold),
    );
  }
}

class SignInScreenBackButton extends StatelessWidget {
  final void Function()? onPressed;
  const SignInScreenBackButton({
    required this.onPressed,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 25),
      decoration: BoxDecoration(
        border: Border.all(color: kGray),
        borderRadius: BorderRadius.circular(10),
      ),
      width: 40,
      height: 40,
      child: IconButton(
        onPressed: onPressed,
        icon: const Icon(
          Icons.keyboard_arrow_left,
        ),
      ),
    );
  }
}
