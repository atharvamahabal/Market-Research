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
            icon: const Icon(Icons.system_update),
            onPressed: () {
              final uri = Uri.parse(
                  'https://drive.google.com/drive/u/0/folders/1D73wSqObmfyd71zSRgf53_B_GyCuTHzY');
              launchUrl(uri, mode: LaunchMode.externalApplication);
            },
            tooltip: 'Update',
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
    if (chartData == null) return const SizedBox.shrink();

    final quotes = chartData.chart.result?.first.indicators.quote.first;
    final timestamps = chartData.chart.result?.first.timestamp;

    if (quotes == null ||
        timestamps == null ||
        quotes.close == null ||
        quotes.close!.isEmpty) {
      return const Center(child: Text('No chart data'));
    }

    // Filter out null values and create spots
    final spots = <FlSpot>[];
    for (int i = 0; i < quotes.close!.length; i++) {
      if (quotes.close![i] != null) {
        // Use index as X for simplicity in mini chart, or timestamp if needed
        spots.add(FlSpot(i.toDouble(), quotes.close![i]!));
      }
    }

    if (spots.isEmpty) return const Center(child: Text('No chart data'));

    final isPositive = (spots.last.y - spots.first.y) >= 0;
    final lineColor = isPositive ? Colors.green : Colors.red;

    return LineChart(
      LineChartData(
        gridData: const FlGridData(show: false),
        titlesData: const FlTitlesData(show: false),
        borderData: FlBorderData(show: false),
        lineBarsData: [
          LineChartBarData(
            spots: spots,
            isCurved: true,
            color: lineColor,
            barWidth: 2,
            isStrokeCapRound: true,
            dotData: const FlDotData(show: false),
            belowBarData: BarAreaData(
              show: true,
              color: lineColor.withOpacity(0.1),
            ),
          ),
        ],
        lineTouchData: const LineTouchData(enabled: false),
      ),
    );
  }
}
