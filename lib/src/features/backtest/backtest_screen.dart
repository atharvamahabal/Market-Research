import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:market_research/src/features/strategy/strategy_controller.dart';
import 'package:market_research/src/features/backtest/backtest_controller.dart';
import 'package:market_research/src/data/local/database_helper.dart';

class BacktestScreen extends ConsumerStatefulWidget {
  const BacktestScreen({super.key});

  @override
  ConsumerState<BacktestScreen> createState() => _BacktestScreenState();
}

class _BacktestScreenState extends ConsumerState<BacktestScreen> {
  String? _selectedStrategyId;
  final _symbolController = TextEditingController(text: '^NSEI');

  // Fetch results for the selected strategy
  List<Map<String, dynamic>> _results = [];

  @override
  Widget build(BuildContext context) {
    final strategiesState = ref.watch(strategyControllerProvider);
    final backtestState = ref.watch(backtestControllerProvider);

    ref.listen(backtestControllerProvider, (previous, next) {
      if (next.hasError) {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text('Error: ${next.error}')));
      } else if (!next.isLoading &&
          !next.hasError &&
          previous?.isLoading == true) {
        ScaffoldMessenger.of(context)
            .showSnackBar(const SnackBar(content: Text('Backtest Completed!')));
        _refreshResults();
      }
    });

    return Scaffold(
      appBar: AppBar(title: const Text('Backtesting Engine')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Configuration',
                style: Theme.of(context).textTheme.headlineSmall),
            const SizedBox(height: 16),
            strategiesState.when(
              data: (strategies) {
                if (strategies.isEmpty)
                  return const Text('Please create a strategy first.');
                return DropdownButtonFormField<String>(
                  value: _selectedStrategyId,
                  decoration: const InputDecoration(
                    labelText: 'Select Strategy',
                    border: OutlineInputBorder(),
                  ),
                  items: strategies.map((s) {
                    return DropdownMenuItem<String>(
                      value: s['id'] as String,
                      child: Text(s['name'] as String),
                    );
                  }).toList(),
                  onChanged: (val) {
                    setState(() => _selectedStrategyId = val);
                    _refreshResults();
                  },
                );
              },
              loading: () => const LinearProgressIndicator(),
              error: (e, st) => Text('Error loading strategies: $e'),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _symbolController,
              decoration: const InputDecoration(
                labelText: 'Symbol (e.g., ^NSEI, RELIANCE.NS)',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 24),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: FilledButton.icon(
                onPressed:
                    backtestState.isLoading || _selectedStrategyId == null
                        ? null
                        : _runBacktest,
                icon: backtestState.isLoading
                    ? const SizedBox(
                        width: 20,
                        height: 20,
                        child: CircularProgressIndicator(
                            color: Colors.white, strokeWidth: 2))
                    : const Icon(Icons.play_arrow),
                label: const Text('Run Backtest'),
              ),
            ),
            const Divider(height: 48),
            Text('Recent Results',
                style: Theme.of(context).textTheme.headlineSmall),
            const SizedBox(height: 16),
            if (_results.isEmpty)
              const Text('No backtests run for this strategy yet.')
            else
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: _results.length,
                itemBuilder: (context, index) {
                  final res = _results[index];
                  final winRatio = res['win_ratio'] as double;
                  final netPnl = res['net_pnl'] as double;

                  return Card(
                    child: ListTile(
                      title: Text('${res['symbol']}'),
                      subtitle: Text(
                          'Trades: ${res['total_trades']} | Win Rate: ${winRatio.toStringAsFixed(1)}%'),
                      trailing: Text(
                        'P&L: ${netPnl >= 0 ? "+" : ""}${netPnl.toStringAsFixed(2)}',
                        style: TextStyle(
                          color: netPnl >= 0 ? Colors.green : Colors.red,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  );
                },
              ),
          ],
        ),
      ),
    );
  }

  Future<void> _runBacktest() async {
    // In a real app, get SL/Target from the selected strategy details
    // Here we assume defaults or fetch them
    await ref.read(backtestControllerProvider.notifier).runBacktest(
          strategyId: _selectedStrategyId!,
          symbol: _symbolController.text,
          startDate: DateTime.now().subtract(const Duration(days: 30)),
          endDate: DateTime.now(),
          stopLoss: 1.0,
          target: 2.0,
        );
  }

  Future<void> _refreshResults() async {
    if (_selectedStrategyId == null) return;
    final db = ref.read(databaseHelperProvider);
    final results = await db.getBacktestResults(_selectedStrategyId!);
    setState(() {
      _results = results;
    });
  }
}
