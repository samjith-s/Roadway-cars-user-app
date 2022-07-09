import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:roadway/application/favourites/favourites_bloc.dart';
import 'package:roadway/core/constants/colors.dart';

class FavouritesButton extends StatelessWidget {
  final String vehicleId;
  const FavouritesButton({
    Key? key,
    required this.vehicleId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      padding: EdgeInsets.zero,
      constraints: const BoxConstraints(),
      onPressed: () {
        BlocProvider.of<FavouritesBloc>(context).add(
          AddOrRemoveFromFavourites(vehicleId: vehicleId),
        );
      },
      icon: BlocBuilder<FavouritesBloc, FavouritesState>(
        builder: (context, state) {
          return Icon(
            Icons.favorite,
            color: state.favouritesIds.contains(vehicleId) ? Colors.red : kLightColor,
          );
        },
      ),
    );
  }
}
