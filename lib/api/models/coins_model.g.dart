// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'coins_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Coin _$CoinFromJson(Map<String, dynamic> json) => Coin(
      id: json['id'] as String,
      symbol: json['symbol'] as String,
      name: json['name'] as String,
      image: json['image'] as String,
      currentPrice: (json['current_price'] as num).toDouble(),
      marketCap: json['market_cap'] as num,
      marketCapRank: (json['market_cap_rank'] as num).toInt(),
      fullyDilutedValuation: json['fully_diluted_valuation'] as num?,
      totalVolume: json['total_volume'] as num,
      high24h: (json['high_24h'] as num).toDouble(),
      low24h: (json['low_24h'] as num).toDouble(),
      priceChange24h: (json['price_change_24h'] as num).toDouble(),
      priceChangePercentage24h:
          (json['price_change_percentage_24h'] as num).toDouble(),
      marketCapChange24h: json['market_cap_change_24h'] as num,
      marketCapChangePercentage24h:
          (json['market_cap_change_percentage_24h'] as num).toDouble(),
      circulatingSupply: json['circulating_supply'] as num,
      totalSupply: json['total_supply'] as num?,
      maxSupply: json['max_supply'] as num?,
      ath: (json['ath'] as num).toDouble(),
      athChangePercentage: (json['ath_change_percentage'] as num).toDouble(),
      athDate: json['ath_date'] as String,
      atl: (json['atl'] as num).toDouble(),
      atlChangePercentage: (json['atl_change_percentage'] as num).toDouble(),
      atlDate: json['atl_date'] as String,
      roi: json['roi'] == null
          ? null
          : Roi.fromJson(json['roi'] as Map<String, dynamic>),
      lastUpdated: json['last_updated'] as String,
    );

Map<String, dynamic> _$CoinToJson(Coin instance) => <String, dynamic>{
      'id': instance.id,
      'symbol': instance.symbol,
      'name': instance.name,
      'image': instance.image,
      'current_price': instance.currentPrice,
      'market_cap': instance.marketCap,
      'market_cap_rank': instance.marketCapRank,
      'fully_diluted_valuation': instance.fullyDilutedValuation,
      'total_volume': instance.totalVolume,
      'high_24h': instance.high24h,
      'low_24h': instance.low24h,
      'price_change_24h': instance.priceChange24h,
      'price_change_percentage_24h': instance.priceChangePercentage24h,
      'market_cap_change_24h': instance.marketCapChange24h,
      'market_cap_change_percentage_24h': instance.marketCapChangePercentage24h,
      'circulating_supply': instance.circulatingSupply,
      'total_supply': instance.totalSupply,
      'max_supply': instance.maxSupply,
      'ath': instance.ath,
      'ath_change_percentage': instance.athChangePercentage,
      'ath_date': instance.athDate,
      'atl': instance.atl,
      'atl_change_percentage': instance.atlChangePercentage,
      'atl_date': instance.atlDate,
      'roi': instance.roi,
      'last_updated': instance.lastUpdated,
    };

Roi _$RoiFromJson(Map<String, dynamic> json) => Roi(
      times: (json['times'] as num).toDouble(),
      currency: json['currency'] as String,
      percentage: (json['percentage'] as num).toDouble(),
    );

Map<String, dynamic> _$RoiToJson(Roi instance) => <String, dynamic>{
      'times': instance.times,
      'currency': instance.currency,
      'percentage': instance.percentage,
    };
