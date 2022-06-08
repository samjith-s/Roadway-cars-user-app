import 'package:flutter/material.dart';
import 'package:roadway/presentation/buy/screens/buy_screen.dart';
import 'package:roadway/presentation/dash/screens/dash_screen.dart';
import 'package:roadway/presentation/home/screens/home_screen.dart';
import 'package:roadway/presentation/onbaording/screens/first_onboarding_screen.dart';
import 'package:roadway/presentation/onbaording/screens/second_onboarding_screen.dart';
import 'package:roadway/presentation/sell/screens/sell_inro_screen.dart';
import 'package:roadway/presentation/widgets/costum_appbar_widget.dart';
import 'package:roadway/presentation/widgets/costum_navbar_widget.dart';

class CommonScreenScaffold extends StatefulWidget {
  const CommonScreenScaffold({Key? key}) : super(key: key);

  @override
  State<CommonScreenScaffold> createState() => _CommonScreenScaffoldState();
}

class _CommonScreenScaffoldState extends State<CommonScreenScaffold> {
  List<Widget> screens = const [
    HomeScreen(),
    BuyScreen(),
    SellScreen(),
    DashScreen(),
  ];
  int currentScreen = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(MediaQuery.of(context).size.width, 60),
        child: const CustomAppBar(),
      ),
      body: Stack(
        children: [
          screens[currentScreen],
          Positioned(
            bottom: 0,
            child: CustomNavBar(
              changeScreen: changeScreen,
            ),
          )
        ],
      ),
    );
  }

  changeScreen(int selectedIndex) {
    setState(() {
      currentScreen = selectedIndex;
    });
  }
}
