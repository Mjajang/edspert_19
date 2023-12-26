import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:edspert_19/src/data/model/model.dart';
import 'package:edspert_19/src/values/uri_paths.dart';

class AuthRemoteDatasource {
  final Dio client;

  AuthRemoteDatasource({required this.client});

  Future<UserResponseModel?> getUserByEmail({required String email}) async {
    try {
      final url = '${UriPath.baseUrl}${UriPath.getUserByEmailPath}';

      final result = await client.get(
        url,
        queryParameters: {
          'email': email,
        },
        options: Options(
          headers: {'x-api-key': '18be70c0-4e4d-44ff-a475-50c51ece99a0'},
        ),
      );

      final userData = UserResponseModel.fromJson(result.data);

      return userData;
    } catch (e, stacktrace) {
      log(e.toString(), stackTrace: stacktrace);
      return null;
    }
  }
}
