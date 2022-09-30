import 'dart:async';

import 'package:cointicker/screens/seach_screen.dart';
import 'package:cointicker/services.dart/coin_data.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart';
import '../widgets/coin_card.dart';
import 'dart:convert';

import 'package:http/http.dart' as http;

String url =
    'https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=100&page=1&sparkline=false';

class PriceScreen extends StatefulWidget {
  static const String routeName = 'PriceScreen';
  const PriceScreen({Key? key}) : super(key: key);

  @override
  State<PriceScreen> createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> {
  Future<List<dynamic>> fetchData() async {
    coinList = [];
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
          setState(() {
            coinList;
          });
        }
      }
      return coinList;
    } catch (e) {
      throw Exception('Could not fetch data');
    }
  }

  @override
  void initState() {
    super.initState();
    Timer.periodic(const Duration(seconds: 10), (timer) => fetchData());
    fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        leading: IconButton(
          tooltip: 'Refresh Data',
          onPressed: () {
            fetchData();
          },
          icon: const Icon(
            FontAwesomeIcons.rotateRight,
            color: Colors.white,
          ),
        ),
        title: const Text(
          'Trading Ticker',
        ),
        backgroundColor: Colors.grey.shade900,
        elevation: 10,
      ),
      body: ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: coinList.length,
        itemBuilder: ((context, index) {
          return CoinCard(
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => SearchScreen(),
              ),
            ),
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
}
