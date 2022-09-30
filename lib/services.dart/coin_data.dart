import 'package:flutter/material.dart';

class Coin {
  Coin({
    required this.coinImage,
    required this.coinName,
    required this.coinSymbol,
    required this.coinPrice,
    required this.priceChange,
    required this.priceChangePercentage,
  });

  String coinImage;
  String coinName;
  String coinSymbol;
  num coinPrice;
  num priceChange;
  num priceChangePercentage;

  factory Coin.fromJson(Map<String, dynamic> json) {
    return Coin(
        coinImage: json['image'],
        coinName: json['name'],
        coinSymbol: json['symbol'],
        coinPrice: json['current_price'],
        priceChange: json['price_change_24h'],
        priceChangePercentage: json['price_change_percentage_24h']);
  }
}

List coinList = [];
