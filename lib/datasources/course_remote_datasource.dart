import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:edspert_19/constants/constants.dart';
import 'package:edspert_19/src/data/model/model.dart';

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

  Future<ExerciseResponse> getExercise(String courseId) async {
    try {
      final url =
          '${LearningConstants.baseUrl}${LearningConstants.exercisePath}';

      final result = await Dio().get(
        url,
        options: Options(
          headers: {
            'x-api-key': '18be70c0-4e4d-44ff-a475-50c51ece99a0',
          },
        ),
        queryParameters: {
          'course_id': courseId,
          'user_email': 'testerngbayu@gmail.com',
        },
      );

      final exerciseResponse = ExerciseResponse.fromJson(result.data);

      return exerciseResponse;
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
