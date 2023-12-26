import 'package:edspert_19/src/domain/repository/auth_repository_abs.dart';

class IsSignedInWithGoogleUsecase {
  final AuthRepositoryAbs authRepositoryAbs;

  IsSignedInWithGoogleUsecase({required this.authRepositoryAbs});

  bool call() => authRepositoryAbs.isSignedInWithGoogle();
}
