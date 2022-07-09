import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:roadway/core/constants/colors.dart';
import 'package:roadway/core/utils/toast.dart';
import 'package:roadway/presentation/home/widgets/carousel_bottom_titile.dart';
import 'package:roadway/presentation/home/widgets/carousel_widget.dart';
import 'package:roadway/presentation/home/widgets/video_player_widget.dart';

import '../../../application/internet/internet_cubit.dart';

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
      body: SafeArea(
          child: ListView(
        children: [
          BlocBuilder<InternetCubit, InternetState>(
            builder: (context, netstate) {
              if (!netstate.networkOn) {
                showToast(
                  msg: 'No network connection. Please check your network',
                  bgcolor: kBlack,
                );
              }
              return const SizedBox();
            },
          ),
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
