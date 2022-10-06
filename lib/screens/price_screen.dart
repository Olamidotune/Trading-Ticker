import 'dart:async';
import 'package:cointicker/services.dart/coin_data.dart';
import 'package:flutter/material.dart';
import '../widgets/coin_card.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../widgets/error_dialog.dart';

String url =
    'https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=100&page=1&sparkline=false';

class PriceScreen extends StatefulWidget {
  static const String routeName = 'PriceScreen';
  const PriceScreen({Key? key}) : super(key: key);

  @override
  State<PriceScreen> createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> {
  List coinList = [];
  Future<List<dynamic>> fetchData() async {
    final response = await http.get(Uri.parse(url));
    try {
      if (response.statusCode == 200) {
        List<dynamic> values = [];
        values = jsonDecode(response.body);
        if (values.isNotEmpty) {
          for (int i = 0; i < values.length; i++) {
            if (values[i] != null) {
              Map<String, dynamic> map = values[i];
              coinList.add(Coin.fromJson(map));
            }
          }
          if (!mounted) return coinList;
          setState(() {
            coinList;
          });
        }
      }
    } catch (e) {
      print('exception');
    }

    return coinList;
  }

  @override
  void initState() {
    super.initState();
    Timer.periodic(const Duration(seconds: 1), (timer) => fetchData());
    fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: const Text(
          'Trading Ticker',
        ),
        backgroundColor: Colors.grey[800],
        elevation: 0,
      ),
      body: coinList.isEmpty
          ? const Center(
              child: CircularProgressIndicator.adaptive(),
            )
          : ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: coinList.length,
              shrinkWrap: true,
              itemBuilder: ((context, index) {
                return CoinCard(
                  coinImage: coinList[index].coinImage,
                  coinName: coinList[index].coinName,
                  coinSymbol: coinList[index].coinSymbol,
                  coinPrice: coinList[index].coinPrice.toDouble(),
                  priceChange: coinList[index].priceChange.toDouble(),
                  priceChangePercentage:
                      coinList[index].priceChangePercentage.toDouble(),
                );
              }),
            ),
    );
  }

  void _showDialog(Duration _) {
    showDialog(
      context: context,
      builder: (BuildContext context) => ErrorDialog(),
    );
  }
}
