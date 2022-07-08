import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:roadway/application/buy/buy_screen_bloc.dart';
import 'package:roadway/core/constants/colors.dart';
import 'package:roadway/domain/buy_screen/models/vehicle_model.dart';
import 'package:roadway/presentation/buy/screens/search_result_seeall_sceen.dart';
import 'package:roadway/presentation/buy/widgets/carousel_indicator.dart';
import 'package:roadway/presentation/chat/chat_screen.dart';

class VehicleDetailsShowScreen extends StatefulWidget {
  final int index;
  final bool isFilterOn;
  const VehicleDetailsShowScreen({Key? key, required this.index, required this.isFilterOn}) : super(key: key);

  @override
  State<VehicleDetailsShowScreen> createState() => _VehicleDetailsShowScreenState();
}

class _VehicleDetailsShowScreenState extends State<VehicleDetailsShowScreen> {
  late PageController _controller;
  @override
  void initState() {
    super.initState();
    _controller = PageController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BuyScreenBloc, BuyScreenState>(
      builder: (context, state) {
        Vehicle vehicle = widget.isFilterOn ? state.filterList[widget.index] : state.vehiclesList[widget.index];
        List<String> vehicleFields = [
          vehicle.manufactureYear,
          vehicle.registrationYear,
          vehicle.fuelType,
          vehicle.color,
          vehicle.ownerCount,
          vehicle.mileage,
          vehicle.kilometers,
          vehicle.regPlace
        ];
        return Scaffold(
          appBar: AppBar(
            leading: IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: const Icon(
                Icons.arrow_back,
                color: kBlack,
              ),
              color: kBlack,
            ),
            title: const Text(
              'Details',
            ),
            centerTitle: true,
          ),
          body: CustomScrollView(
            slivers: [
              SliverFillRemaining(
                hasScrollBody: false,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      //margin: EdgeInsets.only(top: 20),
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height * .3,
                      color: kBlack,
                      child: Stack(
                        children: [
                          PageView.builder(
                            itemBuilder: ((context, index) {
                              return Container(
                                width: MediaQuery.of(context).size.width,
                                height: MediaQuery.of(context).size.height * .3,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: NetworkImage(
                                      vehicle.images[index],
                                    ),
                                  ),
                                ),
                              );
                            }),
                            itemCount: vehicle.images.length,
                            controller: _controller,
                          ),
                          CarouselIndicatorWidget(
                            controller: _controller,
                            count: vehicle.images.length,
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 15,
                        vertical: 15,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                vehicle.brand,
                                style: GoogleFonts.roboto(
                                  fontSize: 17,
                                  color: darkGrey,
                                  //fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                vehicle.model,
                                style: GoogleFonts.nunito(
                                  fontSize: 21,
                                  color: kBlack,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 8),
                            //width: MediaQuery.of(context).size.width * .4,
                            height: MediaQuery.of(context).size.height * .05,
                            decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 237, 150, 21),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Center(
                              child: Text(
                                '₹ ${vehicle.price >= 100 ? (vehicle.price / 100).round() : removeDecimalZero(vehicle.price)} ${vehicle.price >= 100 ? 'Cr' : 'Lac'}',
                                style: GoogleFonts.poppins(fontSize: 18),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 15, top: 15),
                      child: SizedBox(
                        height: 105,
                        child: ListView.separated(
                          scrollDirection: Axis.horizontal,
                          shrinkWrap: true,
                          itemBuilder: ((context, index) {
                            return Container(
                              decoration:
                                  BoxDecoration(color: kWhite.withOpacity(.3), borderRadius: BorderRadius.circular(15)),
                              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
                              //width: (MediaQuery.of(context).size.width - 45) / 2,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Image(
                                    image: AssetImage(iconsList[index]),
                                    width: 25,
                                  ),
                                  const SizedBox(height: 4),
                                  Text(
                                    vehicleFields[index],
                                    style: GoogleFonts.poppins(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  Text(
                                    propertiesList[index],
                                    style: GoogleFonts.poppins(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w600,
                                      color: kBlack.withOpacity(.5),
                                    ),
                                  )
                                ],
                              ),
                            );
                          }),
                          separatorBuilder: (context, index) {
                            return const SizedBox(width: 10);
                          },
                          itemCount: 8,
                        ),
                      ),
                    ),
                    const Expanded(child: SizedBox()),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => UserChatScreen(
                              placeHolderMsg: 'I would like to know the details of ${vehicle.brand} ${vehicle.model}.',
                            ),
                          ),
                        );
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width - 30,
                        margin: const EdgeInsets.only(
                          bottom: 50,
                          right: 15,
                          left: 15,
                        ),
                        decoration: BoxDecoration(color: kWhite, borderRadius: BorderRadius.circular(8)),
                        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                        child: Center(
                          child: Text(
                            'BOOK NOW',
                            style: GoogleFonts.poppins(
                              fontSize: 21,
                              color: kBlack,
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

List<String> iconsList = [
  'lib/core/assets/images/Registration-Icon.png',
  'lib/core/assets/images/Manufacture-Icon-new.png',
  'lib/core/assets/images/Fuel-Icon.png',
  'lib/core/assets/images/Color-Icon.png',
  'lib/core/assets/images/Man-Icon.png',
  'lib/core/assets/images/Mileage-Icon.png',
  'lib/core/assets/images/Kilometer-Icon.png',
  'lib/core/assets/images/Registration-Icon.png',
];
List<String> propertiesList = [
  'MFG YEAR',
  'REG YEAR',
  'FUEL TYPE',
  'COLOR',
  'OWNER',
  'MILEAGE',
  'KILOMETERS',
  'REG PLACE',
];
