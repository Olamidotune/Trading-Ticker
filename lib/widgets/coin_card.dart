import 'package:cointicker/bloc/coin/coin_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:sizer/sizer.dart';

class CoinCard extends StatelessWidget {
  final String coinImage;
  final String coinName;
  final String coinSymbol;
  final double coinPrice;
  final num marketCap;
  final num rank;
  final double priceChangePercentage;
  final VoidCallback? onPressed;

  const CoinCard({
    super.key,
    required this.coinImage,
    required this.coinName,
    required this.coinSymbol,
    required this.coinPrice,
    required this.priceChangePercentage,
    required this.rank,
    required this.marketCap,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    final double change = context
            .read<CoinBloc>()
            .state
            .coinList
            ?.firstWhere((coin) => coin.name == coinName)
            .priceChangePercentage24h
            .toDouble() ??
        0.0;
    Color textColor;
    String icon;

    if (change > 0) {
      textColor = Colors.green;
      icon = '▲';
    } else if (change < 0) {
      textColor = Colors.red;
      icon = '▼';
    } else {
      textColor = Colors.grey;
      icon = '-';
    }

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: GestureDetector(
        onTap: onPressed,
        child: Container(
          height: 10.h,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: const [
              BoxShadow(
                  color: Colors.blueGrey,
                  offset: Offset(5, 5),
                  blurRadius: 2,
                  spreadRadius: 1),
              BoxShadow(
                  color: Colors.grey,
                  offset: Offset(-3, -3),
                  blurRadius: 10,
                  spreadRadius: 2)
            ],
          ),
          child: ListTile(
            title: Row(
              children: [
                Text(
                  rank.toString(),
                  style:
                      TextStyle(fontSize: 14.sp, fontWeight: FontWeight.bold),
                ),
                const SizedBox(width: 10),
                Image.network(coinImage, width: 40, height: 40),
                const SizedBox(width: 10),
                Text(
                  coinSymbol.toUpperCase(),
                  style: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.bold),
                ),
                const Spacer(),
                Text(
                  '\$${formatPrices(coinPrice)}',
                  style:
                      TextStyle(fontSize: 14.sp, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            subtitle: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Text('Market Cap',
                        style:
                            TextStyle(fontSize: 12, color: Colors.grey[600])),
                    Text(
                      '\$${formatMarketCap(marketCap)}',
                      style: TextStyle(fontSize: 12.sp, color: Colors.black87),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Text('24hr Change %',
                        style:
                            TextStyle(fontSize: 12, color: Colors.grey[600])),
                    Text(
                      '$icon ${change.toStringAsFixed(2)}%',
                      style: TextStyle(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.bold,
                          color: textColor),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

String formatMarketCap(num number) {
  if (number >= 1e12) {
    return '${(number / 1e12).toStringAsFixed(2)}T';
  } else if (number >= 1e9) {
    return '${(number / 1e9).toStringAsFixed(2)}B';
  } else if (number >= 1e6) {
    return '${(number / 1e6).toStringAsFixed(2)}M';
  } else if (number >= 1e3) {
    return '${(number / 1e3).toStringAsFixed(2)}K';
  } else {
    return number.toString();
  }
}

String formatPrices(num number, [int decimal = 2]) {
  final formatter = NumberFormat('#,##0.${'0' * decimal}');
  return formatter.format(number);
}
