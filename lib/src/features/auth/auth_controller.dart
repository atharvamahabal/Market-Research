import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:market_research/src/data/repository/auth_repository.dart';

part 'auth_controller.g.dart';

@riverpod
class AuthController extends _$AuthController {
  bool _isGuest = false;

  @override
  Stream<GoogleSignInAccount?> build() {
    // Merge the repository stream with our local guest state check
    // If guest is true, we emit a "dummy" account or handle it in the router
    // Ideally, we should wrap the state in a custom AuthState class
    return ref.watch(authRepositoryProvider).authStateChanges;
  }

  bool get isGuest => _isGuest;

  Future<void> signIn() async {
    final repository = ref.read(authRepositoryProvider);
    await repository.signInWithGoogle();
  }

  Future<void> signOut() async {
    _isGuest = false;
    final repository = ref.read(authRepositoryProvider);
    await repository.signOut();
    ref.invalidateSelf(); // Reset state
  }

  void setGuestLogin() {
    _isGuest = true;
    // We need to trigger a rebuild or notification for the router
    ref.notifyListeners();
  }
}
