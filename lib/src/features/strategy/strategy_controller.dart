import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:market_research/src/data/local/database_helper.dart';

part 'strategy_controller.g.dart';

@riverpod
class StrategyController extends _$StrategyController {
  @override
  FutureOr<List<Map<String, dynamic>>> build() async {
    return _fetchStrategies();
  }

  Future<List<Map<String, dynamic>>> _fetchStrategies() async {
    final db = ref.read(databaseHelperProvider);
    return await db.getStrategies('default_user');
  }

  Future<void> addStrategy({
    required String name,
    required String type,
    required double stopLoss,
    required double target,
    required bool useRsi,
    required bool useVwap,
  }) async {
    state = const AsyncValue.loading();
    try {
      final db = ref.read(databaseHelperProvider);
      final conditions = [
        if (useRsi) 'RSI > 50',
        if (useVwap) 'Close > VWAP',
      ].join(',');

      await db.insertStrategy({
        'id': DateTime.now().millisecondsSinceEpoch.toString(),
        'user_id': 'default_user',
        'name': name,
        'type': type,
        'conditions': conditions,
        'stop_loss_percentage': stopLoss,
        'target_1_percentage': target,
        'created_at': DateTime.now().millisecondsSinceEpoch,
      });
      state = await AsyncValue.guard(() => _fetchStrategies());
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }
}
