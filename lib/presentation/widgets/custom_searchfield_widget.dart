import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:roadway/application/buy/buy_screen_bloc.dart';
import 'package:roadway/core/constants/colors.dart';

class CustomSearchFieldWidget extends StatelessWidget {
  final bool focusOn;
  const CustomSearchFieldWidget({
    Key? key,
    required this.focusOn,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: Container(
        decoration: BoxDecoration(
          color: kWhite, //Color(0xFFd9e5f1),
          borderRadius: BorderRadius.circular(15),
        ),
        width: MediaQuery.of(context).size.width - 30,
        height: 50,
        child: Row(
          children: [
            Expanded(
              child: TextField(
                focusNode: focusOn ? FocusNode() : null,
                autofocus: true,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: "Find your favorate car..",
                  hintStyle: GoogleFonts.poppins(
                    fontSize: 13,
                    color: kGray,
                  ),
                  prefixIcon: const Icon(
                    Icons.search,
                    color: kBlack,
                  ),
                ),
                onChanged: (value) {
                  log('on changed is working');

                  BlocProvider.of<BuyScreenBloc>(context).add(SearchVehicle(searchKey: value));
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
