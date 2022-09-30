import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class CoinCard extends StatelessWidget {
  final String coinImage;
  final String coinName;
  final String coinSymbol;
  final double coinPrice;
  final double priceChange;
  final double priceChangePercentage;
  final VoidCallback? onPressed;

  CoinCard({
    required this.coinImage,
    required this.coinName,
    required this.coinSymbol,
    required this.coinPrice,
    required this.priceChange,
    required this.priceChangePercentage,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: GestureDetector(
        onTap: onPressed,
        child: Container(
          height: 10.h,
          decoration: BoxDecoration(
            color: Colors.white38,
            borderRadius: BorderRadius.circular(20),
            boxShadow: const [
              BoxShadow(
                  color: Colors.grey,
                  offset: Offset(5, 5),
                  blurRadius: 10,
                  spreadRadius: 2),
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
                  child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.grey.withAlpha(3),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.grey.shade600,
                                offset: const Offset(7, 10),
                                blurRadius: 16,
                                spreadRadius: 1),
                            const BoxShadow(
                                color: Colors.white70,
                                offset: Offset(-10, -7),
                                blurRadius: 16,
                                spreadRadius: 1),
                          ]),
                      height: 15.h,
                      width: 15.w,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Image.network(coinImage),
                      )),
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
                        style:
                            TextStyle(fontSize: 15.sp, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Row(
                      children: [
                        Text(
                          priceChange.toDouble() < 0
                              ? priceChange.toInt().toStringAsFixed(1)
                              // : '+' + priceChange.toDouble().toString(),
                              : '+${priceChange.toInt().toStringAsFixed(1)}',
                          style: TextStyle(
                              fontSize: 10.sp,
                              fontWeight: FontWeight.bold,
                              color: priceChange < 0
                                  ? Colors.red
                                  : Colors.green.shade700),
                        ),
                        SizedBox(
                          width: 3.w,
                        ),
                        Text(
                          priceChangePercentage.toDouble() < 0
                              ? '${priceChangePercentage.toDouble()}%'
                              : '+${priceChangePercentage.toDouble().toStringAsFixed(1)}%',
                          style: TextStyle(
                              fontSize: 10.sp,
                              fontWeight: FontWeight.bold,
                              color: priceChangePercentage < 0
                                  ? Colors.red
                                  : Colors.green.shade700),
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
