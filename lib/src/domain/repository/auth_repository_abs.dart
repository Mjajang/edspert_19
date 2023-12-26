import 'package:edspert_19/src/data/model/model.dart';
import 'package:edspert_19/src/domain/entity/user_response_entity.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthRepositoryAbs {
  bool isSignedInWithGoogle();

  String? getCurrentSignedInEmail();

  Future<UserDataEntity?> getUserByEmail({required String email});

  Future<bool> registerUser({required RegisterUserRequestModel request});

  Future<bool> isUserRegistered();

  Future<bool> signOut();

  Future<User?> signInWithGoogle();
}
