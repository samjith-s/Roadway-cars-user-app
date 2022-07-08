import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:roadway/core/constants/colors.dart';

class SellScreenFormFieldWidget extends StatelessWidget {
  const SellScreenFormFieldWidget({
    Key? key,
    required this.controller,
    required this.hintText,
    required this.textFieldTitle,
    required this.validator,
  }) : super(key: key);
  final String textFieldTitle;
  final String hintText;
  final TextEditingController controller;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          textFieldTitle,
          style: GoogleFonts.lato(fontSize: 14, fontWeight: FontWeight.w600),
        ),
        Container(
          margin: const EdgeInsets.only(top: 8, bottom: 15),
          padding: const EdgeInsets.only(left: 15),
          decoration: BoxDecoration(
              color: kLightColor.withOpacity(.5),
              borderRadius: BorderRadius.circular(7)),
          width: MediaQuery.of(context).size.width - 50,
          height: 48,
          child: Center(
            child: TextFormField(
              style: GoogleFonts.openSans(fontSize: 14),
              validator: validator,
              controller: controller,
              decoration: InputDecoration(
                hintText: hintText,
                hintStyle:
                    TextStyle(fontSize: 14, color: kBlack.withOpacity(.5)),
                border: InputBorder.none,
                
                //contentPadding: const EdgeInsets.symmetric(vertical: 17),
              ),
              textCapitalization: TextCapitalization.sentences,
            ),
          ),
        )
      ],
    );
  }
}
