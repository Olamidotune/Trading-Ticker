// ignore_for_file: use_build_context_synchronously

import 'package:cointicker/bloc/coin/coin_bloc.dart';
import 'package:cointicker/constants/app_colors.dart';
import 'package:cointicker/constants/app_spacing.dart';
import 'package:cointicker/widgets/coin_card.dart';
import 'package:cointicker/widgets/coin_search_bar.dart';
import 'package:cointicker/widgets/dialogs/filter_coins_dialog.dart';
import 'package:cointicker/widgets/coin_details_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/svg.dart';
import 'package:formz/formz.dart';
import 'package:lottie/lottie.dart';
import 'package:shimmer/shimmer.dart';

class PriceScreen extends HookWidget {
  static const String routeName = 'Price-Screen';
  const PriceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = useAnimationController();
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
                        _showFilterDialog(context, true);
                      },
                      child: CircleAvatar(
                        backgroundColor: AppColors.whiteColor,
                        radius: 25,
                        child: SvgPicture.asset(
                          'assets/svg/filter.svg',
                        ),
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
          if ((state.coinList?.isEmpty ?? true) ||
              state.getCoinStatus == FormzSubmissionStatus.failure) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  flex: 9,
                  child: Lottie.asset(
                      width: double.infinity,
                      'assets/lottie/no_data.json',
                      controller: controller,
                      repeat: false, onLoaded: (composition) {
                    controller
                      ..duration = composition.duration
                      ..repeat();
                  }),
                ),
                Expanded(
                  flex: 3,
                  child: Text(
                    'Something went wrong',
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge
                        ?.copyWith(fontWeight: FontWeight.bold, fontSize: 24),
                  ),
                )
              ],
            );
          }
          if (state.computedGiftCards.isEmpty) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  flex: 9,
                  child: Lottie.asset(
                      width: double.infinity,
                      'assets/lottie/empty.json',
                      controller: controller,
                      repeat: false, onLoaded: (composition) {
                    controller
                      ..duration = composition.duration
                      ..repeat();
                  }),
                ),
                Expanded(
                  flex: 3,
                  child: Text(
                    'No coin found',
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge
                        ?.copyWith(fontWeight: FontWeight.bold, fontSize: 24),
                  ),
                )
              ],
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
                  // onPressed: () => _coinDetailsDialog(context, coin),
                  onPressed: () => showModalBottomSheet(
                      useSafeArea: true,
                      context: context,
                      builder: (_) => CoinDetailsSheet(
                            coin: coin,
                          )),
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
      highlightColor: Theme.of(context).primaryColor,
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
