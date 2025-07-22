import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';

import '../bloc/coin/coin_bloc.dart';
import '../widgets/coin_card.dart';

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
              preferredSize: Size.fromHeight(70),
              child: SearchBar(
                hintText: 'Search for a coin',
                onChanged: (value) {
                  context.read<CoinBloc>().add(
                        CoinEvent.cryptoSearchStringChanged(value),
                      );
                },
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
                        //Add ranking to this later

                        return CoinCard(
                          // coinImage: coins?.image ?? '',
                          // coinName: coins?.name ?? '',
                          // coinSymbol: coins?.symbol ?? '',
                          // coinPrice: coins?.currentPrice.toDouble() ?? 0.0,
                          // priceChangePercentage:
                          //     coins?.priceChangePercentage24h.toDouble() ?? 0.0,

                          coinImage: state.computedGiftCards[index].image,
                          coinName: state.computedGiftCards[index].name,
                          coinSymbol: state.computedGiftCards[index].symbol,
                          coinPrice: state.computedGiftCards[index].currentPrice
                              .toDouble(),
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

  // void _showDialog(Duration _) {
  //   showDialog(
  //     context: context,
  //     builder: (BuildContext context) => ErrorDialog(),
  //   );
  // }
}
