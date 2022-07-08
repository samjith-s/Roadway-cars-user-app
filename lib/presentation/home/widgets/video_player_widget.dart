import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:roadway/core/constants/colors.dart';
import 'package:roadway/presentation/home/widgets/video_player_icon.dart';
import 'package:video_player/video_player.dart';

class VideoPlayerWidget extends StatefulWidget {
  final int index;
  const VideoPlayerWidget({
    required this.index,
    Key? key,
  }) : super(key: key);

  @override
  State<VideoPlayerWidget> createState() => _VideoPlayerWidgetState();
}

class _VideoPlayerWidgetState extends State<VideoPlayerWidget> {
  final assets = [
    'lib/core/assets/videos/video1.mp4',
    'lib/core/assets/videos/video2.mp4',
    'lib/core/assets/videos/video3.mp4',
    'lib/core/assets/videos/video4.mp4',
  ];
  late VideoPlayerController _videoPlayerController;

  @override
  void initState() {
    _videoPlayerController = VideoPlayerController.asset(assets[widget.index])
      ..addListener(() {
        setState(() {});
      })
      ..setLooping(true)
      ..initialize();
    // .then((_) => _videoPlayerController.play())
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _videoPlayerController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return _videoPlayerController != null && _videoPlayerController.value.isInitialized
        ? Stack(
            children: [
              AspectRatio(
                aspectRatio: _videoPlayerController.value.aspectRatio,
                child: GestureDetector(
                  onTap: () {
                    _videoPlayerController.value.isPlaying
                        ? _videoPlayerController.pause()
                        : _videoPlayerController.play();
                  },
                  child: ClipRRect(borderRadius: BorderRadius.circular(5), child: VideoPlayer(_videoPlayerController)),
                ),
              ),
              Positioned(
                top: MediaQuery.of(context).size.height * .3,
                right: 20,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: const [
                    VideoPlayerIcons(iconData: Icons.ios_share),
                    SizedBox(
                      height: 20,
                    ),
                    VideoPlayerIcons(iconData: Icons.favorite),
                    SizedBox(
                      height: 20,
                    ),
                    VideoPlayerIcons(iconData: FontAwesomeIcons.comment),
                  ],
                ),
              ),
              Positioned(
                bottom: 30,
                left: 15,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        CircleAvatar(
                          radius: 15,
                          backgroundColor: kWhite,
                          child: Padding(
                            padding: const EdgeInsets.all(2),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(13),
                              child: Image(
                                image: NetworkImage(
                                  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT2C_xadF4WT19MkU5PpYyU8njyMgMIuttwXQ&usqp=CAU',
                                ),
                                errorBuilder: (BuildContext context, Object _, s) {
                                  return const SizedBox();
                                },
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        const Text(
                          'roadwaycars',
                          style: TextStyle(color: kWhite),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      'The Mafia Gang !...',
                      style: TextStyle(color: kWhite),
                    )
                  ],
                ),
              )
            ],
          )
        : Center(
            child: Container(
              width: MediaQuery.of(context).size.width - 10,
              height: MediaQuery.of(context).size.height * .8,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: kGray,
              ),
              child: Stack(
                children: [
                  Positioned(
                    top: MediaQuery.of(context).size.height * .3,
                    right: 20,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: const [
                        VideoPlayerIcons(iconData: Icons.ios_share),
                        SizedBox(
                          height: 20,
                        ),
                        VideoPlayerIcons(iconData: FontAwesomeIcons.heart),
                        SizedBox(
                          height: 20,
                        ),
                        VideoPlayerIcons(iconData: FontAwesomeIcons.comment),
                      ],
                    ),
                  ),
                  Positioned(
                    bottom: 30,
                    left: 15,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            CircleAvatar(
                              radius: 15,
                              backgroundColor: kWhite,
                              child: Padding(
                                padding: const EdgeInsets.all(2),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(13),
                                  child: const Image(
                                    image: NetworkImage(
                                      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT2C_xadF4WT19MkU5PpYyU8njyMgMIuttwXQ&usqp=CAU',
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            const Text(
                              'roadwaycars',
                              style: TextStyle(color: kWhite),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Text(
                          '         ...',
                          style: TextStyle(color: kWhite),
                        )
                      ],
                    ),
                  ),
                  const Center(
                    child: CircularProgressIndicator(
                      color: kWhite,
                    ),
                  )
                ],
              ),
            ),
          );
  }
}
