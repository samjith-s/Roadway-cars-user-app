import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:roadway/core/constants/colors.dart';
import 'package:roadway/presentation/sell/widgets/apply_button_widget.dart';
import 'package:roadway/presentation/sell/widgets/sell_screen_dropdown.dart';
import 'package:roadway/presentation/sell/widgets/sell_screen_fromfield_widget.dart';
import 'package:roadway/presentation/widgets/costum_appbar_widget.dart';

class SellFormSubmitScreen extends StatefulWidget {
  const SellFormSubmitScreen({Key? key}) : super(key: key);

  @override
  State<SellFormSubmitScreen> createState() => _SellFormSubmitScreenState();
}

class _SellFormSubmitScreenState extends State<SellFormSubmitScreen> {
  late TextEditingController makeController;
  late TextEditingController modelController;
  late TextEditingController bodyTypeController;
  late TextEditingController numberController;
  @override
  void initState() {
    super.initState();
    makeController = TextEditingController(text: 'BMW');
    modelController = TextEditingController();
    bodyTypeController = TextEditingController();
    numberController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    makeController.dispose();
    modelController.dispose();
    bodyTypeController.dispose();
    numberController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: kWhite,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.arrow_circle_left,
            color: kBlack,
            size: 30,
          ),
        ),
        title: Text(
          'Roadway',
          style: GoogleFonts.poppins(color: kBlack),
        ),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 30),
          SellScreenFormFieldWidget(
            controller: makeController,
            textFieldTitle: 'Make',
            hintText: 'make',
          ),
          SellScreenFormFieldWidget(
            controller: modelController,
            textFieldTitle: 'Model',
            hintText: 'model',
          ),
          SellScreenFormFieldWidget(
            controller: bodyTypeController,
            textFieldTitle: 'Body type',
            hintText: 'body',
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SellScreenDropDownWidget(
                title: 'Year',
                list: yearList,
              ),
              const SizedBox(width: 20),
              SellScreenDropDownWidget(
                title: 'Mileage',
                list: mileageList,
              ),
            ],
          ),
          SellScreenFormFieldWidget(
            controller: numberController,
            textFieldTitle: 'Contact Number',
            hintText: 'change the number',
          ),
          const ApplyButton()
        ],
      ),
    );
  }
}

List<String> yearList = ['2000', '2001', '2002'];
List<String> mileageList = ['2', '12', '22'];
