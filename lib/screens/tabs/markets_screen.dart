import 'package:cointicker/bloc/coin/crypto_bloc.dart';
import 'package:cointicker/constants/app_colors.dart';
import 'package:cointicker/widgets/coin_card.dart';
import 'package:cointicker/widgets/coin_details_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class MarketsScreen extends HookWidget {
  const MarketsScreen({super.key});

  static const String routeName = 'markets_screen';

  @override
  Widget build(BuildContext context) {
    final tabController = useTabController(initialLength: 5);
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(15),
            bottomRight: Radius.circular(15),
          ),
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 50),
            Text(
              'Markets',
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    color: AppColors.whiteColor,
                  ),
            ),
            Text(
              "Discover coins driving today's market activity.",
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    color: AppColors.whiteColor,
                    fontWeight: FontWeight.w400,
                  ),
            ),
          ],
        ),
        toolbarHeight: 140,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(50),
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            padding: const EdgeInsets.all(4),
            decoration: BoxDecoration(
              color: AppColors.whiteColor,
              borderRadius: BorderRadius.circular(30),
            ),
            child: TabBar(
              indicatorSize: TabBarIndicatorSize.tab,
              dividerColor: Colors.transparent,
              controller: tabController,
              isScrollable: false,
              indicator: BoxDecoration(
                color: AppColors.whiteColor,
                borderRadius: BorderRadius.circular(30),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.blackColor.withValues(alpha: .2),
                    blurRadius: 4,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              labelColor: Colors.black,
              unselectedLabelColor: AppColors.greyColor,
              tabs: const [
                Tab(
                  child: Text(
                    'Favorites',
                    style: TextStyle(overflow: TextOverflow.ellipsis),
                  ),
                ),
                Tab(
                  text: "Gainers",
                ),
                Tab(text: "Losers"),
                Tab(text: "Volume"),
                Tab(text: "MCap"),
              ],
            ),
          ),
        ),
      ),
      body: TabBarView(
        controller: tabController,
        children: const [
          FavoritesTab(),
          Center(child: Text('Gainers')),
          Center(child: Text('Losers')),
          Center(child: Text('Volume')),
          Center(child: Text('MCap')),
        ],
      ),
    );
  }
}

class FavoritesTab extends StatelessWidget {
  const FavoritesTab({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CryptoBloc, CryptoState>(
      builder: (context, state) {
        if (state.watchlistCoinIds.isEmpty) {
          return Center(
            child: Text(
              'Your favorites list is empty.\nAdd coins to your favorites to see them here.',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    color: AppColors.greyColor,
                  ),
            ),
          );
        }
        return ListView.builder(
          itemCount: state.watchlistCoinIds.length,
          itemBuilder: (context, index) {
            final coin = state.coinList?.firstWhere(
              (coin) => coin.id == state.watchlistCoinIds.elementAt(index),
            );
            return CoinCard(
              onPressed: () => showModalBottomSheet(
                  useSafeArea: true,
                  context: context,
                  builder: (_) => CoinDetailsSheet(
                        coin: coin!,
                      )),
              marketCap: coin?.marketCap ?? 0,
              rank: coin?.marketCapRank ?? 0,
              coinImage: coin?.image ?? '',
              coinName: coin?.name ?? '',
              coinSymbol: coin?.symbol ?? '',
              coinPrice: coin?.currentPrice ?? 0.toDouble(),
              priceChangePercentage:
                  state.computedGiftCards[index].priceChangePercentage24h ??
                      0.toDouble(),
              sparklinePrices: coin?.sparklineIn7D?.price ?? [],
              coinId: coin?.id ?? '',
            );
          },
        );
      },
    );
  }
}

class GainersTab extends StatelessWidget {
  const GainersTab({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CryptoBloc, CryptoState>(
      builder: (context, state) {
        return ListView.builder(
          itemCount: state.watchlistCoinIds.length,
          itemBuilder: (context, index) {
            final coin = state.coinList?.firstWhere(
              (coin) => coin.id == state.watchlistCoinIds.elementAt(index),
            );
            return CoinCard(
              onPressed: () => showModalBottomSheet(
                  useSafeArea: true,
                  context: context,
                  builder: (_) => CoinDetailsSheet(
                        coin: coin!,
                      )),
              marketCap: coin?.marketCap ?? 0,
              rank: coin?.marketCapRank ?? 0,
              coinImage: coin?.image ?? '',
              coinName: coin?.name ?? '',
              coinSymbol: coin?.symbol ?? '',
              coinPrice: coin?.currentPrice ?? 0.toDouble(),
              priceChangePercentage:
                  state.computedGiftCards[index].priceChangePercentage24h ??
                      0.toDouble(),
              sparklinePrices: coin?.sparklineIn7D?.price ?? [],
              coinId: coin?.id ?? '',
            );
          },
        );
      },
    );
  }
}
