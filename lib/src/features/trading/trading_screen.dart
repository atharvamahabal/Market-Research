import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:market_research/src/features/portfolio/portfolio_controller.dart';
import 'package:market_research/src/data/repository/market_repository.dart';

class TradingScreen extends ConsumerStatefulWidget {
  final String symbol;

  const TradingScreen({super.key, required this.symbol});

  @override
  ConsumerState<TradingScreen> createState() => _TradingScreenState();
}

class _TradingScreenState extends ConsumerState<TradingScreen> {
  final _quantityController = TextEditingController(text: '1');
  double? _currentPrice;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _fetchPrice();
  }

  Future<void> _fetchPrice() async {
    try {
      final repo = ref.read(marketRepositoryProvider);
      final data = await repo.getStockData(widget.symbol);
      setState(() {
        _currentPrice = data.chart.result?.first.meta.regularMarketPrice;
        _isLoading = false;
      });
    } catch (e) {
      setState(() => _isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Trade ${widget.symbol}')),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Current Price: ₹${_currentPrice?.toStringAsFixed(2) ?? "--"}',
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  const SizedBox(height: 24),
                  TextField(
                    controller: _quantityController,
                    decoration: const InputDecoration(
                      labelText: 'Quantity',
                      border: OutlineInputBorder(),
                    ),
                    keyboardType: TextInputType.number,
                  ),
                  const SizedBox(height: 24),
                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: FilledButton(
                      onPressed:
                          _currentPrice == null ? null : () => _executeBuy(),
                      style:
                          FilledButton.styleFrom(backgroundColor: Colors.green),
                      child: const Text('BUY'),
                    ),
                  ),
                ],
              ),
            ),
    );
  }

  Future<void> _executeBuy() async {
    final qty = int.tryParse(_quantityController.text);
    if (qty == null || qty <= 0) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Invalid quantity')),
      );
      return;
    }

    try {
      await ref.read(portfolioControllerProvider.notifier).buyStock(
            widget.symbol,
            qty,
            _currentPrice!,
          );
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Order executed successfully!')),
        );
        Navigator.pop(context);
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Failed: $e')),
        );
      }
    }
  }
}
