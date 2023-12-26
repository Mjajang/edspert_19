import 'package:edspert_19/src/data/model/model.dart';
import 'package:edspert_19/src/domain/repository/auth_repository_abs.dart';

class RegisterUserUsecase {
  final AuthRepositoryAbs authRepositoryAbs;

  RegisterUserUsecase({required this.authRepositoryAbs});

  Future<bool> call(RegisterUserRequestModel request) async =>
      await authRepositoryAbs.registerUser(request: request);
}
