import 'package:flutter/material.dart';
import 'package:roadway/core/constants/colors.dart';

class VideoPlayerIcons extends StatefulWidget {
  final IconData iconData;
  const VideoPlayerIcons({required this.iconData, Key? key})
      : super(
          key: key,
        );

  @override
  State<VideoPlayerIcons> createState() => _VideoPlayerIconsState();
}

class _VideoPlayerIconsState extends State<VideoPlayerIcons> {
  Color heartColor = kWhite;
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
      child: IconButton(
        onPressed: () {
          if (widget.iconData == Icons.favorite) {
            setState(() {
              heartColor = heartColor == kWhite ? Colors.red : kWhite;
            });
          }

          print('button click');
        },
        icon: Icon(
          widget.iconData,
          color: heartColor,
        ),
      ),
    );
  }
}
