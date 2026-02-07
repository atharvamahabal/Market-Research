import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:market_research/src/data/repository/market_repository.dart';
import 'package:market_research/src/data/models/chart_data.dart';

part 'dashboard_controller.g.dart';

@riverpod
class DashboardController extends _$DashboardController {
  @override
  FutureOr<Map<String, YahooChartResponse?>> build() async {
    return _fetchData();
  }

  Future<Map<String, YahooChartResponse?>> _fetchData() async {
    final repository = ref.read(marketRepositoryProvider);
    final watchlist = ['^NSEI', '^NSEBANK', 'RELIANCE.NS', 'TCS.NS', 'INFY.NS'];
    
    final Map<String, YahooChartResponse?> results = {};
    
    // Fetch concurrently
    await Future.wait(watchlist.map((symbol) async {
      try {
        final data = await repository.getStockData(symbol);
        results[symbol] = data;
      } catch (e) {
        // Handle individual failures gracefully, maybe log them
        results[symbol] = null; 
      }
    }));
    
    return results;
  }

  Future<void> refreshData() async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() => _fetchData());
  }
}
