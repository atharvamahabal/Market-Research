import 'package:freezed_annotation/freezed_annotation.dart';

part 'chart_data.freezed.dart';
part 'chart_data.g.dart';

@freezed
class YahooChartResponse with _$YahooChartResponse {
  const factory YahooChartResponse({
    required ChartData chart,
  }) = _YahooChartResponse;

  factory YahooChartResponse.fromJson(Map<String, dynamic> json) =>
      _$YahooChartResponseFromJson(json);
}

@freezed
class ChartData with _$ChartData {
  const factory ChartData({
    List<ChartResult>? result,
    dynamic error,
  }) = _ChartData;

  factory ChartData.fromJson(Map<String, dynamic> json) =>
      _$ChartDataFromJson(json);
}

@freezed
class ChartResult with _$ChartResult {
  const factory ChartResult({
    required ChartMeta meta,
    List<int>? timestamp,
    required ChartIndicators indicators,
  }) = _ChartResult;

  factory ChartResult.fromJson(Map<String, dynamic> json) =>
      _$ChartResultFromJson(json);
}

@freezed
class ChartMeta with _$ChartMeta {
  const factory ChartMeta({
    required String currency,
    required String symbol,
    required double regularMarketPrice,
    required double previousClose,
    required double regularMarketDayHigh,
    required double regularMarketDayLow,
    required int regularMarketVolume,
  }) = _ChartMeta;

  factory ChartMeta.fromJson(Map<String, dynamic> json) =>
      _$ChartMetaFromJson(json);
}

@freezed
class ChartIndicators with _$ChartIndicators {
  const factory ChartIndicators({
    required List<ChartQuote> quote,
  }) = _ChartIndicators;

  factory ChartIndicators.fromJson(Map<String, dynamic> json) =>
      _$ChartIndicatorsFromJson(json);
}

@freezed
class ChartQuote with _$ChartQuote {
  const factory ChartQuote({
    List<double?>? open,
    List<double?>? high,
    List<double?>? low,
    List<double?>? close,
    List<int?>? volume,
  }) = _ChartQuote;

  factory ChartQuote.fromJson(Map<String, dynamic> json) =>
      _$ChartQuoteFromJson(json);
}
