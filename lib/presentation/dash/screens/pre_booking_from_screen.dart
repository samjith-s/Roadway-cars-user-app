import 'dart:async';
import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:roadway/application/pre_booking/pre_booking_cubit.dart';
import 'package:roadway/application/sell_request/sell_request_cubit.dart';
import 'package:roadway/application/user/user_cubit.dart';
import 'package:roadway/core/constants/colors.dart';
import 'package:roadway/core/constants/texts.dart';
import 'package:roadway/core/toast.dart';
import 'package:roadway/domain/pre_booking/pre_booking_model.dart';
import 'package:roadway/presentation/buy/screens/buy_screen.dart';
import 'package:roadway/presentation/sell/widgets/apply_button_widget.dart';
import 'package:roadway/presentation/sell/widgets/sell_screen_fromfield_widget.dart';

ValueNotifier<int?> yearValueNotifier = ValueNotifier(null);
ValueNotifier<int?> budgetValueNotifier = ValueNotifier(null);

class PreBookingFormScreen extends StatefulWidget {
  final PreBooking? updateBooking;
  const PreBookingFormScreen({Key? key, this.updateBooking}) : super(key: key);

  @override
  State<PreBookingFormScreen> createState() => _PreBookingFormScreenState();
}

class _PreBookingFormScreenState extends State<PreBookingFormScreen> {
  late TextEditingController makeController;
  late TextEditingController modelController;
  late TextEditingController nameController;
  late TextEditingController emailController;
  late TextEditingController numberController;

  final GlobalKey<FormState> formKey = GlobalKey();
  @override
  void initState() {
    super.initState();
    makeController = TextEditingController();
    modelController = TextEditingController();
    nameController = TextEditingController();
    emailController = TextEditingController();
    numberController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    makeController.dispose();
    modelController.dispose();
    emailController.dispose();
    numberController.dispose();
    nameController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.updateBooking != null) {
      makeController.text = widget.updateBooking!.make;
      modelController.text = widget.updateBooking!.model;
      nameController.text = widget.updateBooking!.name;
      emailController.text = widget.updateBooking!.email;
      numberController.text = widget.updateBooking!.phone;
      yearValueNotifier.value = widget.updateBooking!.year;
      budgetValueNotifier.value = widget.updateBooking!.budget != null ? widget.updateBooking!.budget!.end : 0;
    }
    log('there is no error');
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
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ValueListenableBuilder(
                          valueListenable: yearValueNotifier,
                          builder: (BuildContext context, int? value, Widget? child) {
                            return PreBookingCustomDropDownWidget(
                              value: value,
                              fieldTitle: 'Year',
                              dropdownChildren: yearOptions,
                              dropdownValues: yearValues,
                              hintText: 'select year',
                              onChanged: (value) {
                                yearValueNotifier.value = value;
                                yearValueNotifier.notifyListeners();
                                log(value.toString());
                              },
                            );
                          },
                        ),
                        ValueListenableBuilder(
                            valueListenable: budgetValueNotifier,
                            builder: (BuildContext context, int? value, Widget? _) {
                              return PreBookingCustomDropDownWidget(
                                value: value,
                                fieldTitle: 'Budget',
                                dropdownValues: budgetValues,
                                dropdownChildren: budgetOptions,
                                hintText: 'choose budget',
                                onChanged: (value) {
                                  budgetValueNotifier.value = value;
                                  budgetValueNotifier.notifyListeners();
                                  log(value.toString());
                                },
                              );
                            }),
                      ],
                    ),
                    kHeight10,
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
                    kHeight25,
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: SubmitButton(
                            onPressed: () {
                              if (!formKey.currentState!.validate()) {
                                return;
                              }

                              PreBooking booking = PreBooking(
                                name: nameController.text.trim(),
                                phone: numberController.text.trim(),
                                email: emailController.text.trim(),
                                make: makeController.text.trim(),
                                model: modelController.text.trim(),
                                year: yearValueNotifier.value,
                                datetime: Timestamp.fromDate(
                                  DateTime.now(),
                                ),
                                budget: (budgetValueNotifier.value != 0 && budgetValueNotifier.value != null)
                                    ? chooseBudget(budgetValueNotifier.value!)
                                    : null,
                              );
                              if (widget.updateBooking != null) {
                                booking.id = widget.updateBooking!.id;
                                booking.userId = widget.updateBooking!.userId;

                                BlocProvider.of<PreBookingCubit>(context).updateBookingDetails(
                                  booking: booking,
                                  id: booking.id!,
                                );

                                budgetValueNotifier.value = null;
                                yearValueNotifier.value = null;
                                Navigator.of(context).pop();
                              } else {
                                BlocProvider.of<PreBookingCubit>(context).addNewBooking(booking: booking);

                                budgetValueNotifier.value = null;
                                yearValueNotifier.value = null;

                                Navigator.of(context).pop();
                              }
                            },
                          ),
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

class PreBookingCustomDropDownWidget extends StatelessWidget {
  const PreBookingCustomDropDownWidget({
    Key? key,
    required this.dropdownValues,
    required this.dropdownChildren,
    required this.hintText,
    required this.onChanged,
    required this.fieldTitle,
    required this.value,
  }) : super(key: key);
  final String fieldTitle;
  final List<dynamic> dropdownValues;
  final List<String> dropdownChildren;
  final String hintText;
  final void Function(dynamic) onChanged;
  final dynamic value;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          fieldTitle,
          style: GoogleFonts.lato(fontSize: 14, fontWeight: FontWeight.w600),
        ),
        kHeight8,
        Container(
          padding: const EdgeInsets.only(left: 6),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6),
            color: kLightColor.withOpacity(.5),
          ),
          width: (MediaQuery.of(context).size.width - 60) / 2,
          child: DropdownButton(
            value: value,
            isExpanded: true,
            dropdownColor: kWhite,
            underline: const SizedBox(),
            elevation: 1,
            borderRadius: BorderRadius.circular(6),
            hint: Text(
              hintText,
              style: TextStyle(
                fontSize: 14,
                color: kBlack.withOpacity(.5),
              ),
            ),
            items: List.generate(
              dropdownChildren.length,
              (index) => DropdownMenuItem(
                value: dropdownValues[index],
                child: Text(
                  dropdownChildren[index],
                  style: GoogleFonts.poppins(
                    fontSize: 12,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
            onChanged: onChanged,
          ),
        ),
      ],
    );
  }
}

List<String> yearOptions = [
  'All Vehicles',
  'Under 3 Years',
  'Under 5 Years',
  'Under 7 Years',
  'Under 9 Years',
  '10 Years and Above',
];
List<int> yearValues = [
  0,
  3,
  5,
  7,
  9,
  50,
];

List<String> budgetOptions = [
  'All Vehicles',
  'Below 10 Lac',
  "10 Lac - 25 Lac",
  '25 Lac - 50 Lac',
  '50 Lac - 75 Lac',
  '75 Lac - 1 Cr',
  '1 Cr and Above',
];

List<int> budgetValues = const [
  0,
  10,
  25,
  50,
  75,
  100,
  500,
];
