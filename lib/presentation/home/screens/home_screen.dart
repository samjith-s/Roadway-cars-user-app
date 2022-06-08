import 'package:flutter/material.dart';
import 'package:roadway/presentation/home/widgets/carousel_bottom_titile.dart';
import 'package:roadway/presentation/home/widgets/carousel_widget.dart';
import 'package:roadway/presentation/home/widgets/video_player_widget.dart';
import 'package:roadway/presentation/widgets/costum_appbar_widget.dart';
import 'package:roadway/presentation/widgets/costum_navbar_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      //backgroundColor: kWhite,
      // appBar: PreferredSize(
      //   preferredSize: Size(MediaQuery.of(context).size.width, 50),
      //   child: const CustomAppBar(),
      // ),
      body: SafeArea(
          child: ListView(
        children: [
          const HomeScreenCarousel(),
          const CarouselBottomTitleWidget(),
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: 4,
            scrollDirection: Axis.vertical,
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                padding: const EdgeInsets.all(5),
                child: VideoPlayerWidget(
                  index: index,
                ),
              );
            },
          )
        ],
      )),
    );
  }
}
