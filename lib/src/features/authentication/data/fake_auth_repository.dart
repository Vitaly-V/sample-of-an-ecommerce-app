import 'package:ecommerce_app/src/features/authentication/domain/app_user.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FakeAuthRepository {
  Stream<AppUser?> authStateChanges() => Stream.value(null);

  AppUser? get currentUser => null;

  Future<void> signInWithEmailAndPassword() async {
    await Future.delayed(Duration(seconds: 1));
  }

  Future<void> createUserWithEmailAndPassword() async {
    await Future.delayed(Duration(seconds: 1));
  }

  Future<void> signOut() async {
    await Future.delayed(Duration(seconds: 1));
  }
}

final authRepositoryProvider = Provider<FakeAuthRepository>((ref) {
  return FakeAuthRepository();
});

final authStateChangesProvider = StreamProvider.autoDispose<AppUser?>((ref) {
  final authRepository = ref.watch(authRepositoryProvider);
  return authRepository.authStateChanges();
});
