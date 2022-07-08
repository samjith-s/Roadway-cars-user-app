import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:roadway/application/sell_request/sell_request_cubit.dart';
import 'package:roadway/application/user/user_cubit.dart';
import 'package:roadway/core/constants/colors.dart';
import 'package:roadway/domain/sell_request/sell_request_model.dart';
import 'package:roadway/presentation/sell/widgets/apply_button_widget.dart';
import 'package:roadway/presentation/sell/widgets/custom_yearpicker_widget.dart';
import 'package:roadway/presentation/sell/widgets/sell_screen_fromfield_widget.dart';

class SellFormSubmitScreen extends StatefulWidget {
  const SellFormSubmitScreen({Key? key}) : super(key: key);

  @override
  State<SellFormSubmitScreen> createState() => _SellFormSubmitScreenState();
}

class _SellFormSubmitScreenState extends State<SellFormSubmitScreen> {
  late TextEditingController makeController;
  late TextEditingController modelController;
  late TextEditingController nameController;
  late TextEditingController emailController;
  late TextEditingController numberController;
  late TextEditingController locationController;
  final GlobalKey<FormState> formKey = GlobalKey();
  @override
  void initState() {
    super.initState();
    makeController = TextEditingController();
    modelController = TextEditingController();
    nameController = TextEditingController();
    emailController = TextEditingController();
    numberController = TextEditingController();
    locationController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    makeController.dispose();
    modelController.dispose();
    emailController.dispose();
    numberController.dispose();
    nameController.dispose();
    locationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: kWhite,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(
            Icons.arrow_circle_left,
            color: kBlack,
            size: 30,
          ),
        ),
        title: const Text(
          'Roadway',
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(25),
          child: BlocBuilder<UserCubit, UserState>(
            builder: (context, userState) {
              if (userState.user != null) {
                nameController.text = userState.user!.name;
                numberController.text = userState.user!.mobile;
                emailController.text = userState.user!.email;
              }
              return Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 20),
                    SellScreenFormFieldWidget(
                      validator: (value) {
                        if (value == null || value.length < 3) {
                          return 'Enter a valid name';
                        } else {
                          return null;
                        }
                      },
                      controller: nameController,
                      textFieldTitle: 'Name',
                      hintText: 'Your name',
                    ),
                    SellScreenFormFieldWidget(
                      validator: (value) {
                        if (value == null || value.length < 13) {
                          return 'Enter a valid number';
                        } else {
                          return null;
                        }
                      },
                      controller: numberController,
                      textFieldTitle: 'Phone number',
                      hintText: 'Change the email',
                    ),
                    SellScreenFormFieldWidget(
                      validator: (value) {
                        if (!RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                            .hasMatch(value ?? '')) {
                          return 'please enter a valid email';
                        } else {
                          return null;
                        }
                      },
                      controller: emailController,
                      textFieldTitle: 'Email address',
                      hintText: 'change the number',
                    ),
                    SellScreenFormFieldWidget(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Enter a valid location';
                        } else {
                          return null;
                        }
                      },
                      controller: locationController,
                      textFieldTitle: 'Location',
                      hintText: 'Your location',
                    ),
                    SellScreenFormFieldWidget(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Enter a valid make';
                        } else {
                          return null;
                        }
                      },
                      controller: makeController,
                      textFieldTitle: 'Make',
                      hintText: 'make (bmw, audi, benz...)',
                    ),
                    SellScreenFormFieldWidget(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Enter a valid model';
                        } else {
                          return null;
                        }
                      },
                      controller: modelController,
                      textFieldTitle: 'Model',
                      hintText: 'model',
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const YearPickerCustomWidget(
                          title: 'Year',
                        ),
                        BlocBuilder<SellRequestCubit, SellRequestState>(
                          builder: (context, state) {
                            return SubmitButton(
                              onPressed: () {
                                if (!formKey.currentState!.validate()) {
                                  return;
                                }
                                SellRequest request = SellRequest(
                                  name: nameController.text.trim(),
                                  phone: numberController.text.trim(),
                                  email: emailController.text.trim(),
                                  location: locationController.text.trim(),
                                  make: makeController.text.trim(),
                                  model: modelController.text.trim(),
                                  year: state.selectedDate,
                                  datetime: Timestamp.fromDate(
                                    DateTime.now(),
                                  ),
                                );
                                BlocProvider.of<SellRequestCubit>(context).sendSellRequest(details: request);

                                Navigator.of(context).pop();
                              },
                            );
                          },
                        ),
                      ],
                    ),
                    const SizedBox(height: 10)
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
