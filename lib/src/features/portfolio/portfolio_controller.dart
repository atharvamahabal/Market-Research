import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:market_research/src/data/local/database_helper.dart';

part 'portfolio_controller.g.dart';

@riverpod
class PortfolioController extends _$PortfolioController {
  @override
  FutureOr<List<Map<String, dynamic>>> build() async {
    return _fetchHoldings();
  }

  Future<List<Map<String, dynamic>>> _fetchHoldings() async {
    final db = ref.read(databaseHelperProvider);
    // Assuming default portfolio for now
    return await db.getHoldings('default_portfolio');
  }
  
  Future<Map<String, dynamic>?> getUserStats() async {
    final db = ref.read(databaseHelperProvider);
    return await db.getUser('default_user');
  }

  Future<void> buyStock(String symbol, int quantity, double price) async {
    state = const AsyncValue.loading();
    try {
      final db = ref.read(databaseHelperProvider);
      await db.buyStock('default_user', 'default_portfolio', symbol, quantity, price);
      // Refresh holdings
      state = await AsyncValue.guard(() => _fetchHoldings());
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }
}
