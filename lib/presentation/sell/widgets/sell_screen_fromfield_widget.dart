import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:roadway/core/constants/colors.dart';

class SellScreenFormFieldWidget extends StatelessWidget {
  const SellScreenFormFieldWidget({
    Key? key,
    required this.controller,
    required this.hintText,
    required this.textFieldTitle,
  }) : super(key: key);
  final String textFieldTitle;
  final String hintText;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(
            left: 25,
            bottom: 8,
            top: 20,
          ),
          child: Text(
            textFieldTitle,
            style: GoogleFonts.lato(fontSize: 14, fontWeight: FontWeight.w600),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.only(left: 15),
              decoration: BoxDecoration(
                  color: kLightColor.withOpacity(.3),
                  borderRadius: BorderRadius.circular(7)),
              width: MediaQuery.of(context).size.width - 50,
              height: MediaQuery.of(context).size.height * .07,
              child: Center(
                child: TextFormField(
                  controller: controller,
                  decoration: InputDecoration(
                    hintText: hintText,
                    hintStyle:
                        TextStyle(fontSize: 14, color: kBlack.withOpacity(.5)),
                    border: InputBorder.none,
                  ),
                ),
              ),
            ),
          ],
        )
      ],
    );
  }
}
