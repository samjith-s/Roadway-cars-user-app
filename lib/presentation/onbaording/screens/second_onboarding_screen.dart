import 'package:flutter/material.dart';
import 'package:roadway/core/constants/colors.dart';
import 'package:roadway/presentation/login_and_signup/screens/login/login_screen.dart';
import 'package:roadway/presentation/widgets/blue_icon_button.dart';
import 'package:roadway/presentation/widgets/large_font_widget.dart';

class SecondOnboardingScreen extends StatefulWidget {
  const SecondOnboardingScreen({Key? key}) : super(key: key);

  @override
  State<SecondOnboardingScreen> createState() => _SecondOnboardingScreenState();
}

class _SecondOnboardingScreenState extends State<SecondOnboardingScreen>
    with SingleTickerProviderStateMixin {
  double position = 0;
  late AnimationController _controller;
  late Animation _slideAnimation;
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );

    _slideAnimation = Tween<double>(begin: 1, end: 0).animate(_controller);
    Future.delayed(const Duration(seconds: 1), () => _controller.forward());
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffe5e4e4),
      body: SafeArea(
        child: Stack(
          children: [
            Positioned(
              //right: MediaQuery.of(context).size.width * _slideAnimation.value,
              top: MediaQuery.of(context).size.height * .1,
              child: Container(
                color: kBlack,
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * .4,
                child: Image(
                  image: const AssetImage(
                    'lib/core/assets/images/car_loop_4x3.gif',
                  ),
                  fit: BoxFit.cover,
                  width: MediaQuery.of(context).size.width * .8,
                  height: MediaQuery.of(context).size.width,
                ),
              ),
            ),
            // AnimatedBuilder(
            //   animation: _controller,
            //   builder: (BuildContext context, _) {
            //     return Positioned(
            //       right:
            //           MediaQuery.of(context).size.width * _slideAnimation.value,
            //       top: MediaQuery.of(context).size.height * .1,
            //       child: Container(
            //         color: kBlack,
            //         width: MediaQuery.of(context).size.width,
            //         height: MediaQuery.of(context).size.height * .4,
            //         child: Image(
            //           image: const AssetImage(
            //             'lib/core/assets/images/car_loop_4x3.gif',
            //           ),
            //           fit: BoxFit.cover,
            //           width: MediaQuery.of(context).size.width * .8,
            //           height: MediaQuery.of(context).size.width,
            //         ),
            //       ),
            //     );
            //   },
            // ),
            AnimatedBuilder(
              animation: _controller,
              builder: (BuildContext context, _) {
                return Positioned(
                  right:
                      MediaQuery.of(context).size.width * _slideAnimation.value,
                  child: Padding(
                    padding: const EdgeInsets.only(
                      top: 50,
                    ),
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width,
                      height: 60,
                      child: const Center(
                        child: LargeFont(
                          text: 'Roadway',
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
            AnimatedBuilder(
              animation: _controller,
              builder: (context, _) {
                return Positioned(
                  top: MediaQuery.of(context).size.height * .55,
                  left:
                      MediaQuery.of(context).size.width * _slideAnimation.value,
                  child: const Padding(
                    padding: EdgeInsets.only(left: 20),
                    child: LargeFont(
                      text: 'Sell your car\neffortlessly',
                    ),
                  ),
                );
              },
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: Padding(
                padding: EdgeInsets.only(
                  bottom: 70,
                  right: MediaQuery.of(context).size.width * .08,
                ),
                child: AppBlueIconButton(
                  width: MediaQuery.of(context).size.width * .4,
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: ((context) => const LoginScreen()),
                      ),
                    );
                  },
                  text: 'Start Now',
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
