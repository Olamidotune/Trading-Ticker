import 'package:cointicker/api/models/coins_model.dart';
import 'package:cointicker/bloc/coin/coin_bloc.dart';
import 'package:cointicker/widgets/coin_card.dart';
import 'package:cointicker/widgets/coin_details_dialog.dart';
import 'package:cointicker/widgets/coin_search_bar.dart';
import 'package:cointicker/widgets/sort_filter_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';

String url =
    'https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=100&page=1&sparkline=false';

class PriceScreen extends StatefulWidget {
  static const String routeName = 'PriceScreen';
  const PriceScreen({super.key});

  @override
  State<PriceScreen> createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> {
  @override
  void initState() {
    super.initState();
    context.read<CoinBloc>().add(const CoinEvent.fetchCoins());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CoinBloc, CoinState>(
      builder: (context, state) {
        return Scaffold(
          backgroundColor: Colors.black,
          extendBodyBehindAppBar: true,
          appBar: AppBar(
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(70),
              child: Row(
                children: [
                  const Expanded(
                    child: CoinSearchBar(),
                  ),
                  const SizedBox(width: 8),
                  IconButton(
                    icon: const Icon(Icons.sort),
                    onPressed: () {
                      showModalBottomSheet(
                        context: context,
                        builder: (_) => const SortFilterSheet(),
                      );
                    },
                  ),
                ],
              ),
            ),
            title: const Text(
              'Trading Ticker',
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            backgroundColor: Colors.grey[900],
            elevation: 0,
          ),
          body: state.getCoinStatus == FormzSubmissionStatus.inProgress &&
                  (state.coinList == null || state.coinList!.isEmpty)
              ? const Center(
                  child: CircularProgressIndicator.adaptive(),
                )
              : (state.computedGiftCards.isEmpty)
                  ? const Center(
                      child: Text(
                        'No coins found',
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                    )
                  : ListView.builder(
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
                        );
                      },
                    ),
        );
      },
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
}
