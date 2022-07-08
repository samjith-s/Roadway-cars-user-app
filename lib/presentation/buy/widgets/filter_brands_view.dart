import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:roadway/application/buy/buy_screen_bloc.dart';
import 'package:roadway/core/constants/colors.dart';
import 'package:roadway/core/constants/texts.dart';
import 'package:roadway/domain/buy_screen/models/brand_medel.dart';
import 'package:roadway/presentation/buy/screens/buy_screen.dart';

ValueNotifier<List<String>> selectedBrands = ValueNotifier([]);

class AllBrandsCheckBoxList extends StatelessWidget {
  const AllBrandsCheckBoxList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Padding(
          padding: constFilterPadding,
          child: const MontserratCustom(text: 'Choose from options below'),
        ),
        BlocBuilder<BuyScreenBloc, BuyScreenState>(
          builder: (context, state) {
            return state.isLoading
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      final item = state.brandsList[index];
                      return ConfigurableBrandCheckBoxListTile(
                        brand: item,
                      );
                    },
                    itemCount: state.brandsList.length,
                  );
          },
        )
      ],
    );
  }
}

class ConfigurableBrandCheckBoxListTile extends StatelessWidget {
  const ConfigurableBrandCheckBoxListTile({
    Key? key,
    required this.brand,
  }) : super(key: key);

  final Brand brand;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: selectedBrands,
      builder: (BuildContext context, List<String> value, Widget? child) {
        return Row(
          children: [
            Checkbox(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(2.0),
              ),
              side: MaterialStateBorderSide.resolveWith(
                (states) => const BorderSide(
                  width: 1.0,
                  color: kBlack,
                ),
              ),
              checkColor: kBlack,
              fillColor: MaterialStateProperty.all(
                kWhite,
              ),
              value: value.contains(brand.name),
              onChanged: (selected) {
                if (value.contains(brand.name)) {
                  selectedBrands.value.remove(brand.name);
                  totalSelectedFilters.value.removeWhere((element) => element.itemName == brand.name);
                  totalSelectedFilters.notifyListeners();
                  selectedBrands.notifyListeners();
                } else {
                  selectedBrands.value.add(brand.name);
                  selectedBrands.notifyListeners();
                  totalSelectedFilters.value.add(
                    FilterItem(
                      itemType: 'brand',
                      itemName: brand.name,
                      onRemoved: () {
                        selectedBrands.value.remove(brand.name);
                        totalSelectedFilters.value.removeWhere((element) => element.itemName == brand.name);
                        selectedBrands.notifyListeners();
                        totalSelectedFilters.notifyListeners();
                      },
                    ),
                  );
                  totalSelectedFilters.notifyListeners();
                }
              },
            ),
            CircleAvatar(
              radius: 10,
              backgroundImage: NetworkImage(brand.imagePath),
              backgroundColor: kWhite,
            ),
            const SizedBox(width: 6),
            Text(brand.name),
          ],
        );
      },
    );
  }
}
