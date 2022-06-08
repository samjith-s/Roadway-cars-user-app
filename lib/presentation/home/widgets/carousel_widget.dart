
import 'package:flutter/material.dart';

class HomeScreenCarousel extends StatelessWidget {
  const HomeScreenCarousel({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.width * .6,
      child: Padding(
        padding: const EdgeInsets.all(5),
        child: PageView(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.width * .7,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                image: const DecorationImage(
                  image: NetworkImage(
                      'https://cdni.autocarindia.com/Utils/ImageResizer.ashx?n=http%3A%2F%2Fcdni.autocarindia.com%2FReviews%2F20210630113205_S-class-static.jpg&c=0'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.width * .7,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                image: const DecorationImage(
                  image: NetworkImage(
                      'http://www.dadislearning.com/wp-content/uploads/2013/09/1967-mustang-fastback-gta.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}