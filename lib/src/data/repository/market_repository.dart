import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:market_research/src/data/models/chart_data.dart';
import 'package:market_research/src/data/remote/yahoo_api.dart';

part 'market_repository.g.dart';

@Riverpod(keepAlive: true)
MarketRepository marketRepository(MarketRepositoryRef ref) {
  final api = ref.watch(yahooApiProvider);
  return MarketRepository(api);
}

class MarketRepository {
  final YahooApi _api;

  MarketRepository(this._api);

  Future<YahooChartResponse> getStockData(String symbol) async {
    return _api.getChartData(symbol);
  }
}
