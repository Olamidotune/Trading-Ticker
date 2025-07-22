import 'package:cointicker/widgets/error_dialog.dart';
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
          extendBodyBehindAppBar: true,
          appBar: AppBar(
            title: const Text(
              'Trading Ticker',
            ),
            backgroundColor: Colors.grey[800],
            elevation: 0,
          ),
          body: state.getCoinStatus == FormzSubmissionStatus.inProgress &&
                  (state.coinList == null || state.coinList!.isEmpty)
              ? const Center(
                  child: CircularProgressIndicator.adaptive(),
                )
              : ListView.builder(
                  itemCount: state.coinList?.length ?? 0,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    final coins = state.coinList?[index];
                    return CoinCard(
                      coinImage: coins?.image ?? '',
                      coinName: coins?.name ?? '',
                      coinSymbol: coins?.symbol ?? '',
                      coinPrice: coins?.currentPrice.toDouble() ?? 0.0,
                      priceChange: coins?.priceChange24h.toDouble() ?? 0.0,
                      priceChangePercentage:
                          coins?.priceChangePercentage24h.toDouble() ?? 0.0,
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
