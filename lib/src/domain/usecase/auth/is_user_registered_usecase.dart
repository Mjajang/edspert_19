import 'package:edspert_19/src/domain/repository/auth_repository_abs.dart';

class IsUserRegisteredUsecase {
  final AuthRepositoryAbs authRepositoryAbs;

  IsUserRegisteredUsecase({required this.authRepositoryAbs});

  Future<bool> call() async => await authRepositoryAbs.isUserRegistered();
}
