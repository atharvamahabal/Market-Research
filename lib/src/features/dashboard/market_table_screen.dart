import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:market_research/src/features/dashboard/dashboard_controller.dart';
import 'package:market_research/src/data/models/chart_data.dart';

class MarketTableScreen extends ConsumerWidget {
  const MarketTableScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(dashboardControllerProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Market Watch (Table)'),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () {
              ref.read(dashboardControllerProvider.notifier).refreshData();
            },
          ),
        ],
      ),
      body: state.when(
        data: (data) {
          if (data.isEmpty) {
            return const Center(child: Text('No data in watchlist'));
          }

          final rows = data.entries.map((entry) {
            final symbol = entry.key;
            final response = entry.value;
            final meta = response?.chart.result?.first.meta;
            final price = meta?.regularMarketPrice ?? 0.0;
            final prevClose = meta?.chartPreviousClose ?? price;
            final change = price - prevClose;
            final changePercent = prevClose != 0 ? (change / prevClose) * 100 : 0.0;
            final color = change >= 0 ? Colors.green : Colors.red;

            return DataRow(cells: [
              DataCell(Text(symbol, style: const TextStyle(fontWeight: FontWeight.bold))),
              DataCell(Text(price.toStringAsFixed(2))),
              DataCell(
                Text(
                  '${change >= 0 ? "+" : ""}${change.toStringAsFixed(2)} (${changePercent.toStringAsFixed(2)}%)',
                  style: TextStyle(color: color, fontWeight: FontWeight.bold),
                ),
              ),
              DataCell(
                IconButton(
                  icon: const Icon(Icons.delete_outline, color: Colors.grey),
                  onPressed: () {
                    ref.read(dashboardControllerProvider.notifier).removeFromWatchlist(symbol);
                  },
                ),
              ),
            ]);
          }).toList();

          return SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: DataTable(
                columns: const [
                  DataColumn(label: Text('Symbol')),
                  DataColumn(label: Text('Price')),
                  DataColumn(label: Text('Change')),
                  DataColumn(label: Text('Action')),
                ],
                rows: rows,
              ),
            ),
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, st) => Center(child: Text('Error: $e')),
      ),
    );
  }
}
