import 'package:flutter/material.dart';
import 'package:roadway/core/constants/colors.dart';

class VideoPlayerIcons extends StatelessWidget {
  final IconData iconData;
  const VideoPlayerIcons({required this.iconData, Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 45,
      height: 45,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        border: Border.all(
          color: kWhite,
        ),
      ),
      child: Icon(
        iconData,
        color: kWhite,
      ),
    );
  }
}
