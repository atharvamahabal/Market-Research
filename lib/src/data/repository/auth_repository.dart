import 'dart:io';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_repository.g.dart';

@Riverpod(keepAlive: true)
AuthRepository authRepository(AuthRepositoryRef ref) {
  return AuthRepository();
}

class AuthRepository {
  // Use conditional initialization based on platform
  late final GoogleSignIn _googleSignIn;

  AuthRepository() {
    if (Platform.isAndroid || Platform.isIOS) {
      _googleSignIn = GoogleSignIn(
        serverClientId:
            '1082989712826-jjqgfusvgj66sh73t8f23d2h58rn05r1.apps.googleusercontent.com',
        scopes: [
          'email',
          'https://www.googleapis.com/auth/userinfo.profile',
        ],
      );
    } else {
      _googleSignIn = GoogleSignIn(
        clientId:
            '1082989712826-29qkuks0q3n7dhhec7dq1udl06h44pv5.apps.googleusercontent.com',
        scopes: [
          'email',
          'https://www.googleapis.com/auth/userinfo.profile',
        ],
      );
    }
  }

  Future<GoogleSignInAccount?> signInWithGoogle() async {
    try {
      print("Attempting Google Sign In...");
      final account = await _googleSignIn.signIn();
      final auth = await account?.authentication;
      print("ID Token: ${auth?.idToken}");
      print("Sign In Result: $account");
      return account;
    } catch (error) {
      print("Sign In Error: $error");
      rethrow;
    }
  }

  Future<void> signOut() async {
    await _googleSignIn.signOut();
  }

  Stream<GoogleSignInAccount?> get authStateChanges =>
      _googleSignIn.onCurrentUserChanged;

  GoogleSignInAccount? get currentUser => _googleSignIn.currentUser;
}
