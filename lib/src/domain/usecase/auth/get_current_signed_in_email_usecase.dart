import 'package:edspert_19/src/domain/repository/auth_repository_abs.dart';

class GetCurrentSignedInEmailUsecase {
  final AuthRepositoryAbs authRepositoryAbs;

  GetCurrentSignedInEmailUsecase({required this.authRepositoryAbs});

  String? call() => authRepositoryAbs.getCurrentSignedInEmail();
}
