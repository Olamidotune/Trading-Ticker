import 'package:cached_network_image/cached_network_image.dart';
import 'package:cointicker/bloc/coin/coin_bloc.dart';
import 'package:cointicker/constants/app_colors.dart';
import 'package:cointicker/constants/app_spacing.dart';
import 'package:fl_chart/fl_chart.dart';
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
  final List<double> sparklinePrices;

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
    required this.sparklinePrices,
  });

  @override
  Widget build(BuildContext context) {
    final double change = context
            .read<CoinBloc>()
            .state
            .coinList
            ?.firstWhere((coin) => coin.name == coinName)
            .priceChangePercentage24h ??
        0.toDouble();
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
      padding: const EdgeInsets.all(5.0),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: AppColors.blackColor.withValues(alpha: .1)),
          borderRadius: BorderRadius.circular(10),
          color: Theme.of(context).inputDecorationTheme.fillColor,
        ),
        child: ListTile(
          onTap: onPressed,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                rank.toString(),
                style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.bold),
              ),
              const SizedBox(width: 10),
              CachedNetworkImage(
                imageUrl: coinImage,
                height: 40,
                width: 40,
                fit: BoxFit.cover,
                placeholder: (context, url) => const Center(
                  child: CircularProgressIndicator(color: Colors.black),
                ),
                errorWidget: (context, url, error) => const Icon(
                  Icons.image_not_supported_outlined,
                  size: 50,
                ),
              ),
              const SizedBox(width: 10),
              Text(
                coinSymbol.toUpperCase(),
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const Spacer(),
              Text(
                '\$${formatPrices(coinPrice)}',
                style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          subtitle: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  AppSpacing.verticalSpaceTiny,
                  Text('Market Cap',
                      style: Theme.of(context).textTheme.bodySmall),
                  Text(
                    '\$${formatMarketCap(marketCap)}',
                    style: TextStyle(fontSize: 12.sp),
                  ),
                ],
              ),
              LineGraph(sparklinePrices: sparklinePrices, color: textColor),
              Column(
                children: [
                  AppSpacing.verticalSpaceTiny,
                  Text('24hr Change %',
                      style: Theme.of(context).textTheme.bodySmall),
                  Text(
                    '$icon ${change.toStringAsFixed(2)}%',
                    style: TextStyle(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.bold,
                      color: textColor,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class LineGraph extends StatelessWidget {
  const LineGraph({
    super.key,
    required this.sparklinePrices,
    required this.color,
  });

  final List<double> sparklinePrices;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 80,
      height: 40,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 10.0),
        child: LineChart(
          LineChartData(
            lineBarsData: [
              LineChartBarData(
                spots: sparklinePrices
                    .asMap()
                    .entries
                    .map((e) => FlSpot(e.key.toDouble(), e.value))
                    .toList(),
                isCurved: true,
                dotData: const FlDotData(show: false),
                color: color,
                belowBarData: BarAreaData(show: false),
                barWidth: 2,
              ),
            ],
            titlesData: const FlTitlesData(show: false),
            gridData: const FlGridData(show: false),
            borderData: FlBorderData(show: false),
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
