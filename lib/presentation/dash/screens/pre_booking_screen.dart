import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:roadway/application/pre_booking/pre_booking_cubit.dart';
import 'package:roadway/core/constants/colors.dart';
import 'package:roadway/presentation/dash/screens/pre_booking_from_screen.dart';

class PreBookingScreen extends StatelessWidget {
  const PreBookingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      BlocProvider.of<PreBookingCubit>(context).getAllBookingDetails();
    });
    return Scaffold(
      appBar: AppBar(),
      body: BlocBuilder<PreBookingCubit, PreBookingState>(
        builder: (context, state) {
          return state.isLoading
              ? const Center(child: CircularProgressIndicator())
              : state.isError
                  ? Center(child: Text(state.errorText))
                  : state.totalBookings.isNotEmpty
                      ? Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ListView.separated(
                            itemBuilder: ((context, index) {
                              final booking = state.totalBookings[index];
                              return Container(
                                padding: const EdgeInsets.all(15),
                                width: MediaQuery.of(context).size.width - 30,
                                height: 200,
                                decoration: BoxDecoration(
                                  color: kLightColor.withOpacity(.5),
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                child: Stack(
                                  children: [
                                    Column(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        customBookingDetailsItem(
                                          label: 'Brand : ',
                                          value: booking.make,
                                        ),
                                        customBookingDetailsItem(
                                          label: 'Model : ',
                                          value: booking.model,
                                        ),
                                        customBookingDetailsItem(
                                          label: 'Year : ',
                                          value: booking.year != null ? _chooseYearText(booking.year!) : 'All Vehicles',
                                        ),
                                        customBookingDetailsItem(
                                          label: 'Brand : ',
                                          value: booking.budget != null
                                              ? _chooseBudgetText(booking.budget!.end)
                                              : 'All Vehicles',
                                        ),
                                        customBookingDetailsItem(
                                          label: 'Name : ',
                                          value: booking.name,
                                        ),
                                        customBookingDetailsItem(
                                          label: 'Phone : ',
                                          value: booking.phone,
                                        ),
                                        customBookingDetailsItem(
                                          label: 'Email : ',
                                          value: booking.email,
                                        ),
                                      ],
                                    ),
                                    Positioned(
                                      top: 0,
                                      right: 0,
                                      child: PopupMenuButton(
                                        onSelected: (value) {
                                          if (value == 1) {
                                            Navigator.of(context).push(
                                              MaterialPageRoute(
                                                builder: (context) => PreBookingFormScreen(
                                                  updateBooking: booking,
                                                ),
                                              ),
                                            );
                                          } else {
                                            BlocProvider.of<PreBookingCubit>(context).cancelBooking(id: booking.id!);
                                          }
                                        },
                                        elevation: 0,
                                        color: kYellow,
                                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                                        padding: EdgeInsets.zero,
                                        itemBuilder: (ctx) {
                                          return [
                                            const PopupMenuItem(
                                              value: 1,
                                              child: Text('Edit'),
                                            ),
                                            const PopupMenuItem(
                                              value: 2,
                                              child: Text('Cancel'),
                                            )
                                          ];
                                        },
                                        child: const Icon(
                                          Icons.more_vert,
                                          size: 20,
                                          color: Color.fromARGB(255, 102, 101, 101),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              );
                            }),
                            separatorBuilder: (__, _) {
                              return const SizedBox(height: 5);
                            },
                            itemCount: state.totalBookings.length,
                          ),
                        )
                      :  Center(
                          child: Text("You don't have any bookings yet!.",style:GoogleFonts.hind()),
                        );
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: kBlack,
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: ((context) => const PreBookingFormScreen()),
            ),
          );
        },
        child: const Icon(
          Icons.add,
          color: kWhite,
        ),
      ),
    );
  }

  Row customBookingDetailsItem({required String label, required String value}) {
    return Row(
      children: [
        Text(
          label,
          style: GoogleFonts.poppins(),
        ),
        Text(
          value,
          style: GoogleFonts.poppins(),
        ),
      ],
    );
  }
}

_chooseBudgetText(int value) {
  switch (value) {
    case 10:
      return 'Below 10 Lac';

    case 25:
      return "10 Lac - 25 Lac";

    case 50:
      return '25 Lac - 50 Lac';

    case 75:
      return '50 Lac - 75 Lac';

    case 100:
      return '75 Lac - 1 Cr';

    case 500:
      return '1 Cr and Above';
  }
}

_chooseYearText(int value) {
  switch (value) {
    case 3:
      return 'Under 3 Years';

    case 5:
      return "Under 5 Years";

    case 7:
      return 'Under 7 Years';

    case 9:
      return 'Under 7 Years';

    case 50:
      return 'Under 7 Years';
  }
}
