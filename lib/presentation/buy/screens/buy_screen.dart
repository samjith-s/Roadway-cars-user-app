import 'package:flutter/material.dart';
import 'package:roadway/core/constants/colors.dart';
import 'package:roadway/presentation/buy/screens/search_result_seeall_sceen.dart';
import 'package:roadway/presentation/buy/widgets/available_horizondal_scrollview.dart';
import 'package:roadway/presentation/buy/widgets/brand_choice_chip.dart';
import 'package:roadway/presentation/buy/widgets/large_topscreen_text_widget.dart';
import 'package:roadway/presentation/buy/widgets/section_title_widget.dart';
import 'package:roadway/presentation/widgets/custom_searchfield_widget.dart';

class BuyScreen extends StatelessWidget {
  const BuyScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kScaffoldColor,
      // appBar: PreferredSize(
      //   preferredSize: Size(MediaQuery.of(context).size.width, 60),
      //   child: const CustomAppBar(),
      // ),
      body: ListView(
        children: [
          const LargeTopTextWidget(
            text: 'You Belong\nHere.',
          ),
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
          Column(
            children: [
              SectionTitleRowWidget(
                onSeeAllPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: ((context) => const SearchResultSeeAllScreen()),
                    ),
                  );
                },
                sectionTitle: 'Available Cars',
              ),
              const CarHorizondalListViewWidget()
            ],
          ),
          Column(
            children: [
              SectionTitleRowWidget(
                onSeeAllPressed: () {},
                sectionTitle: 'Available Bikes',
              ),
              const CarHorizondalListViewWidget()
            ],
          ),
          Column(
            children: [
              SectionTitleRowWidget(
                onSeeAllPressed: () {},
                sectionTitle: 'Available SUVs',
              ),
              const CarHorizondalListViewWidget()
            ],
          ),
          Column(
            children: [
              SectionTitleRowWidget(
                onSeeAllPressed: () {},
                sectionTitle: 'Available Hot Cars',
              ),
              const CarHorizondalListViewWidget()
            ],
          ),
        ],
      ),
    );
  }
}

List<String> carImagesList = [
  'lib/core/assets/images/benz car.jpeg',
  'lib/core/assets/images/benz g.jpeg',
  'lib/core/assets/images/cooper b.jpeg',
  'lib/core/assets/images/cooper w.jpeg',
  'lib/core/assets/images/jeep.jpeg',
  'lib/core/assets/images/WhatsApp-Image-2022-05-25-at-10.27.09-AM.jpeg',
];
