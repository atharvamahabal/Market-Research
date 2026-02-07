import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:market_research/src/data/local/database_helper.dart';
import 'package:market_research/src/data/repository/market_repository.dart';

part 'backtest_controller.g.dart';

@riverpod
class BacktestController extends _$BacktestController {
  @override
  FutureOr<void> build() {}

  Future<void> runBacktest({
    required String strategyId,
    required String symbol,
    required DateTime startDate,
    required DateTime endDate,
    required double stopLoss,
    required double target,
  }) async {
    state = const AsyncValue.loading();
    try {
      final repository = ref.read(marketRepositoryProvider);

      // 1. Fetch Historical Data (Mocking fetching more data by using '1mo' or longer range)
      // In a real app, you'd need a way to fetch specific date ranges from Yahoo Finance
      // Yahoo Finance API range options: 1d, 5d, 1mo, 3mo, 6mo, 1y, 2y, 5y, 10y, ytd, max
      final data = await repository
          .getStockData(symbol); // Defaulting to recent data for MVP

      final chartResult = data.chart.result?.first;
      if (chartResult == null) throw Exception('No data available for $symbol');

      final quotes = chartResult.indicators.quote.first;
      final timestamps = chartResult.timestamp;

      if (quotes.close == null || timestamps == null)
        throw Exception('Incomplete data');

      // 2. Simulate Strategy Execution
      int totalTrades = 0;
      int wins = 0;
      double netPnl = 0.0;
      double maxDrawdown = 0.0;
      double peakEquity = 0.0;
      double currentEquity = 0.0;

      // Simple Simulation Logic (Random for demonstration of flow, as real logic requires complex indicators)
      // Real logic would calculate RSI/VWAP here for each candle and trigger Buy/Sell
      for (int i = 1; i < quotes.close!.length; i++) {
        final price = quotes.close![i];
        if (price == null) continue;

        // Mock Strategy: If price goes up 1%, BUY. If hits target, Win. If hits SL, Loss.
        // This is a placeholder for the "Strategy Builder" condition evaluation
        if (i % 10 == 0) {
          // Simulate a trade every 10 candles
          totalTrades++;
          final isWin = (i % 2 == 0); // 50% mock win rate
          if (isWin) {
            wins++;
            final profit = price * (target / 100);
            netPnl += profit;
            currentEquity += profit;
          } else {
            final loss = price * (stopLoss / 100);
            netPnl -= loss;
            currentEquity -= loss;
          }

          if (currentEquity > peakEquity) peakEquity = currentEquity;
          final drawdown = peakEquity - currentEquity;
          if (drawdown > maxDrawdown) maxDrawdown = drawdown;
        }
      }

      final winRatio = totalTrades > 0 ? (wins / totalTrades) * 100 : 0.0;

      // 3. Save Results
      final db = ref.read(databaseHelperProvider);
      await db.saveBacktestResult({
        'id': DateTime.now().millisecondsSinceEpoch.toString(),
        'strategy_id': strategyId,
        'symbol': symbol,
        'start_date': startDate.millisecondsSinceEpoch,
        'end_date': endDate.millisecondsSinceEpoch,
        'total_trades': totalTrades,
        'winning_trades': wins,
        'win_ratio': winRatio,
        'max_drawdown': maxDrawdown,
        'net_pnl': netPnl,
        'tested_at': DateTime.now().millisecondsSinceEpoch,
      });

      state = const AsyncValue.data(null);
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }
}
