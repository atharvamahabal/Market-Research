import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:market_research/src/features/portfolio/portfolio_controller.dart';

class PortfolioScreen extends ConsumerWidget {
  const PortfolioScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final holdingsState = ref.watch(portfolioControllerProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('My Portfolio')),
      body: Column(
        children: [
          _buildBalanceCard(ref),
          Expanded(
            child: holdingsState.when(
              data: (holdings) {
                if (holdings.isEmpty) {
                  return const Center(
                      child: Text('No holdings yet. Start trading!'));
                }
                return ListView.builder(
                  itemCount: holdings.length,
                  itemBuilder: (context, index) {
                    final holding = holdings[index];
                    return ListTile(
                      title: Text(holding['symbol']),
                      subtitle: Text(
                          '${holding['quantity']} shares @ ${holding['avg_buy_price']}'),
                      trailing: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text('Val: ${holding['current_value']}'),
                        ],
                      ),
                    );
                  },
                );
              },
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (e, st) => Center(child: Text('Error: $e')),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBalanceCard(WidgetRef ref) {
    return FutureBuilder(
      future: ref.read(portfolioControllerProvider.notifier).getUserStats(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) return const SizedBox.shrink();
        final user = snapshot.data as Map<String, dynamic>;
        return Card(
          margin: const EdgeInsets.all(16),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Available Balance',
                        style: Theme.of(context).textTheme.labelMedium),
                    Text('₹${user['available_balance']}',
                        style: Theme.of(context).textTheme.headlineSmall),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text('Invested',
                        style: Theme.of(context).textTheme.labelMedium),
                    const Text('₹0.00',
                        style: TextStyle(
                            fontWeight: FontWeight
                                .bold)), // TODO: Calculate total invested
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
