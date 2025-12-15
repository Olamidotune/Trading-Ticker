import 'package:json_annotation/json_annotation.dart';

part 'coins_model.g.dart';

@JsonSerializable()
class Coin {
  final String id;
  final String symbol;
  final String name;
  final String image;

  @JsonKey(name: 'current_price')
  final double? currentPrice;

  @JsonKey(name: 'market_cap')
  final num? marketCap;

  @JsonKey(name: 'market_cap_rank')
  final int? marketCapRank;

  @JsonKey(name: 'fully_diluted_valuation')
  final num? fullyDilutedValuation;

  @JsonKey(name: 'total_volume')
  final num? totalVolume;

  @JsonKey(name: 'high_24h')
  final double? high24h;

  @JsonKey(name: 'low_24h')
  final double? low24h;

  @JsonKey(name: 'price_change_24h')
  final double? priceChange24h;

  @JsonKey(name: 'price_change_percentage_24h')
  final double? priceChangePercentage24h;

  @JsonKey(name: 'market_cap_change_24h')
  final num? marketCapChange24h;

  @JsonKey(name: 'market_cap_change_percentage_24h')
  final double? marketCapChangePercentage24h;

  @JsonKey(name: 'circulating_supply')
  final num? circulatingSupply;

  @JsonKey(name: 'total_supply')
  final num? totalSupply;

  @JsonKey(name: 'max_supply')
  final num? maxSupply;

  final double? ath;

  @JsonKey(name: 'ath_change_percentage')
  final double? athChangePercentage;

  @JsonKey(name: 'ath_date')
  final String? athDate;

  final double? atl;

  @JsonKey(name: 'atl_change_percentage')
  final double? atlChangePercentage;

  @JsonKey(name: 'atl_date')
  final String? atlDate;

  final Roi? roi;

  @JsonKey(name: 'last_updated')
  final String? lastUpdated;

  @JsonKey(name: "sparkline_in_7d")
  final SparkLine? sparklineIn7D;

  @JsonKey(name: "price_change_percentage_1h_in_currency")
  final double? priceChangePercentage1hInCurrency;

  @JsonKey(name: "price_change_percentage_7d_in_currency")
  final double? priceChangePercentage7dInCurrency;

  @JsonKey(name: "price_change_percentage_14d_in_currency")
  final double? priceChangePercentage14dInCurrency;

  Coin(
      this.id,
      this.symbol,
      this.name,
      this.image,
      this.currentPrice,
      this.marketCap,
      this.marketCapRank,
      this.fullyDilutedValuation,
      this.totalVolume,
      this.high24h,
      this.low24h,
      this.priceChange24h,
      this.priceChangePercentage24h,
      this.marketCapChange24h,
      this.marketCapChangePercentage24h,
      this.circulatingSupply,
      this.totalSupply,
      this.maxSupply,
      this.ath,
      this.athChangePercentage,
      this.athDate,
      this.atl,
      this.atlChangePercentage,
      this.atlDate,
      this.roi,
      this.lastUpdated,
      this.sparklineIn7D,
      this.priceChangePercentage1hInCurrency,
      this.priceChangePercentage7dInCurrency,
      this.priceChangePercentage14dInCurrency);

  factory Coin.fromJson(Map<String, dynamic> json) => _$CoinFromJson(json);
  Map<String, dynamic> toJson() => _$CoinToJson(this);
}

@JsonSerializable()
class Roi {
  final double times;
  final String currency;
  final double percentage;

  Roi({
    required this.times,
    required this.currency,
    required this.percentage,
  });

  factory Roi.fromJson(Map<String, dynamic> json) => _$RoiFromJson(json);
  Map<String, dynamic> toJson() => _$RoiToJson(this);
}

@JsonSerializable()
class SparkLine {
  @JsonKey(name: "price")
  List<double>? price;

  SparkLine({
    this.price,
  });

  factory SparkLine.fromJson(Map<String, dynamic> json) =>
      _$SparkLineFromJson(json);

  Map<String, dynamic> toJson() => _$SparkLineToJson(this);
}
