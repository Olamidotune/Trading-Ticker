import 'package:cointicker/bloc/coin/coin_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

class CoinCard extends StatelessWidget {
  final String coinImage;
  final String coinName;
  final String coinSymbol;
  final double coinPrice;

  final double priceChangePercentage;
  final VoidCallback? onPressed;

  const CoinCard({
    super.key,
    required this.coinImage,
    required this.coinName,
    required this.coinSymbol,
    required this.coinPrice,
    required this.priceChangePercentage,
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
      icon = '–';
    }

    return Padding(
      padding: const EdgeInsets.all(15.0),
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
          child: Padding(
            padding: const EdgeInsets.only(left: 5.0, right: 10),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.network(coinImage),
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        flex: 2,
                        child: Text(
                          coinName,
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                          maxLines: 2,
                          textAlign: TextAlign.start,
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Text(
                          coinSymbol,
                          style: TextStyle(
                              fontSize: 10.sp, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    FittedBox(
                      fit: BoxFit.scaleDown,
                      child: Text(
                        ' \$$coinPrice',
                        style: TextStyle(
                            fontSize: 15.sp, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: 3.w,
                        ),
                        // Text(
                        //   priceChangePercentage.toDouble() < 0
                        //       ? '${priceChangePercentage.toDouble()}%'
                        //       : '+${priceChangePercentage.toDouble().toStringAsFixed(1)}%',
                        //   style: TextStyle(
                        // fontSize: 10.sp,
                        // fontWeight: FontWeight.bold,
                        //       color: priceChangePercentage < 0
                        //           ? Colors.red
                        //           : Colors.green.shade700),
                        // ),

                        Text(
                          '$icon ${change.toStringAsFixed(2)}%',
                          style: TextStyle(
                              fontSize: 10.sp,
                              fontWeight: FontWeight.bold,
                              color: textColor),
                        ),
                      ],
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
