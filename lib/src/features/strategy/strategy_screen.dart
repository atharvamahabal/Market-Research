import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:market_research/src/features/strategy/strategy_controller.dart';

class StrategyScreen extends ConsumerStatefulWidget {
  const StrategyScreen({super.key});

  @override
  ConsumerState<StrategyScreen> createState() => _StrategyScreenState();
}

class _StrategyScreenState extends ConsumerState<StrategyScreen> {
  final _nameController = TextEditingController();
  final _stopLossController = TextEditingController(text: '1.0');
  final _targetController = TextEditingController(text: '2.0');
  String _type = 'BUY';
  bool _useRsi = true;
  bool _useVwap = true;

  @override
  Widget build(BuildContext context) {
    final strategiesState = ref.watch(strategyControllerProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Strategy Builder')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Create New Strategy', style: Theme.of(context).textTheme.headlineSmall),
            const SizedBox(height: 16),
            TextField(
              controller: _nameController,
              decoration: const InputDecoration(
                labelText: 'Strategy Name',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                const Text('Type: '),
                const SizedBox(width: 16),
                ChoiceChip(
                  label: const Text('BUY (Bullish)'),
                  selected: _type == 'BUY',
                  onSelected: (selected) => setState(() => _type = 'BUY'),
                ),
                const SizedBox(width: 8),
                ChoiceChip(
                  label: const Text('SELL (Bearish)'),
                  selected: _type == 'SELL',
                  onSelected: (selected) => setState(() => _type = 'SELL'),
                ),
              ],
            ),
            const SizedBox(height: 16),
            const Text('Conditions (Entry Rules)', style: TextStyle(fontWeight: FontWeight.bold)),
            SwitchListTile(
              title: const Text('RSI(14) > 50'),
              value: _useRsi,
              onChanged: (val) => setState(() => _useRsi = val),
            ),
            SwitchListTile(
              title: const Text('Close > VWAP'),
              value: _useVwap,
              onChanged: (val) => setState(() => _useVwap = val),
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _stopLossController,
                    decoration: const InputDecoration(
                      labelText: 'Stop Loss (%)',
                      border: OutlineInputBorder(),
                    ),
                    keyboardType: TextInputType.number,
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: TextField(
                    controller: _targetController,
                    decoration: const InputDecoration(
                      labelText: 'Target (%)',
                      border: OutlineInputBorder(),
                    ),
                    keyboardType: TextInputType.number,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: FilledButton.icon(
                onPressed: _saveStrategy,
                icon: const Icon(Icons.save),
                label: const Text('Save Strategy'),
              ),
            ),
            const Divider(height: 48),
            Text('My Strategies', style: Theme.of(context).textTheme.headlineSmall),
            const SizedBox(height: 16),
            strategiesState.when(
              data: (strategies) {
                if (strategies.isEmpty) return const Text('No strategies created yet.');
                return Column(
                  children: strategies.map((s) => Card(
                    child: ListTile(
                      title: Text(s['name']),
                      subtitle: Text('${s['type']} | SL: ${s['stop_loss_percentage']}% | Tgt: ${s['target_1_percentage']}%'),
                      trailing: const Icon(Icons.chevron_right),
                    ),
                  )).toList(),
                );
              },
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (e, st) => Text('Error: $e'),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _saveStrategy() async {
    if (_nameController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Please enter a name')));
      return;
    }
    
    await ref.read(strategyControllerProvider.notifier).addStrategy(
      name: _nameController.text,
      type: _type,
      stopLoss: double.tryParse(_stopLossController.text) ?? 1.0,
      target: double.tryParse(_targetController.text) ?? 2.0,
      useRsi: _useRsi,
      useVwap: _useVwap,
    );
    
    if (mounted) {
      _nameController.clear();
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Strategy saved!')));
    }
  }
}
