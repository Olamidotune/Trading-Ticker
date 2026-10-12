import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/svg.dart';
import 'package:formz/formz.dart';
import 'package:lottie/lottie.dart';

import 'package:cointicker/bloc/crypto/crypto_bloc.dart';
import 'package:cointicker/constants/app_colors.dart';
import 'package:cointicker/constants/app_spacing.dart';
import 'package:cointicker/screens/tabs/home_screen.dart';
import 'package:cointicker/widgets/coin_details_sheet.dart';
import 'package:cointicker/widgets/coin_search_bar.dart';
import 'package:cointicker/widgets/desktop_coin_card.dart';
import 'package:cointicker/widgets/dialogs/filter_coins_dialog.dart';

class WebHomeScreen extends HookWidget {
  const WebHomeScreen({super.key});

  static const String routeName = '/web/home';

  @override
  Widget build(BuildContext context) {
    final controller = useAnimationController();

    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(15),
            bottomRight: Radius.circular(15),
          ),
        ),
        title: Padding(
          padding: EdgeInsets.symmetric(
            vertical: 30,
            horizontal: MediaQuery.of(context).size.width / 6,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 50),
              Text(
                'Home',
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      color: AppColors.whiteColor,
                    ),
              ),
              Text(
                "Explore the top 100 cryptocurrencies by market capitalization. Search coins, track market movements, and save your favorites to your personal watchlist.",
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: AppColors.whiteColor,
                      fontWeight: FontWeight.w400,
                    ),
                maxLines: 3,
              ),
            ],
          ),
        ),
        toolbarHeight: 140,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          vertical: 30,
          horizontal: MediaQuery.of(context).size.width / 6,
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Expanded(flex: 9, child: CoinSearchBar()),
                AppSpacing.horizontalSpaceHuge,
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
            AppSpacing.verticalSpaceMassive,

            // Give the list/content the remaining available height.
            Expanded(
              child: BlocBuilder<CryptoBloc, CryptoState>(
                builder: (context, state) {
                  if (state.getCoinStatus == FormzSubmissionStatus.inProgress &&
                      state.computedCrypto.isEmpty) {
                    return ListView.builder(
                      itemCount: 10,
                      itemBuilder: (context, index) {
                        return const CustomShimmer();
                      },
                    );
                  }

                  if (state.getCoinStatus == FormzSubmissionStatus.failure &&
                      state.computedCrypto.isEmpty) {
                    return _buildMessageState(
                      context: context,
                      controller: controller,
                      asset: 'assets/lottie/no_data.json',
                      message: 'Something went wrong',
                    );
                  }

                  if (state.computedCrypto.isEmpty) {
                    return _buildMessageState(
                      context: context,
                      controller: controller,
                      asset: 'assets/lottie/empty.json',
                      message: 'No coin found',
                    );
                  }

                  return ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    itemCount: state.computedCrypto.length,
                    itemBuilder: (context, index) {
                      final coin = state.computedCrypto[index];
                      return DesktopCoinCard(
                        onPressed: () {
                          showModalBottomSheet(
                            context: context,
                            useSafeArea: true,
                            isScrollControlled: true,
                            builder: (_) => CoinDetailsSheet(
                              coin: coin,
                            ),
                          );
                        },
                        marketCap: coin.marketCap ?? 0,
                        rank: coin.marketCapRank ?? 0,
                        coinImage: coin.image,
                        coinName: coin.name,
                        coinSymbol: coin.symbol,
                        coinPrice: coin.currentPrice ?? 0.0,
                        priceChangePercentage:
                            coin.priceChangePercentage24h ?? 0.0,
                        sparklinePrices: coin.sparklineIn7D?.price ?? [],
                        coinId: coin.id,
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMessageState({
    required BuildContext context,
    required AnimationController controller,
    required String asset,
    required String message,
  }) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            height: 250,
            child: Lottie.asset(
              asset,
              controller: controller,
              repeat: false,
              onLoaded: (composition) {
                controller
                  ..duration = composition.duration
                  ..repeat();
              },
            ),
          ),
          const SizedBox(height: 16),
          Text(
            message,
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                ),
          ),
        ],
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
    if (!context.read<CryptoBloc>().state.sortBy24ChangeDesc &&
        !context.read<CryptoBloc>().state.sortByPriceDesc) {
      context
          .read<CryptoBloc>()
          .add(CryptoEvent.sortByMarketCapDesc((value ?? false)));
    }
    return;
  }
}
