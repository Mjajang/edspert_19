import 'package:edspert_19/src/data/datasource/remote/auth_remote_datasource.dart';
import 'package:edspert_19/src/data/model/model.dart';
import 'package:edspert_19/src/domain/entity/user_response_entity.dart';
import 'package:edspert_19/src/domain/repository/auth_repository_abs.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthRepositoryImpl implements AuthRepositoryAbs {
  final AuthRemoteDatasource remoteDatasource;

  AuthRepositoryImpl({required this.remoteDatasource});

  @override
  bool isSignedInWithGoogle() {
    return getCurrentSignedInEmail() != null;
  }

  @override
  String? getCurrentSignedInEmail() {
    return FirebaseAuth.instance.currentUser?.email;
  }

  @override
  Future<UserDataEntity?> getUserByEmail({required String email}) async {
    UserResponseModel? userResponseModel =
        await remoteDatasource.getUserByEmail(email: email);

    if (userResponseModel != null) {
      print('userModel: ${userResponseModel.toJson()}');

      final data = UserDataEntity(
        iduser: userResponseModel.data?.iduser ?? '',
        userName: userResponseModel.data?.userName ?? '',
        userEmail: userResponseModel.data?.userEmail ?? '',
        userFoto: userResponseModel.data?.userFoto ?? '',
        userAsalSekolah: userResponseModel.data?.userAsalSekolah ?? '',
        dateCreate: userResponseModel.data?.dateCreate ?? '',
        jenjang: userResponseModel.data?.jenjang ?? '',
        userGender: userResponseModel.data?.userGender ?? '',
        userStatus: userResponseModel.data?.userStatus ?? '',
        kelas: userResponseModel.data?.kelas ?? '',
      );

      return data;
    }

    return null;
  }

  @override
  Future<bool> registerUser({required RegisterUserRequestModel request}) async {
    final response = await remoteDatasource.registerUser(request: request);

    if (response.message == 'ok') {
      return true;
    }

    return false;
  }

  @override
  Future<bool> isUserRegistered() async {
    bool isRegistered =
        await getUserByEmail(email: getCurrentSignedInEmail() ?? '') != null;
    print('isRegistered: $isRegistered');
    return isRegistered;
  }

  @override
  Future<bool> signOut() async {
    try {
      await GoogleSignIn().signOut();
      await FirebaseAuth.instance.signOut();
      return true;
    } catch (e, stacktrace) {
      if (kDebugMode) {
        print('Error signInWithGoogle: $e, $stacktrace');
      }
      return false;
    }
  }

  @override
  Future<User?> signInWithGoogle() async {
    try {
      // Trigger the authentication flow
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      // Obtain the auth details from the request
      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;

      // Create a new credential
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

      // Once signed in, return the UserCredential
      UserCredential userCredentialResult =
          await FirebaseAuth.instance.signInWithCredential(credential);
      return userCredentialResult.user;
    } catch (e) {
      debugPrint('Err signInWithGoogle $e');
      return null;
    }
  }
}
