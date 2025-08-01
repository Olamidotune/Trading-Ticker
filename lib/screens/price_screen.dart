// ignore_for_file: use_build_context_synchronously

import 'package:cointicker/api/models/coins_model.dart';
import 'package:cointicker/bloc/coin/coin_bloc.dart';
import 'package:cointicker/constants/app_colors.dart';
import 'package:cointicker/constants/app_spacing.dart';
import 'package:cointicker/widgets/coin_card.dart';
import 'package:cointicker/widgets/coin_details_dialog.dart';
import 'package:cointicker/widgets/coin_search_bar.dart';
import 'package:cointicker/widgets/dialogs/filter_coins_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:formz/formz.dart';
import 'package:shimmer/shimmer.dart';

class PriceScreen extends StatelessWidget {
  static const String routeName = 'Price-Screen';
  const PriceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(15),
                bottomRight: Radius.circular(15))),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(90),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: Row(
                  children: [
                    const Expanded(
                      child: CoinSearchBar(),
                    ),
                    const SizedBox(width: 8),
                    GestureDetector(
                      onTap: () {
                        // showModalBottomSheet(
                        //   context: context,
                        //   builder: (_) => const SortFilterSheet(),
                        // );

                        _showFilterDialog(context, true);
                      },
                      child: CircleAvatar(
                        radius: 25,
                        child: SvgPicture.asset('assets/svg/filter.svg'),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
        title: const Text(
          'Trading Ticker',
          style: TextStyle(color: AppColors.whiteColor),
        ),
      ),
      body: BlocBuilder<CoinBloc, CoinState>(
        builder: (context, state) {
          if (state.getCoinStatus == FormzSubmissionStatus.inProgress &&
              (state.computedGiftCards.isEmpty)) {
            return ListView.builder(
              itemCount: 10,
              itemBuilder: (context, index) {
                return const CustomShimmer();
              },
            );
          }
          if (state.getCoinStatus == FormzSubmissionStatus.failure) {
            return const Center(
              child: Text(
                'Failed to load coins',
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
            );
          }
          if (state.computedGiftCards.isEmpty) {
            return const Center(
              child: Text(
                'No coins found',
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
            );
          }
          return Padding(
            padding: EdgeInsets.symmetric(
                horizontal: AppSpacing.horizontalSpacingSmall),
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: state.computedGiftCards.length,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                final coin = state.computedGiftCards[index];
                return CoinCard(
                  onPressed: () => _coinDetailsDialog(context, coin),
                  marketCap: coin.marketCap,
                  rank: coin.marketCapRank,
                  coinImage: coin.image,
                  coinName: coin.name,
                  coinSymbol: coin.symbol,
                  coinPrice: coin.currentPrice.toDouble(),
                  priceChangePercentage: state
                      .computedGiftCards[index].priceChangePercentage24h
                      .toDouble(),
                  sparklinePrices: coin.sparklineIn7D?.price ?? [],
                );
              },
            ),
          );
        },
      ),
    );
  }

  void _coinDetailsDialog(BuildContext context, Coin coin) {
    showDialog(
      context: context,
      builder: (context) {
        return CoinDetailsDialog(coin: coin);
      },
    );
  }

  void _showFilterDialog(BuildContext context, bool? value) async {
    await showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) {
          return const FilterCoinsDialog();
        });
    if (!context.read<CoinBloc>().state.sortBy24ChangeDesc &&
        !context.read<CoinBloc>().state.sortByPriceDesc) {
      context
          .read<CoinBloc>()
          .add(CoinEvent.sortByMarketCapDesc((value ?? false)));
    }
    return;
  }
}

class CustomShimmer extends StatelessWidget {
  const CustomShimmer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.white,
      highlightColor: Colors.red[100]!,
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Container(
          width: double.infinity,
          height: 100,
          color: Colors.white,
        ),
      ),
    );
  }
}
