import 'package:cached_network_image/cached_network_image.dart';
import 'package:cointicker/bloc/crypto/crypto_bloc.dart';
import 'package:cointicker/constants/app_colors.dart';
import 'package:cointicker/constants/app_spacing.dart';
import 'package:cointicker/widgets/coin_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DesktopVolumeCard extends StatelessWidget {
  final String coinImage;
  final String coinName;
  final String coinSymbol;
  final String coinId;
  final num? marketCap;
  final double coinPrice;
  final num rank;
  final VoidCallback? onPressed;
  final double? volume;

  const DesktopVolumeCard(
      {super.key,
      required this.coinImage,
      required this.coinName,
      required this.coinSymbol,
      required this.coinPrice,
      required this.rank,
      this.marketCap,
      required this.coinId,
      this.onPressed,
      this.volume});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: BlocBuilder<CryptoBloc, CryptoState>(
        builder: (context, state) {
          return Container(
            decoration: BoxDecoration(
              border:
                  Border.all(color: AppColors.blackColor.withValues(alpha: .1)),
              borderRadius: BorderRadius.circular(10),
            ),
            child: ListTile(
              tileColor: Theme.of(context).inputDecorationTheme.fillColor,
              onTap: onPressed,
              title: Row(
                children: [
                  Column(
                    children: [
                      Text(
                        'Rank',
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                      Text(
                        rank.toString(),
                        style: Theme.of(context)
                            .textTheme
                            .bodyLarge
                            ?.copyWith(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  AppSpacing.horizontalSpaceSmall,
                  CachedNetworkImage(
                    imageUrl: coinImage,
                    height: 40,
                    width: 40,
                    fit: BoxFit.cover,
                    placeholder: (context, url) => const Center(
                      child: CircularProgressIndicator(color: Colors.black),
                    ),
                    errorWidget: (context, url, error) => const Icon(
                      Icons.image_not_supported_outlined,
                      size: 50,
                    ),
                  ),
                  AppSpacing.horizontalSpaceSmall,
                  Text(
                    coinSymbol.toUpperCase(),
                    style: TextTheme.of(context).headlineMedium,
                  ),
                  AppSpacing.horizontalSpaceTiny,
                  state.isInWatchlist(coinId)
                      ? const Icon(
                          Icons.star,
                          color: AppColors.goldColor,
                          size: 15,
                        )
                      : const Icon(
                          Icons.star_border_rounded,
                          size: 15,
                        ),
                ],
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppSpacing.verticalSpaceTiny,
                  Text('Market Price',
                      style: Theme.of(context).textTheme.bodySmall),
                  Text(
                    '\$${formatPrices(coinPrice)}',
                    style: TextTheme.of(context).headlineMedium,
                  ),
                ],
              ),
              trailing: Column(
                children: [
                  AppSpacing.verticalSpaceTiny,
                  Text((volume != null) ? '24hr Volume' : '24hr Market Cap',
                      style: Theme.of(context).textTheme.bodyLarge),
                  Text(
                    (volume != null)
                        ? '\$${formatMarketCap(volume!)}'
                        : '\$${formatMarketCap(marketCap ?? 0)}',
                    style: TextTheme.of(context)
                        .bodyMedium
                        ?.copyWith(fontWeight: FontWeight.bold, fontSize: 14),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
