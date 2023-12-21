import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:edspert_19/constants/constants.dart';
import 'package:edspert_19/models/course_response_model.dart';

class CourseRemoteDatasource {
  Future<CourseResponse> getCourse() async {
    try {
      final url = '${LearningConstants.baseUrl}${LearningConstants.coursePath}';

      final result = await Dio().get(
        url,
        options: Options(
          headers: {
            'x-api-key': '18be70c0-4e4d-44ff-a475-50c51ece99a0',
          },
        ),
      );

      final bannerResponse = CourseResponse.fromJson(result.data);

      return bannerResponse;
    } catch (e, stacktrace) {
      log(
        e.toString(),
        stackTrace: stacktrace,
        error: e,
      );
      rethrow;
    }
  }
}
