import 'package:edspert_19/src/domain/entity/user_response_entity.dart';
import 'package:edspert_19/src/domain/repository/auth_repository_abs.dart';

class GetUserUsecase {
  final AuthRepositoryAbs authRepositoryAbs;

  GetUserUsecase({required this.authRepositoryAbs});

  Future<UserDataEntity?> call(String email) async =>
      await authRepositoryAbs.getUserByEmail(email: email);
}
