import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:roadway/core/constants/colors.dart';
import 'package:roadway/presentation/buy/widgets/large_topscreen_text_widget.dart';
import 'package:roadway/presentation/sell/screens/sell_form_screen.dart';

class SellScreen extends StatelessWidget {
  const SellScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kScaffoldColor,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const LargeTopTextWidget(text: 'Sell Your Vehicle\nHussle Free'),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              width: MediaQuery.of(context).size.width - 40,
              height: MediaQuery.of(context).size.width * .58,
              decoration: BoxDecoration(
                color: kBlack,
                borderRadius: BorderRadius.circular(15),
                image: const DecorationImage(
                  image: AssetImage('lib/core/assets/images/cooper w.jpeg'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, top: 20, bottom: 30),
              child: discriptionText(),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: kWhite.withOpacity(.7),
                    padding:
                        const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    elevation: 3,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                        10,
                      ),
                    ),
                  ),
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: ((context) => const SellFormSubmitScreen()),
                      ),
                    );
                  },
                  child: Text(
                    'SELL YOUR CAR',
                    style: GoogleFonts.inika(
                      fontSize: 18,
                      color: kBlack,
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  Text discriptionText() {
    return Text(
      '''Selling your car amid a hectic schedule is a
challenging task. We are here to help you 
sell used premium cars through our 
luxurious andgrand showroom at Calicut 
having an obsessedteam to assist you with
years of experience and reputation in the 
automobile business.''',
      style: GoogleFonts.hind(fontSize: 15),
    );
  }
}
