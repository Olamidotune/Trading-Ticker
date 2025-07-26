import 'package:cointicker/bloc/coin/coin_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SortFilterSheet extends StatelessWidget {
  const SortFilterSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text('Sort By', style: TextStyle(fontWeight: FontWeight.bold)),
          ListTile(
            title: const Text('Market Cap (High to Low)'),
            onTap: () {
              context
                  .read<CoinBloc>()
                  .add(const CoinEvent.sortByMarketCapDesc());
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: const Text('Price (High to Low)'),
            onTap: () {
              context.read<CoinBloc>().add(const CoinEvent.sortByPriceDesc());
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: const Text('24h Gainers'),
            onTap: () {
              context
                  .read<CoinBloc>()
                  .add(const CoinEvent.sortBy24hChangeDesc());
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
