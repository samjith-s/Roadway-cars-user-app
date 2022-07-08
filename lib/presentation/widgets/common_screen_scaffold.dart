import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:roadway/application/buy/buy_screen_bloc.dart';
import 'package:roadway/application/user/user_cubit.dart';
import 'package:roadway/core/constants/colors.dart';
import 'package:roadway/presentation/buy/screens/buy_screen.dart';
import 'package:roadway/presentation/chat/chat_screen.dart';
import 'package:roadway/presentation/dash/screens/dash_screen.dart';
import 'package:roadway/presentation/home/screens/home_screen.dart';
import 'package:roadway/presentation/sell/screens/sell_inro_screen.dart';
import 'package:roadway/presentation/widgets/costum_navbar_widget.dart';

class CommonScreenScaffold extends StatefulWidget {
  const CommonScreenScaffold({Key? key}) : super(key: key);

  @override
  State<CommonScreenScaffold> createState() => _CommonScreenScaffoldState();
}

class _CommonScreenScaffoldState extends State<CommonScreenScaffold> {
  @override
  void initState() {
    super.initState();
  }

  List<Widget> screens = const [
    HomeScreen(),
    BuyScreen(),
    SellScreen(),
    DashScreen(),
  ];
  int currentScreen = 0;
  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      log('get all called from home screen');
      //BlocProvider.of<BuyScreenBloc>(context).add(const GetAllVehicles());
      BlocProvider.of<BuyScreenBloc>(context).add(const GetAllBodyTypes());
      BlocProvider.of<BuyScreenBloc>(context).add(const GetAllSegments());
      BlocProvider.of<BuyScreenBloc>(context).add(const GetAllBrands());
      BlocProvider.of<UserCubit>(context).getUserDetails();
    });
    return Scaffold(
      drawer: const AppDrawerWidget(),
      appBar: PreferredSize(
        preferredSize: Size(MediaQuery.of(context).size.width, 60),
        child: AppBar(
          backgroundColor: kWhite,
          title: const Text(
            'Roadway',
          ),
          leading: Builder(
            builder: ((con) => IconButton(
                  icon: const Icon(
                    Icons.menu,
                    color: kBlack,
                  ),
                  onPressed: () => Scaffold.of(con).openDrawer(),
                )),
          ),
          centerTitle: true,
          actions: [
            currentScreen != 3
                ? IconButton(
                    padding: EdgeInsets.zero,
                    constraints: const BoxConstraints(),
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: ((context) => const UserChatScreen()),
                        ),
                      );
                    },
                    icon: const Icon(
                      Icons.mark_chat_unread_outlined,
                      color: kBlack,
                    ),
                  )
                : const SizedBox(
                    width: 15,
                  ),
            const SizedBox(
              width: 15,
            )
          ],
        ),
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

class AppDrawerWidget extends StatelessWidget {
  const AppDrawerWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: const EdgeInsets.all(0),
        children: [
          DrawerHeader(
            decoration: const BoxDecoration(
              color: kGreen,
            ),
            child: UserAccountsDrawerHeader(
              decoration: const BoxDecoration(color: kGreen),
              accountName: Text(
                "Name",
                style: GoogleFonts.roboto(),
              ),
              accountEmail: const Text("abc@gmeil.com"),
              currentAccountPictureSize: const Size.square(50),
              currentAccountPicture: const CircleAvatar(
                backgroundColor: kYellow,
                child: Image(
                  image: NetworkImage(
                    'https://static.xx.fbcdn.net/assets/?revision=816167972411634&name=desktop-creating-an-account-icon&density=1',
                  ),
                ),
              ),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.book),
            title: const Text('My Pre-Bookings '),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: const Icon(Icons.call),
            title: const Text('Enquiries '),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: const Icon(Icons.favorite),
            title: const Text('Favorite Cars '),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: const Icon(Icons.edit),
            title: const Text(' Edit Profile '),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: const Icon(Icons.logout),
            title: const Text('LogOut'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
