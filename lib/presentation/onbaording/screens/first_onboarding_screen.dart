import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:roadway/presentation/home/screens/home_screen.dart';
import 'package:roadway/presentation/onbaording/screens/second_onboarding_screen.dart';
import 'package:roadway/presentation/widgets/blue_icon_button.dart';
import 'package:roadway/presentation/widgets/common_screen_scaffold.dart';
import 'package:roadway/presentation/widgets/large_font_widget.dart';

class OnboardingPageView extends StatelessWidget {
  const OnboardingPageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PageView(
      children: [FirstOnboardingPage(), SecondOnboardingScreen()],
    );
  }
}

class FirstOnboardingPage extends StatefulWidget {
  const FirstOnboardingPage({Key? key}) : super(key: key);

  @override
  State<FirstOnboardingPage> createState() => _FirstOnboardingPageState();
}

class _FirstOnboardingPageState extends State<FirstOnboardingPage>
    with SingleTickerProviderStateMixin {
  double position = 0;
  late AnimationController _controller;
  late Animation _slideAnimation;
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600),
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
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(
          children: [
            AnimatedBuilder(
              animation: _controller,
              builder: (BuildContext context, _) {
                return Positioned(
                  right:
                      MediaQuery.of(context).size.width * _slideAnimation.value,
                  top: MediaQuery.of(context).size.height * .1,
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.width * .8,
                    //decoration: const BoxDecoration(color: Colors.red),
                    child: Center(
                      child: Image(
                        image: const AssetImage(
                          'lib/core/assets/images/on1.jpg',
                        ),
                        fit: BoxFit.cover,
                        width: MediaQuery.of(context).size.width * .8,
                        height: MediaQuery.of(context).size.width,
                      ),
                    ),
                  ),
                );
              },
            ),
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
                  top: MediaQuery.of(context).size.height * .45,
                  left:
                      MediaQuery.of(context).size.width * _slideAnimation.value,
                  child: const Padding(
                    padding: EdgeInsets.only(left: 20),
                    child: LargeFont(
                      text: 'Find the \nbest Cars & \nBikes for you',
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
                        builder: ((context) => const CommonScreenScaffold()),
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
