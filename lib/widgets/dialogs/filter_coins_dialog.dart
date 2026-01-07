import 'package:cointicker/bloc/coin/crypto_bloc.dart';
import 'package:cointicker/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FilterCoinsDialog extends StatelessWidget {
  const FilterCoinsDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      titlePadding: const EdgeInsets.only(top: 20, left: 15, right: 15),
      contentPadding: const EdgeInsets.only(left: 5, right: 5, bottom: 10),
      insetPadding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(20.0)),
      ),
      title: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Sort by",
                      style: Theme.of(context)
                          .textTheme
                          .bodyLarge
                          ?.copyWith(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Align(
                  alignment: Alignment.centerRight,
                  child: GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: const Icon(
                      Icons.close,
                    ),
                  ),
                ),
              ),
            ],
          ),
          const Divider(thickness: 1, height: 20),
        ],
      ),
      content: BlocBuilder<CryptoBloc, CryptoState>(
        builder: (context, state) => SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              CheckboxListTile(
                title: const Text(
                  "Select All",
                ),
                activeColor: AppColors.primaryColor,
                checkColor: Colors.white,
                value: state.isAllFilterSelected,
                onChanged: (bool? value) {
                  context
                      .read<CryptoBloc>()
                      .add(CryptoEvent.sortByMarketCapDesc(value ?? false));
                },
              ),
              CheckboxListTile(
                activeColor: AppColors.primaryColor,
                checkColor: Colors.white,
                title: const Text(
                  "Price (High to Low)",
                ),
                value: state.sortByPriceDesc,
                onChanged: (bool? value) {
                  context
                      .read<CryptoBloc>()
                      .add(CryptoEvent.sortByPriceDesc(value ?? false));
                },
              ),
              CheckboxListTile(
                activeColor: AppColors.primaryColor,
                checkColor: Colors.white,
                title: const Text(
                  "24h Gainers",
                ),
                value: state.sortBy24ChangeDesc,
                onChanged: (bool? value) {
                  context
                      .read<CryptoBloc>()
                      .add(CryptoEvent.sortBy24hChangeDesc(value ?? false));
                },
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
