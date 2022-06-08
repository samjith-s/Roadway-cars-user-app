import 'package:flutter/material.dart';

class SectionTitleRowWidget extends StatelessWidget {
  final String sectionTitle;
  final void Function() onSeeAllPressed;
  const SectionTitleRowWidget({
    required this.sectionTitle,
    required this.onSeeAllPressed,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(sectionTitle),
          GestureDetector(
            onTap: onSeeAllPressed,
            child: const Text('See all'),
          ),
        ],
      ),
    );
  }
}
