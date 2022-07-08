import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:roadway/core/constants/colors.dart';
import 'package:roadway/presentation/buy/screens/buy_screen.dart';
import 'package:roadway/presentation/buy/screens/vehicle_details_screen.dart';

class CarHorizondalListViewWidget extends StatelessWidget {
  const CarHorizondalListViewWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * .25,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 5,
        itemBuilder: (BuildContext ctx, int index) {
          return GestureDetector(
            onTap: () {
              // Navigator.of(context).push(
              //   MaterialPageRoute(
              //     builder: ((context) => const VehicleDetailsShowScreen(
              //         // imageUrl: 'lib/core/assets/images/benz car.jpeg',
              //         )),
              //   ),
              // );
            },
            child: Container(
              margin: const EdgeInsets.only(left: 15),
              width: (MediaQuery.of(context).size.width - 45) / 2,
              height: MediaQuery.of(context).size.height * .2,
              decoration: BoxDecoration(
                // image: const DecorationImage(
                //   image: AssetImage(
                //     'lib/core/assets/images/benz car.jpeg',
                //   ),
                //   fit: BoxFit.fitWidth,
                // ),
                color: kBlack,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Stack(
                children: [
                  SizedBox(
                    //height: MediaQuery.of(context).size.height * .16,
                    width: (MediaQuery.of(context).size.width - 45) / 2,
                    child: const ClipRRect(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10),
                      ),
                      child: Image(
                        image: AssetImage(
                          'lib/core/assets/images/benz car.jpeg',
                        ),
                        fit: BoxFit.fitHeight,
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Container(
                      //height: MediaQuery.of(context).size.height * .12,
                      width: (MediaQuery.of(context).size.width - 45) / 2,
                      decoration: BoxDecoration(
                        color: kWhite.withOpacity(.2),
                        borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(10),
                          bottomRight: Radius.circular(10),
                        ),
                      ),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: const EdgeInsets.only(
                            left: 15,
                            top: 15,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'MINI\nCOOPER D',
                                style: GoogleFonts.inika(
                                  fontSize: 14,
                                  //fontWeight: FontWeight.bold,
                                  color: kWhite,
                                ),
                              ),
                              Chip(
                                padding: EdgeInsets.zero,
                                label: Text(
                                  '15 Lakhs',
                                  style: GoogleFonts.notoSans(
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold),
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class FavouritesButton extends StatefulWidget {
  const FavouritesButton({
    Key? key,
  }) : super(key: key);

  @override
  State<FavouritesButton> createState() => _FavouritesButtonState();
}

class _FavouritesButtonState extends State<FavouritesButton> {
  Color color = kWhite;
  @override
  Widget build(BuildContext context) {
    return IconButton(
      padding: EdgeInsets.zero,
      constraints: const BoxConstraints(),
      onPressed: () {
        setState(() {
          color = color == kWhite ? Colors.red : kWhite;
        });
      },
      icon: Icon(
        Icons.favorite,
        color: color,
      ),
    );
  }
}
