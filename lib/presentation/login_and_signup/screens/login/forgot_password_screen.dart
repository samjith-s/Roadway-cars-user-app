import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:roadway/core/constants/colors.dart';
import 'package:roadway/core/constants/texts.dart';
import 'package:roadway/presentation/login_and_signup/screens/sign_up/email_detials_add_screen.dart';
import 'package:roadway/presentation/login_and_signup/screens/sign_up/mobile_number_verify_screen.dart';

TextEditingController _controller = TextEditingController();
GlobalKey<FormState> _formKey = GlobalKey();

class ForgetPasswordScreen extends StatelessWidget {
  const ForgetPasswordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: kWhite,
      body: SafeArea(
          child: SingleChildScrollView(
        reverse: true,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: size.height * .2),
              Align(
                child: SizedBox(
                  height: size.width * .5,
                  child: Lottie.asset(
                    'lib/core/assets/lotties/confusion.json',
                  ),
                ),
              ),
              kHeight15,
              Text('Forgot password?', style: GoogleFonts.montserrat(fontSize: 18, fontWeight: FontWeight.w600)),
              kHeight15,
              Text(
                'Enter your email adress below, We will send the link \nto reset your password in this email address..',
                style: GoogleFonts.hind(fontSize: 12, color: kBlack),
              ),
              kHeight25,
              Form(
                key: _formKey,
                child: SignUpPageTextFieldWidget(
                  obscure: false,
                  controller: _controller,
                  fieldIcon: Icons.alternate_email_outlined,
                  hintText: 'email',
                  validator: (value) {
                    if (!RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                        .hasMatch(value!)) {
                      return 'Enter a valid email address';
                    } else {
                      return null;
                    }
                  },
                ),
              ),
              kHeight25,
              SignInScreenLargeButton(
                text: 'Submit',
                onPressed: () async {
                  if (!_formKey.currentState!.validate()) {
                    return;
                  }
                  await FirebaseAuth.instance.sendPasswordResetEmail(email: _controller.text);
                  Navigator.of(context).pop();
                },
              )
            ],
          ),
        ),
      )),
    );
  }
}
