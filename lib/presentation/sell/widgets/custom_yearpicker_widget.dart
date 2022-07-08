import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:roadway/application/sell_request/sell_request_cubit.dart';
import 'package:roadway/core/constants/colors.dart';

class YearPickerCustomWidget extends StatelessWidget {
  final String title;

  const YearPickerCustomWidget({
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
        GestureDetector(
          onTap: () => showDialog(
            context: context,
            builder: (context) => AlertDialog(
              content: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                ),
                child: BlocBuilder<SellRequestCubit, SellRequestState>(
                  builder: (context, state) {
                    return YearPicker(
                      firstDate: DateTime(
                        DateTime.now().year - 50,
                      ),
                      lastDate: DateTime(DateTime.now().year),
                      initialDate: DateTime.now(),
                      selectedDate: DateTime(state.selectedDate),
                      onChanged: (newdate) {
                        BlocProvider.of<SellRequestCubit>(context)
                            .changePickedDate(year: newdate.year);
                        Navigator.of(context).pop();
                      },
                    );
                  },
                ),
              ),
            ),
          ),
          child: BlocBuilder<SellRequestCubit, SellRequestState>(
            builder: (context, state) {
              return Container(
                padding: const EdgeInsets.only(left: 15, right: 15),
                decoration: BoxDecoration(
                  color: kLightColor.withOpacity(.5),
                  borderRadius: BorderRadius.circular(7),
                ),
                width: (MediaQuery.of(context).size.width - 70) / 2,
                height: 48,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(state.selectedDate.toString()),
                    const Icon(Icons.date_range),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
