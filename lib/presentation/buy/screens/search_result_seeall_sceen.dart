import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:roadway/core/constants/colors.dart';
import 'package:roadway/presentation/buy/screens/vehicle_details_screen.dart';
import 'package:roadway/presentation/buy/widgets/brand_choice_chip.dart';
import 'package:roadway/presentation/widgets/custom_searchfield_widget.dart';

class SearchResultSeeAllScreen extends StatelessWidget {
  const SearchResultSeeAllScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kWhite,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(
            FontAwesomeIcons.circleChevronLeft,
            color: kBlack,
          ),
        ),
        title: const Text(
          'Roadway',
          style: TextStyle(color: kBlack),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.filter_list_rounded,
              color: kBlack,
            ),
          )
        ],
      ),
      body: ListView(
        children: [
          const SizedBox(height: 20),
          const CustomSearchFieldWidget(),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.only(left: 15),
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              height: 30,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemBuilder: (BuildContext ctx, int index) {
                  return Container(
                    margin: const EdgeInsets.only(right: 12),
                    decoration: BoxDecoration(
                      color: kWhite,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    padding: const EdgeInsets.all(5),
                    child: const BrandCoiceChipWidget(
                      imageUrl: 'lib/core/assets/images/mercedes.png',
                      brandName: 'Mercedes',
                    ),
                  );
                },
              ),
            ),
          ),
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: 10,
            itemBuilder: ((context, index) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: ((context) =>
                              const VehicleDetailsShowScreen()),
                        ),
                      );
                    },
                    child: Container(
                      margin: const EdgeInsets.symmetric(vertical: 8),
                      width: MediaQuery.of(context).size.width - 30,
                      height: MediaQuery.of(context).size.width * .6,
                      decoration: BoxDecoration(
                        image: const DecorationImage(
                            image: NetworkImage(
                              'https://roadwaycars.in/wp-content/uploads/2022/05/WhatsApp-Image-2022-05-25-at-6.04.20-PM.jpeg',
                            ),
                            fit: BoxFit.cover),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Stack(
                        children: [
                          Positioned(
                            bottom: 0,
                            child: Container(
                              decoration: BoxDecoration(
                                color: kBlack.withOpacity(.1),
                                borderRadius: const BorderRadius.only(
                                  bottomLeft: Radius.circular(15),
                                  bottomRight: Radius.circular(15),
                                ),
                              ),
                              width: MediaQuery.of(context).size.width - 30,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 20),
                                    child: Text(
                                      'MINI\nCOOPER S',
                                      style: GoogleFonts.inika(
                                          fontSize: 18, color: kWhite),
                                    ),
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: const [
                                      TransparentDetailsContainerWidget(
                                        detailType: 'Regd.',
                                        detailValue: '2014',
                                        detailIconIndex: 0,
                                      ),
                                      TransparentDetailsContainerWidget(
                                        detailType: 'Color',
                                        detailValue: 'White',
                                        detailIconIndex: 0,
                                      ),
                                      TransparentDetailsContainerWidget(
                                        detailType: 'Kms',
                                        detailValue: '640399',
                                        detailIconIndex: 0,
                                      ),
                                      TransparentDetailsContainerWidget(
                                        detailType: 'Owners',
                                        detailValue: '2',
                                        detailIconIndex: 0,
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              );
            }),
          )
        ],
      ),
    );
  }
}

class TransparentDetailsContainerWidget extends StatelessWidget {
  final String detailType;
  final String detailValue;
  final int detailIconIndex;
  const TransparentDetailsContainerWidget({
    required this.detailIconIndex,
    required this.detailType,
    required this.detailValue,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      width: (MediaQuery.of(context).size.width - 130) / 4,
      height: MediaQuery.of(context).size.height * .09,
      decoration: BoxDecoration(
        border: Border.all(width: 1, color: kWhite),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image(
            image: AssetImage(iconsList[detailIconIndex]),
            width: 20,
            color: kWhite,
          ),
          Text(
            detailValue,
            style: GoogleFonts.poppins(
              fontSize: 13,
              color: kWhite,
            ),
          ),
          Text(
            detailType,
            style: GoogleFonts.poppins(
              fontSize: 12,
              color: kWhite,
            ),
          )
        ],
      ),
    );
  }
}
