import 'package:flutter/material.dart';
import 'package:roadway/core/constants/colors.dart';

class CustomSearchFieldWidget extends StatelessWidget {
  const CustomSearchFieldWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15, right: 15),
      child: Container(
        decoration: BoxDecoration(
            color: kWhite, borderRadius: BorderRadius.circular(25)),
        width: MediaQuery.of(context).size.width - 30,
        height: 50,
        child: Row(
          children: const [
            // Padding(
            //   padding: EdgeInsets.only(left: 10, right: 4),
            //   child: Icon(Icons.search),
            // ),
            Expanded(
              child: TextField(
                decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "Find your favorate car..",
                    prefixIcon: Icon(Icons.search)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
