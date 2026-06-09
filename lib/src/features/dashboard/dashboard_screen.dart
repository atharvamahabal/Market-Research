import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:market_research/src/features/dashboard/dashboard_controller.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:url_launcher/url_launcher.dart';

class DashboardScreen extends ConsumerWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(dashboardControllerProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Market Dashboard'),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              showSearch(
                context: context,
                delegate: StockSearchDelegate(ref),
              );
            },
            tooltip: 'Search Stocks',
          ),
          IconButton(
            icon: const Icon(Icons.table_chart),
            onPressed: () => context.push('/market-table'),
            tooltip: 'Tabular View',
          ),
          IconButton(
            icon: const Icon(Icons.history),
            onPressed: () => context.push('/backtest'),
            tooltip: 'Backtest Engine',
          ),
          IconButton(
            icon: const Icon(Icons.lightbulb_outline),
            onPressed: () => context.push('/strategies'),
            tooltip: 'Strategy Builder',
          ),
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () {
              ref.read(dashboardControllerProvider.notifier).refreshData();
            },
          ),
          IconButton(
            icon: const Icon(Icons.pie_chart),
            onPressed: () => context.push('/portfolio'),
          ),
        ],
      ),
      body: state.when(
        data: (data) {
          if (data.isEmpty) {
            return const Center(child: Text('No data available'));
          }
          return ListView.builder(
            itemCount: data.keys.length,
            padding: const EdgeInsets.all(16),
            itemBuilder: (context, index) {
              final symbol = data.keys.elementAt(index);
              final chartData = data[symbol];
              return GestureDetector(
                onTap: () => context.push('/trading/$symbol'),
                child: Card(
                  margin: const EdgeInsets.only(bottom: 16),
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(symbol,
                                style: Theme.of(context).textTheme.titleLarge),
                            _buildPrice(context, chartData),
                          ],
                        ),
                        const SizedBox(height: 16),
                        SizedBox(
                          height: 150,
                          child: _buildMiniChart(chartData),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, st) => Center(child: Text('Error: $e')),
      ),
    );
  }

  Widget _buildPrice(BuildContext context, dynamic chartData) {
    final meta = chartData?.chart.result?.first.meta;
    if (meta == null) return const Text('--');

    final price = meta.regularMarketPrice;
    final prevClose = meta.previousClose;
    final change = price - prevClose;
    final changePercent = (change / prevClose) * 100;
    final isPositive = change >= 0;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(
          price.toStringAsFixed(2),
          style: Theme.of(context).textTheme.titleMedium,
        ),
        Text(
          '${isPositive ? '+' : ''}${change.toStringAsFixed(2)} (${changePercent.toStringAsFixed(2)}%)',
          style: TextStyle(
            color: isPositive ? Colors.green : Colors.red,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

  Widget _buildMiniChart(dynamic chartData) {
    final result = chartData?.chart.result?.first;
    if (result == null) return const Center(child: Text('No chart data'));

    final quotes = result.indicators.quote.first.close;
    if (quotes == null || quotes.isEmpty)
      return const Center(child: Text('No quotes'));

    final spots = <FlSpot>[];
    for (int i = 0; i < quotes.length; i++) {
      if (quotes[i] != null) {
        spots.add(FlSpot(i.toDouble(), quotes[i]!));
      }
    }

    if (spots.isEmpty) return const Center(child: Text('Empty data'));

    // Determine color based on performance
    final startPrice = spots.first.y;
    final endPrice = spots.last.y;
    final color = endPrice >= startPrice ? Colors.green : Colors.red;

    return LineChart(
      LineChartData(
        gridData: const FlGridData(show: false),
        titlesData: const FlTitlesData(show: false),
        borderData: FlBorderData(show: false),
        lineBarsData: [
          LineChartBarData(
            spots: spots,
            isCurved: true,
            color: color,
            barWidth: 2,
            isStrokeCapRound: true,
            dotData: const FlDotData(show: false),
            belowBarData: BarAreaData(
              show: true,
              color: color.withOpacity(0.1),
            ),
          ),
        ],
      ),
    );
  }
}

class StockSearchDelegate extends SearchDelegate {
  final WidgetRef ref;
  StockSearchDelegate(this.ref);

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () => query = '',
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () => close(context, null),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    if (query.trim().isEmpty) return const SizedBox();
    
    // For NSE stocks, common practice is to append .NS
    final nseSymbol = query.toUpperCase().contains('.') ? query.toUpperCase() : '${query.toUpperCase()}.NS';

    return ListTile(
      title: Text('Add "$nseSymbol" to Watchlist?'),
      subtitle: const Text('Searching on Yahoo Finance...'),
      leading: const Icon(Icons.add_chart),
      onTap: () async {
        await ref.read(dashboardControllerProvider.notifier).addToWatchlist(nseSymbol);
        if (context.mounted) {
          close(context, null);
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Added $nseSymbol to watchlist')),
          );
        }
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    if (query.isEmpty) {
      return const Center(child: Text('Enter symbol (e.g. RELIANCE, TCS, ^NSEI)'));
    }
    return buildResults(context);
  }
}
