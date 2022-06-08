
import 'package:flutter/material.dart';

class BrandCoiceChipWidget extends StatelessWidget {
  final String imageUrl;
  final String brandName;
  const BrandCoiceChipWidget({
    required this.brandName,
    required this.imageUrl,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      //mainAxisSize: MainAxisSize.min,
      children: [
        Image(
          image: AssetImage(imageUrl),
        ),
        const SizedBox(
          width: 4,
        ),
        Text(brandName)
      ],
    );
  }
}