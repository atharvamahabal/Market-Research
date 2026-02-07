import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:market_research/src/features/auth/auth_controller.dart';

class LoginScreen extends ConsumerWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Listen to auth state changes to navigate
    ref.listen(authControllerProvider, (previous, next) {
      next.whenData((user) {
        if (user != null) {
          context.go('/dashboard');
        }
      });
    });

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.candlestick_chart,
                size: 100, color: Colors.deepPurple),
            const SizedBox(height: 24),
            Text(
              'Market Research',
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
            const SizedBox(height: 8),
            Text(
              'Paper Trading & Analysis',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            const SizedBox(height: 48),
            ElevatedButton.icon(
              onPressed: () async {
                try {
                  await ref.read(authControllerProvider.notifier).signIn();
                } catch (e) {
                  if (context.mounted) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Login Failed: $e')),
                    );
                  }
                }
              },
              icon: const Icon(Icons.login),
              label: const Text('Sign in with Google'),
              style: ElevatedButton.styleFrom(
                padding:
                    const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
              ),
            ),
            const SizedBox(height: 16),
            // Updated Skip Login Logic
            TextButton(
              onPressed: () {
                // Explicitly set a "guest" state or just navigate
                // For now, we will bypass the router guard by updating the route
                ref.read(authControllerProvider.notifier).setGuestLogin();
              },
              child: const Text('Skip Login (Dev Only)'),
            ),
          ],
        ),
      ),
    );
  }
}
