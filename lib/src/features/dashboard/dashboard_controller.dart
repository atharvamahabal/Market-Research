import 'dart:async';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:market_research/src/data/repository/market_repository.dart';
import 'package:market_research/src/data/models/chart_data.dart';
import 'package:market_research/src/data/local/database_helper.dart';

part 'dashboard_controller.g.dart';

@riverpod
class DashboardController extends _$DashboardController {
  Timer? _refreshTimer;

  @override
  FutureOr<Map<String, YahooChartResponse?>> build() async {
    // Setup 1-minute auto-refresh
    _refreshTimer?.cancel();
    _refreshTimer = Timer.periodic(const Duration(minutes: 1), (timer) {
      refreshData();
    });

    ref.onDispose(() {
      _refreshTimer?.cancel();
    });

    return _fetchData();
  }

  Future<Map<String, YahooChartResponse?>> _fetchData() async {
    final repository = ref.read(marketRepositoryProvider);
    final db = ref.read(databaseHelperProvider);
    
    // Fetch watchlist from DB
    final watchlist = await db.getWatchlist();
    
    final Map<String, YahooChartResponse?> results = {};
    
    // Fetch concurrently
    await Future.wait(watchlist.map((symbol) async {
      try {
        final data = await repository.getStockData(symbol);
        results[symbol] = data;
      } catch (e) {
        results[symbol] = null; 
      }
    }));
    
    return results;
  }

  Future<void> refreshData() async {
    // Don't show loading for background refresh to avoid flickering
    final newData = await _fetchData();
    state = AsyncValue.data(newData);
  }

  Future<void> addToWatchlist(String symbol) async {
    final db = ref.read(databaseHelperProvider);
    await db.addToWatchlist(symbol);
    await refreshData();
  }

  Future<void> removeFromWatchlist(String symbol) async {
    final db = ref.read(databaseHelperProvider);
    await db.removeFromWatchlist(symbol);
    await refreshData();
  }
}
