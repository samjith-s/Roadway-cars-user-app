import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:roadway/core/constants/colors.dart';
import 'package:roadway/presentation/buy/widgets/carousel_indicator.dart';

class VehicleDetailsShowScreen extends StatefulWidget {
  const VehicleDetailsShowScreen({Key? key}) : super(key: key);

  @override
  State<VehicleDetailsShowScreen> createState() =>
      _VehicleDetailsShowScreenState();
}

class _VehicleDetailsShowScreenState extends State<VehicleDetailsShowScreen> {
  late PageController _controller;
  @override
  void initState() {
    super.initState();
    _controller = PageController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kWhite,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(FontAwesomeIcons.circleArrowLeft),
          color: kBlack,
        ),
      ),
      body: Column(
        children: [
          Container(
            //margin: EdgeInsets.only(top: 20),
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * .3,
            color: kBlack,
            child: Stack(
              children: [
                PageView.builder(
                  itemBuilder: ((context, index) {
                    return Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height * .3,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(
                              'https://roadwaycars.in/wp-content/uploads/2022/06/WhatsApp-Image-2022-06-01-at-6.20.47-PM.jpeg'),
                        ),
                      ),
                    );
                  }),
                  itemCount: 5,
                  controller: _controller,
                ),
                CarouselIndicatorWidget(controller: _controller)
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 15,
              vertical: 15,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'MINI\nCOOPER S',
                  style: GoogleFonts.inika(fontSize: 23),
                ),
                Container(
                  width: MediaQuery.of(context).size.width * .4,
                  height: MediaQuery.of(context).size.height * .06,
                  decoration: BoxDecoration(
                    color: kGreen,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Center(
                    child: Text(
                      '₹ 25 Lakhs',
                      style: GoogleFonts.poppins(fontSize: 23),
                    ),
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15, top: 15),
            child: SizedBox(
              height: 105,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemBuilder: ((context, index) {
                  return Container(
                    decoration: BoxDecoration(
                        color: kWhite.withOpacity(.3),
                        borderRadius: BorderRadius.circular(15)),
                    padding: const EdgeInsets.symmetric(
                        vertical: 15, horizontal: 15),
                    //width: (MediaQuery.of(context).size.width - 45) / 2,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Image(
                          image: AssetImage(iconsList[index]),
                          width: 25,
                        ),
                        const SizedBox(height: 4),
                        Text(
                          '2013',
                          style: GoogleFonts.poppins(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Text(
                          propertiesList[index],
                          style: GoogleFonts.poppins(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                            color: kBlack.withOpacity(.5),
                          ),
                        )
                      ],
                    ),
                  );
                }),
                separatorBuilder: (context, index) {
                  return const SizedBox(width: 10);
                },
                itemCount: 8,
              ),
            ),
          ),
          const Expanded(child: SizedBox()),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              // Text(
              //   'Ready to own this car?',
              // ),
              Container(
                width: MediaQuery.of(context).size.width - 30,
                margin: const EdgeInsets.only(bottom: 50, right: 15),
                decoration: BoxDecoration(
                    color: kWhite, borderRadius: BorderRadius.circular(8)),
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                child: Center(
                  child: Text(
                    'BOOK NOW',
                    style: GoogleFonts.poppins(
                      fontSize: 21,
                      color: kBlack,
                    ),
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}

List<String> iconsList = [
  'lib/core/assets/images/Registration-Icon.png',
  'lib/core/assets/images/Manufacture-Icon-new.png',
  'lib/core/assets/images/Fuel-Icon.png',
  'lib/core/assets/images/Color-Icon.png',
  'lib/core/assets/images/Man-Icon.png',
  'lib/core/assets/images/Mileage-Icon.png',
  'lib/core/assets/images/Kilometer-Icon.png',
  'lib/core/assets/images/Registration-Icon.png',
];
List<String> propertiesList = [
  'MFG YEAR',
  'REG YEAR',
  'FUEL TYPE',
  'COLOR',
  'OWNER',
  'MILEAGE',
  'KILOMETERS',
  'REG PLACE',
];
