import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:market_research/src/data/models/chart_data.dart';

part 'yahoo_api.g.dart';

@Riverpod(keepAlive: true)
YahooApi yahooApi(YahooApiRef ref) {
  return YahooApi();
}

class YahooApi {
  final Dio _dio = Dio(BaseOptions(
    baseUrl: 'https://query1.finance.yahoo.com',
    connectTimeout: const Duration(seconds: 10),
    receiveTimeout: const Duration(seconds: 10),
  ));

  Future<YahooChartResponse> getChartData(String symbol, {String interval = '5m', String range = '1d'}) async {
    try {
      final response = await _dio.get(
        '/v8/finance/chart/$symbol',
        queryParameters: {
          'interval': interval,
          'range': range,
        },
      );
      return YahooChartResponse.fromJson(response.data);
    } catch (e) {
      // In a real app, handle different DioExceptions
      throw Exception('Failed to load chart data for $symbol: $e');
    }
  }
}
