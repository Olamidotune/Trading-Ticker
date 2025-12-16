import 'package:cointicker/api/models/coins_model.dart';
import 'package:cointicker/bloc/coin/coin_bloc.dart';
import 'package:cointicker/constants/app_colors.dart';
import 'package:cointicker/constants/app_spacing.dart';
import 'package:cointicker/services/toast_service.dart';
import 'package:cointicker/widgets/coin_card.dart';
import 'package:cointicker/widgets/inflow_row.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';

class CoinDetailsSheet extends StatelessWidget {
  final Coin coin;
  const CoinDetailsSheet({super.key, required this.coin});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CoinBloc, CoinState>(
      buildWhen: (previous, current) =>
          _coinDetailsBuildWhen(context, previous, current),
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      backgroundImage: NetworkImage(coin.image),
                      radius: 20,
                    ),
                    AppSpacing.horizontalSpaceMedium,
                    IconButton(
                      onPressed: () {
                        state.isInWatchlist(coin.id)
                            ? context
                                .read<CoinBloc>()
                                .add(CoinEvent.removeFromWatchList(coin))
                            : context
                                .read<CoinBloc>()
                                .add(CoinEvent.addToWatchList(coin));
                      },
                      icon: state.isInWatchlist(coin.id)
                          ? const Icon(
                              Icons.star, // 👈 Filled star when in watchlist
                              color: AppColors.goldColor,
                            )
                          : const Icon(
                              Icons
                                  .star_border_rounded, // 👈 Outlined star when NOT in watchlist
                            ),
                    ),
                    AppSpacing.horizontalSpaceMedium,
                    Expanded(
                      child: Text(
                        coin.name,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                    ),
                    const Spacer(),
                    IconButton(
                        onPressed: () => Navigator.of(context).pop(),
                        icon: const Icon(Icons.close))
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Divider(height: 24),
                    InfoRow(
                        title: "💰 Symbol", value: coin.symbol.toUpperCase()),
                    AppSpacing.verticalSpaceLarge,
                    InfoRow(title: "🔢 Rank", value: "#${coin.marketCapRank}"),
                    AppSpacing.verticalSpaceLarge,
                    InfoRow(
                        title: "🏦 Market Cap",
                        value: '\$${formatMarketCap(coin.marketCap ?? 0.00)}'),
                    AppSpacing.verticalSpaceLarge,
                    InfoRow(
                      title: "🔄 24h Change",
                      value:
                          "${coin.priceChangePercentage24h?.toStringAsFixed(2)}%",
                      textColor: (coin.priceChangePercentage24h ?? 0) >= 0
                          ? Colors.green
                          : Colors.red,
                    ),
                    AppSpacing.verticalSpaceLarge,
                    InfoRow(
                      title: "📈 Current Price",
                      value: "\$${formatPrices(coin.currentPrice ?? 0)}",
                      textColor: (coin.priceChangePercentage24h ?? 0) >= 0
                          ? Colors.green
                          : Colors.red,
                    ),
                    AppSpacing.verticalSpaceLarge,
                    InfoRow(
                        title: "↗️ 24h High",
                        value: "\$${formatPrices(coin.high24h ?? 0.00)}"),
                    AppSpacing.verticalSpaceLarge,
                    InfoRow(
                        title: "↘️ 24h Low",
                        value: "\$${formatPrices(coin.low24h ?? 0)}"),
                    AppSpacing.verticalSpaceLarge,
                    InfoRow(
                        title: "📉 All-Time Low",
                        value: "\$${formatPrices(coin.atl ?? 0)}"),
                    AppSpacing.verticalSpaceLarge,
                    InfoRow(
                        title: "🚀 All-Time High",
                        value: "\$${formatPrices(coin.ath ?? 0)}"),
                    AppSpacing.verticalSpaceLarge,
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  _coinDetailsBuildWhen(
      BuildContext context, CoinState previous, CoinState current) {
    if (previous.addToWatchListStatus != previous.addToWatchListStatus ||
        previous.addToWatchListStatus.isInProgress &&
            current.addToWatchListStatus.isSuccess) {
      ToastService.toast('Coin added to wishlist');
      return true;
    } else if (previous.removeFromWatchListStatus !=
            previous.removeFromWatchListStatus ||
        previous.removeFromWatchListStatus.isInProgress &&
            current.removeFromWatchListStatus.isSuccess) {
      ToastService.toast('Coin removed from wishlist');
      return true;
    } else if (previous.errorMessage != current.errorMessage &&
        current.errorMessage != null) {
      ToastService.toast('Something went wrong.', ToastType.error);
      return true;
    }

    return false;
  }
}
