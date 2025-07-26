import 'package:cointicker/api/models/coins_model.dart';
import 'package:cointicker/widgets/coin_card.dart';
import 'package:cointicker/widgets/inflow_row.dart';
import 'package:flutter/material.dart';

class CoinDetailsDialog extends StatelessWidget {
  final Coin coin;
  const CoinDetailsDialog({
    super.key,
    required this.coin,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      titlePadding: const EdgeInsets.only(top: 16, left: 20, right: 20),
      contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      title: Row(
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
        ],
      ),
      content: SingleChildScrollView(
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
                title: "↗️ 24h High", value: "\$${formatPrices(coin.high24h)}"),
            InfoRow(
                title: "↘️ 24h Low", value: "\$${formatPrices(coin.low24h)}"),
            InfoRow(
                title: "📉 All-Time Low", value: "\$${formatPrices(coin.atl)}"),
            InfoRow(
                title: "🚀 All-Time High",
                value: "\$${formatPrices(coin.ath)}"),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text('Close'),
        ),
      ],
    );
  }
}
