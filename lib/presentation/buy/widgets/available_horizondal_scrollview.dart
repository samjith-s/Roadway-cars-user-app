import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:roadway/core/constants/colors.dart';
import 'package:roadway/presentation/buy/screens/buy_screen.dart';

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
        itemCount: carImagesList.length,
        itemBuilder: (BuildContext ctx, int index) {
          return Stack(
            children: [
              Container(
                margin: const EdgeInsets.only(left: 15),
                width: (MediaQuery.of(context).size.width - 45) / 2,
                height: MediaQuery.of(context).size.height * .25,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(
                      carImagesList[index],
                    ),
                    fit: BoxFit.cover,
                  ),
                  color: kBlack,
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              const Positioned(
                right: 10,
                top: 10,
                child: Icon(
                  Icons.favorite,
                  color: kWhite,
                ),
              ),
              Positioned(
                bottom: 0,
                right: 0,
                child: Container(
                  height: MediaQuery.of(context).size.height * .1,
                  width: (MediaQuery.of(context).size.width - 45) / 2,
                  decoration: BoxDecoration(
                    color: kWhite.withOpacity(.2),
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20),
                    ),
                  ),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 15),
                      child: Text(
                        'MINI\nCOOPER D',
                        style: GoogleFonts.inika(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: kWhite,
                        ),
                      ),
                    ),
                  ),
                ),
              )
            ],
          );
        },
      ),
    );
  }
}
