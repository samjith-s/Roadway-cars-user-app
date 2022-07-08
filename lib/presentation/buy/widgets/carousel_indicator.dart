import 'package:flutter/material.dart';
import 'package:roadway/core/constants/colors.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class CarouselIndicatorWidget extends StatelessWidget {
  const CarouselIndicatorWidget({
    Key? key,
    required PageController controller, required this.count,
  })  : _controller = controller,
        super(key: key);

  final PageController _controller;
  final int count;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 15),
        child: SmoothPageIndicator(
          controller: _controller,
          count:count ,
          effect: const ExpandingDotsEffect(
              dotHeight: 10,
              dotWidth: 10,
              expansionFactor: 4,
              activeDotColor: kWhite),
          onDotClicked: (index) {
            _controller.animateToPage(
              index,
              duration: const Duration(milliseconds: 400),
              curve: Curves.easeIn,
            );
          },
        ),
      ),
    );
  }
}
