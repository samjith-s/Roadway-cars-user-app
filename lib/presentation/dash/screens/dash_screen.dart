import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:roadway/core/constants/colors.dart';
import 'package:roadway/presentation/dash/widgets/dash_tile_widget.dart';
import 'package:roadway/presentation/widgets/blue_icon_button.dart';

class DashScreen extends StatelessWidget {
  const DashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: const EdgeInsets.symmetric(vertical: 12),
                width: MediaQuery.of(context).size.width - 24,
                height: MediaQuery.of(context).size.width * .6,
                decoration: BoxDecoration(
                  color: kLightColor.withOpacity(.2),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Stack(
                  children: [
                    Positioned(
                      right: 0,
                      top: 0,
                      child: IconButton(
                        onPressed: () {
                          log('edit');
                        },
                        icon: const Icon(Icons.edit_note_outlined),
                      ),
                    ),
                    Align(
                      child: PhysicalModel(
                        shape: BoxShape.circle,
                        color: Colors.transparent,
                        elevation: 3,
                        child: CircleAvatar(
                          radius: 50,
                          backgroundColor: kWhite,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(40),
                            child: const Image(
                              image: NetworkImage(
                                'https://static.xx.fbcdn.net/assets/?revision=816167972411634&name=desktop-creating-an-account-icon&density=1',
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    const Align(
                      alignment: Alignment.bottomCenter,
                      child: Padding(
                        padding: EdgeInsets.only(bottom: 30),
                        child: Text('Name'),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
          const CustomDashTilewidget(
            title: "My Pre-Bookings",
            subTitle: "see your pre-booing details here",
            leading: Icons.book,
          ),
          const CustomDashTilewidget(
            title: "My Favourites",
            subTitle: "see your favourite vehicle",
            leading: Icons.favorite,
          ),
          const CustomDashTilewidget(
            title: "Register an enquery",
            subTitle: "register an enquery to know more details",
            leading: Icons.add_comment_outlined,
          ),
          const CustomDashTilewidget(
            title: "Contact details",
            subTitle: "see your given contact details",
            leading: Icons.perm_contact_cal_outlined,
          ),
          const CustomDashTilewidget(
            title: "Notifications",
            subTitle: "control the notifications",
            leading: Icons.notifications,
            tailing: Icons.toggle_on_outlined,
          ),
          const SizedBox(height: 30),
          Padding(
            padding: const EdgeInsets.all(15),
            child: AppBlueIconButton(
              text: 'Log out',
              width: MediaQuery.of(context).size.width * .37,
              onTap: () {},
            ),
          ),
        ],
      ),
    );
  }
}
