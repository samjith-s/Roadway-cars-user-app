import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:roadway/core/constants/colors.dart';

class SellScreenDropDownWidget extends StatelessWidget {
  final String title;
  final List<String> list;

  const SellScreenDropDownWidget({
    required this.list,
    required this.title,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: GoogleFonts.lato(fontSize: 14, fontWeight: FontWeight.w600),
        ),
        const SizedBox(height: 8),
        Container(
          padding: const EdgeInsets.only(left: 15, right: 8),
          decoration: BoxDecoration(
            color: kLightColor.withOpacity(.3),
            borderRadius: BorderRadius.circular(7),
          ),
          width: (MediaQuery.of(context).size.width -70)/2,
          height: MediaQuery.of(context).size.height * .07,
          child: Center(
            child: DropdownButton(
              icon: const Icon(Icons.keyboard_arrow_down),
              underline: const SizedBox(),
              isExpanded: true,
              value: list[0],
              items: list
                  .map(
                    (e) => DropdownMenuItem(
                      value: e,
                      child: Text(e),
                    ),
                  )
                  .toList(),
              onChanged: (value) {},
            ),
          ),
        ),
      ],
    );
  }
}
