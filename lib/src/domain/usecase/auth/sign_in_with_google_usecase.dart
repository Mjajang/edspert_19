import 'package:edspert_19/src/domain/repository/auth_repository_abs.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignInWithGoogleUsecase {
  final AuthRepositoryAbs authRepositoryAbs;

  SignInWithGoogleUsecase({required this.authRepositoryAbs});

  Future<User?> call() async => await authRepositoryAbs.signInWithGoogle();
}
