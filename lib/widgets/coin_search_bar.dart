import 'package:cointicker/bloc/coin/coin_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CoinSearchBar extends StatefulWidget {
  const CoinSearchBar({super.key});

  @override
  State<CoinSearchBar> createState() => _CoinSearchBarState();
}

class _CoinSearchBarState extends State<CoinSearchBar> {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SearchBar(
      hintText: 'Search for a coin',
      controller: _controller,
      onChanged: (value) {
        context.read<CoinBloc>().add(
              CoinEvent.cryptoSearchStringChanged(value),
            );
        setState(() {}); // to toggle clear button visibility
      },
      trailing: [
        if (_controller.text.isNotEmpty)
          IconButton(
            icon: const Icon(Icons.clear),
            onPressed: () {
              _controller.clear();
              context.read<CoinBloc>().add(
                    const CoinEvent.cryptoSearchStringChanged(''),
                  );
              setState(() {});
            },
          )
      ],
    );
  }
}
