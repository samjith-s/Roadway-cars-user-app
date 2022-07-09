import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:roadway/application/buy/buy_screen_bloc.dart';
import 'package:roadway/core/constants/colors.dart';
import 'package:roadway/domain/buy_screen/models/vehicle_model.dart';
import 'package:roadway/presentation/buy/screens/search_result_seeall_sceen.dart';
import 'package:roadway/presentation/buy/screens/vehicle_details_screen.dart';
import 'package:roadway/presentation/buy/widgets/favorites_icon_button.dart';

class AvailableVehiclesGridviewBuyscreen extends StatelessWidget {
  final BuyScreenState state;
  const AvailableVehiclesGridviewBuyscreen({
    Key? key,
    required this.state,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 20,
        right: 20,
        top: 15,
      ),
      child: GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 10,
          childAspectRatio: .8,
        ),
        itemBuilder: (contx, index) {
          Vehicle vehicle = state.vehiclesList[index];
          return GestureDetector(
            //signle vehicle item ontap function
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: ((context) => VehicleDetailsShowScreen(
                        isFilterOn: false,
                        index: index,
                      )),
                ),
              );
            },
            child: LayoutBuilder(builder: (BuildContext context, BoxConstraints constraints) {
              return Container(
                decoration: const BoxDecoration(
                  color: kBlack,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(15),
                    bottomLeft: Radius.circular(15),
                  ),
                ),
                child: Stack(
                  children: [
                    //vehicle image showing section
                    SizedBox(
                      child: ClipRRect(
                        borderRadius: const BorderRadius.only(
                          topRight: Radius.circular(15),
                          bottomLeft: Radius.circular(15),
                        ),
                        child: Image(
                          image: NetworkImage(
                            vehicle.images[0],
                          ),
                          fit: BoxFit.fitHeight,
                          errorBuilder: (BuildContext c, Object o, StackTrace? s) {
                            return Container(
                              decoration: const BoxDecoration(
                                color: kBlack,
                              ),
                              height: constraints.maxHeight * .55,
                            );
                          },
                        ),
                      ),
                    ),

                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: Container(
                        width: constraints.maxWidth,
                        height: constraints.maxHeight * .47,
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(10),
                            bottomRight: Radius.circular(10),
                          ),
                        ),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: const EdgeInsets.only(
                              left: 12,
                              top: 10,
                              bottom: 10,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    //Brand name text
                                    Text(
                                      vehicle.brand,
                                      maxLines: 1,
                                      overflow: TextOverflow.clip,
                                      style: GoogleFonts.roboto(
                                        fontSize: 12,
                                        color: kGray,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    //Model name text
                                    Text(
                                      vehicle.model,
                                      style: GoogleFonts.nunito(
                                        fontSize: 13,
                                        color: kWhite,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                                //Price show text
                                Container(
                                  width: 55,
                                  padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 3),
                                  decoration: BoxDecoration(
                                    color: kWhite,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Text(
                                    '${vehicle.price >= 100 ? (vehicle.price / 100).round() : removeDecimalZero(vehicle.price)} ${vehicle.price >= 100 ? 'Cr' : 'Lac'}',
                                    style: GoogleFonts.montserrat(
                                      fontSize: 10,
                                      fontWeight: FontWeight.bold,
                                      color: kBlack,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      right: 5,
                      top: 5,
                      child: FavouritesButton(vehicleId: vehicle.id!),
                    )
                  ],
                ),
              );
            }),
          );
        },
        itemCount: state.vehiclesList.length,
      ),
    );
  }
}
