import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../models/user_model.dart';
import '../repository/auth_repository.dart';

final authController = Provider(
  (ref) => AuthController(
    authRepository: ref.watch(authRepositoryProvider),
  ),
);

class AuthController {
  final AuthRepository authRepository;

  AuthController({required this.authRepository});

  Future<void> signInEmailAndPassword(
      {required String email, required String password}) async {
    return authRepository.signInWithEmailAndPassword(
        email: email, password: password);
  }

  Future<void> signUpEmailAndPassword({
    required String email,
    required String password,
  }) async {
    return authRepository.signUpEmailAndPassword(
        email: email, password: password);
  }

  Future<void> signOut() async {
    await authRepository.signOut();
  }

  Future<void> storeUserInfoToFirebase(UserModel userModel) async {
    return authRepository.storeUserInfoToFirebase(userModel);
  }
}
