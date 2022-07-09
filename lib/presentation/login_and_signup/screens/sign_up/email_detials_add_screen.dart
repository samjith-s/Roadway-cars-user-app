import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:roadway/application/internet/internet_cubit.dart';
import 'package:roadway/application/signin/signin_cubit.dart';
import 'package:roadway/core/constants/colors.dart';
import 'package:roadway/core/constants/texts.dart';
import 'package:roadway/core/utils/toast.dart';
import 'package:roadway/domain/user/user_model.dart';
import 'package:roadway/firebase_functions.dart';
import 'package:roadway/presentation/login_and_signup/screens/sign_up/mobile_number_verify_screen.dart';

class AddUserDetailsScreen extends StatefulWidget {
  const AddUserDetailsScreen({Key? key}) : super(key: key);

  @override
  State<AddUserDetailsScreen> createState() => _AddUserDetailsScreenState();
}

class _AddUserDetailsScreenState extends State<AddUserDetailsScreen> {
  late TextEditingController _nameController;
  late TextEditingController _emailController;
  late TextEditingController _firstPassController;
  late TextEditingController _secPassController;
  GlobalKey<FormState> _formkey = GlobalKey();
  String errorMsg = '';
  @override
  void initState() {
    _nameController = TextEditingController();
    _emailController = TextEditingController();
    _firstPassController = TextEditingController();
    _secPassController = TextEditingController();

    super.initState();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _firstPassController.dispose();
    _secPassController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      backgroundColor: kWhite,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 22.5),
            child: Form(
              key: _formkey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 40),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * .2,
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          GestureDetector(
                            onTap: () async {
                              var image = await ImagePicker().pickImage(
                                source: ImageSource.gallery,
                              );
                              if (image != null) {
                                BlocProvider.of<SigninCubit>(context).uploadImg(image);
                              }
                            },
                            child: BlocBuilder<SigninCubit, SigninState>(
                              builder: (context, state) {
                                return CircleAvatar(
                                  backgroundColor: kYellow,
                                  radius: 50,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(50),
                                    child: state.isImgUploding
                                        ? const Center(
                                            child: CircularProgressIndicator(),
                                          )
                                        : state.imgUrl == null
                                            ? const Image(
                                                image: NetworkImage(
                                                  'https://static.xx.fbcdn.net/assets/?revision=816167972411634&name=desktop-creating-an-account-icon&density=1',
                                                ),
                                                width: 100,
                                                height: 100,
                                                fit: BoxFit.cover,
                                              )
                                            : Image(
                                                image: NetworkImage(
                                                  state.imgUrl!,
                                                ),
                                                width: 100,
                                                height: 100,
                                                fit: BoxFit.cover,
                                              ),
                                  ),
                                );
                              },
                            ),
                          ),
                          kHeight10,
                          Text(
                            'Upload your profile photo',
                            style: GoogleFonts.poppins(fontSize: 13),
                          )
                        ],
                      ),
                    ),
                  ),
                  kHeight15,
                  SignUpPageTextFieldWidget(
                    obscure: false,
                    controller: _nameController,
                    fieldIcon: Icons.person_outline_outlined,
                    hintText: 'Full Name',
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please fill the form before submit';
                      } else {
                        return null;
                      }
                    },
                  ),
                  kHeight15,
                  SignUpPageTextFieldWidget(
                    obscure: false,
                    validator: (value) {
                      if (!RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                          .hasMatch(value ?? '')) {
                        return 'please enter a valid email';
                      } else {
                        return null;
                      }
                    },
                    controller: _emailController,
                    fieldIcon: Icons.alternate_email_outlined,
                    hintText: 'Email ID',
                  ),
                  kHeight15,
                  SignUpPageTextFieldWidget(
                    obscure: true,
                    controller: _firstPassController,
                    fieldIcon: Icons.lock_outline,
                    hintText: 'Password',
                  ),
                  kHeight15,
                  SignUpPageTextFieldWidget(
                    obscure: true,
                    controller: _secPassController,
                    fieldIcon: Icons.lock_outline,
                    hintText: 'Password',
                    validator: (value) {
                      if (value != _firstPassController.text) {
                        return 'Both passwords should be same';
                      } else if (value == null || value.isEmpty) {
                        return 'Please fill the form before submit';
                      } else if (value.length < 6) {
                        return 'Please choose a strong password';
                      } else {
                        return null;
                      }
                    },
                  ),
                  BlocBuilder<SigninCubit, SigninState>(
                    builder: (context, state) {
                      return Visibility(
                        visible: state.showError,
                        child: Text(state.errorMsg),
                      );
                    },
                  ),
                  const SizedBox(height: 35),
                  BlocBuilder<SigninCubit, SigninState>(
                    builder: (context, state) {
                      return BlocBuilder<InternetCubit, InternetState>(
                        builder: (context, netstate) {
                          return SignInScreenLargeButton(
                            onPressed: () async {
                              if (!netstate.networkOn) {
                                showToast(
                                  msg: 'No internet connection. Please check your connection',
                                  bgcolor: kBlack,
                                );
                                return;
                              }
                              if (!_formkey.currentState!.validate()) {
                                return;
                              }
                              final credential = EmailAuthProvider.credential(
                                email: _emailController.text.trim(),
                                password: _secPassController.text.trim(),
                              );

                              BlocProvider.of<SigninCubit>(context).addUserDetailsToFirebase(
                                UserModel(
                                  name: _nameController.text,
                                  email: _emailController.text,
                                  mobile: FirebaseAuth.instance.currentUser!.phoneNumber!,
                                  userId: FirebaseAuth.instance.currentUser!.uid,
                                  profilePicUrl: state.imgUrl,
                                ),
                              );
                              await linkEmailWithPhoneNumber(
                                credential: credential,
                                context: context,
                                name: _nameController.text,
                              );
                            },
                            text: 'Continue',
                          );
                        },
                      );
                    },
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

ValueNotifier<bool> showPassword = ValueNotifier(true);

class SignUpPageTextFieldWidget extends StatelessWidget {
  final String? Function(String?)? validator;
  final TextEditingController controller;
  final IconData fieldIcon;
  final String hintText;
  final bool obscure;
  final TextInputType keyboardType;

  const SignUpPageTextFieldWidget({
    required this.controller,
    required this.fieldIcon,
    required this.hintText,
    this.validator,
    Key? key,
    required this.obscure,
    this.keyboardType = TextInputType.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          fieldIcon,
          color: kGray,
          size: 25,
        ),
        const SizedBox(width: 10),
        Expanded(
          child: ValueListenableBuilder(
            valueListenable: showPassword,
            builder: (BuildContext context, bool value, Widget? child) {
              return TextFormField(
                keyboardType: keyboardType,
                obscureText: obscure ? value : false,
                validator: validator,
                controller: controller,
                decoration: InputDecoration(
                  hintText: hintText,
                  hintStyle: GoogleFonts.poppins(
                    color: kGray,
                    fontSize: 12,
                  ),
                  suffixIcon: obscure
                      ? IconButton(
                          padding: EdgeInsets.zero,
                          constraints: const BoxConstraints(),
                          onPressed: () {
                            showPassword.value = !showPassword.value;
                          },
                          icon: Icon(
                            value ? Icons.visibility_off : Icons.visibility,
                          ),
                        )
                      : const SizedBox(),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
