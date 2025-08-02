import 'package:cointicker/api/models/coins_model.dart';
import 'package:cointicker/widgets/coin_card.dart';
import 'package:cointicker/widgets/inflow_row.dart';
import 'package:flutter/material.dart';

class CoinDetailsSheet extends StatelessWidget {
  final Coin coin;
  const CoinDetailsSheet({super.key, required this.coin});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              CircleAvatar(
                backgroundImage: NetworkImage(coin.image),
                radius: 20,
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Text(
                  coin.name,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
              ),
              const Spacer(),
              IconButton(
                  onPressed: () => Navigator.of(context).pop(),
                  icon: const Icon(Icons.close))
            ],
          ),
          SingleChildScrollView(
            child: Column(
              spacing: 10,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                const Divider(height: 24),
                InfoRow(title: "💰 Symbol", value: coin.symbol.toUpperCase()),
                InfoRow(title: "🔢 Rank", value: "#${coin.marketCapRank}"),
                InfoRow(
                    title: "🏦 Market Cap",
                    value: '\$${formatMarketCap(coin.marketCap)}'),
                InfoRow(
                  title: "🔄 24h Change",
                  value: "${coin.priceChangePercentage24h.toStringAsFixed(2)}%",
                  textColor: coin.priceChangePercentage24h >= 0
                      ? Colors.green
                      : Colors.red,
                ),
                InfoRow(
                    title: "📈 Current Price",
                    value: "\$${formatPrices(coin.currentPrice)}"),
                InfoRow(
                    title: "↗️ 24h High",
                    value: "\$${formatPrices(coin.high24h)}"),
                InfoRow(
                    title: "↘️ 24h Low",
                    value: "\$${formatPrices(coin.low24h)}"),
                InfoRow(
                    title: "📉 All-Time Low",
                    value: "\$${formatPrices(coin.atl)}"),
                InfoRow(
                    title: "🚀 All-Time High",
                    value: "\$${formatPrices(coin.ath)}"),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
