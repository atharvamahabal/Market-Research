// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chart_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$YahooChartResponseImpl _$$YahooChartResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$YahooChartResponseImpl(
      chart: ChartData.fromJson(json['chart'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$YahooChartResponseImplToJson(
        _$YahooChartResponseImpl instance) =>
    <String, dynamic>{
      'chart': instance.chart,
    };

_$ChartDataImpl _$$ChartDataImplFromJson(Map<String, dynamic> json) =>
    _$ChartDataImpl(
      result: (json['result'] as List<dynamic>?)
          ?.map((e) => ChartResult.fromJson(e as Map<String, dynamic>))
          .toList(),
      error: json['error'],
    );

Map<String, dynamic> _$$ChartDataImplToJson(_$ChartDataImpl instance) =>
    <String, dynamic>{
      'result': instance.result,
      'error': instance.error,
    };

_$ChartResultImpl _$$ChartResultImplFromJson(Map<String, dynamic> json) =>
    _$ChartResultImpl(
      meta: ChartMeta.fromJson(json['meta'] as Map<String, dynamic>),
      timestamp: (json['timestamp'] as List<dynamic>?)
          ?.map((e) => (e as num).toInt())
          .toList(),
      indicators:
          ChartIndicators.fromJson(json['indicators'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$ChartResultImplToJson(_$ChartResultImpl instance) =>
    <String, dynamic>{
      'meta': instance.meta,
      'timestamp': instance.timestamp,
      'indicators': instance.indicators,
    };

_$ChartMetaImpl _$$ChartMetaImplFromJson(Map<String, dynamic> json) =>
    _$ChartMetaImpl(
      currency: json['currency'] as String,
      symbol: json['symbol'] as String,
      regularMarketPrice: (json['regularMarketPrice'] as num).toDouble(),
      previousClose: (json['previousClose'] as num).toDouble(),
      regularMarketDayHigh: (json['regularMarketDayHigh'] as num).toDouble(),
      regularMarketDayLow: (json['regularMarketDayLow'] as num).toDouble(),
      regularMarketVolume: (json['regularMarketVolume'] as num).toInt(),
    );

Map<String, dynamic> _$$ChartMetaImplToJson(_$ChartMetaImpl instance) =>
    <String, dynamic>{
      'currency': instance.currency,
      'symbol': instance.symbol,
      'regularMarketPrice': instance.regularMarketPrice,
      'previousClose': instance.previousClose,
      'regularMarketDayHigh': instance.regularMarketDayHigh,
      'regularMarketDayLow': instance.regularMarketDayLow,
      'regularMarketVolume': instance.regularMarketVolume,
    };

_$ChartIndicatorsImpl _$$ChartIndicatorsImplFromJson(
        Map<String, dynamic> json) =>
    _$ChartIndicatorsImpl(
      quote: (json['quote'] as List<dynamic>)
          .map((e) => ChartQuote.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$ChartIndicatorsImplToJson(
        _$ChartIndicatorsImpl instance) =>
    <String, dynamic>{
      'quote': instance.quote,
    };

_$ChartQuoteImpl _$$ChartQuoteImplFromJson(Map<String, dynamic> json) =>
    _$ChartQuoteImpl(
      open: (json['open'] as List<dynamic>?)
          ?.map((e) => (e as num?)?.toDouble())
          .toList(),
      high: (json['high'] as List<dynamic>?)
          ?.map((e) => (e as num?)?.toDouble())
          .toList(),
      low: (json['low'] as List<dynamic>?)
          ?.map((e) => (e as num?)?.toDouble())
          .toList(),
      close: (json['close'] as List<dynamic>?)
          ?.map((e) => (e as num?)?.toDouble())
          .toList(),
      volume: (json['volume'] as List<dynamic>?)
          ?.map((e) => (e as num?)?.toInt())
          .toList(),
    );

Map<String, dynamic> _$$ChartQuoteImplToJson(_$ChartQuoteImpl instance) =>
    <String, dynamic>{
      'open': instance.open,
      'high': instance.high,
      'low': instance.low,
      'close': instance.close,
      'volume': instance.volume,
    };
