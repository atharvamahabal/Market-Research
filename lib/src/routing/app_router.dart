import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:market_research/src/features/auth/login_screen.dart';
import 'package:market_research/src/features/dashboard/dashboard_screen.dart';
import 'package:market_research/src/features/portfolio/portfolio_screen.dart';
import 'package:market_research/src/features/trading/trading_screen.dart';
import 'package:market_research/src/features/strategy/strategy_screen.dart';
import 'package:market_research/src/features/backtest/backtest_screen.dart';
import 'package:market_research/src/data/repository/auth_repository.dart';
import 'package:market_research/src/features/auth/auth_controller.dart';

final routerProvider = Provider<GoRouter>((ref) {
  final authRepo = ref.watch(authRepositoryProvider);
  // Watch the controller to detect Guest mode changes
  // We use ref.watch(authControllerProvider) to rebuild when stream changes,
  // but for the guest flag, we access the notifier directly in the redirect logic
  // or better, we listen to it.

  // Trick: To listen to both stream and local state, we can depend on the controller.
  final authState = ref.watch(authControllerProvider);

  return GoRouter(
    initialLocation: '/login',
    // We refresh when the stream emits a new value OR when the provider rebuilds
    refreshListenable: GoRouterRefreshStream(authRepo.authStateChanges),
    redirect: (context, state) {
      final isLoggedIn = authRepo.currentUser != null;
      final isGuest = ref.read(authControllerProvider.notifier).isGuest;

      final isLoggingIn = state.uri.toString() == '/login';

      if (!isLoggedIn && !isGuest && !isLoggingIn) return '/login';
      if ((isLoggedIn || isGuest) && isLoggingIn) return '/dashboard';

      return null;
    },
    routes: [
      GoRoute(
        path: '/login',
        builder: (context, state) => const LoginScreen(),
      ),
      GoRoute(
        path: '/dashboard',
        builder: (context, state) => const DashboardScreen(),
      ),
      GoRoute(
        path: '/portfolio',
        builder: (context, state) => const PortfolioScreen(),
      ),
      GoRoute(
        path: '/trading/:symbol',
        builder: (context, state) {
          final symbol = state.pathParameters['symbol']!;
          return TradingScreen(symbol: symbol);
        },
      ),
      GoRoute(
        path: '/strategies',
        builder: (context, state) => const StrategyScreen(),
      ),
      GoRoute(
        path: '/backtest',
        builder: (context, state) => const BacktestScreen(),
      ),
    ],
  );
});

class GoRouterRefreshStream extends ChangeNotifier {
  GoRouterRefreshStream(Stream<dynamic> stream) {
    notifyListeners();
    _subscription = stream.listen(
      (dynamic _) => notifyListeners(),
    );
  }

  late final dynamic _subscription;

  @override
  void dispose() {
    _subscription.cancel();
    super.dispose();
  }
}
