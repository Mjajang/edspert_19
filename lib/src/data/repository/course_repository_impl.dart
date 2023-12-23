import 'package:edspert_19/src/data/datasource/remote/course_remote_datasource.dart';
import 'package:edspert_19/src/data/model/model.dart';
import 'package:edspert_19/src/domain/entity/course_list_response_entity.dart';
import 'package:edspert_19/src/domain/entity/exercise_list_response_entity.dart';
import 'package:edspert_19/src/domain/repository/course_repository_abs.dart';

class CourseRepositoryImpl implements CourseRepositoryAbs {
  final CourseRemoteDatasource courseRemoteDatasource;

  CourseRepositoryImpl({required this.courseRemoteDatasource});

  @override
  Future<List<CourseDataEntity>?> getCourses(String majorName) async {
    final response = await courseRemoteDatasource.getCourses(majorName);

    if (response.data == null) {
      return null;
    }

    final data = CourseListResponseEntity(
      status: response.status ?? -1,
      message: response.message ?? '',
      data: List<CourseDataModel>.from(response.data ?? [])
          .map(
            (e) => CourseDataEntity(
              courseId: e.courseId ?? '',
              majorName: e.majorName ?? '',
              courseCategory: e.courseCategory ?? '',
              courseName: e.courseName ?? '',
              urlCover: e.urlCover ?? '',
              jumlahMateri: e.jumlahMateri ?? 0,
              jumlahDone: e.jumlahDone ?? 0,
              progress: e.progress ?? 0,
            ),
          )
          .toList(),
    );

    return data.data;
  }

  @override
  Future<List<ExerciseDataEntity>?> getExerciseByCourse(String courseId) async {
    final response = await courseRemoteDatasource.getExercises(courseId);

    if (response.data == null) {
      return null;
    }

    final data = ExerciseListResponseEntity(
      status: response.status ?? -1,
      message: response.message ?? '',
      data: List<ExerciseDataModel>.from(response.data ?? [])
          .map(
            (e) => ExerciseDataEntity(
              exerciseId: e.exerciseId ?? '',
              exerciseTitle: e.exerciseTitle ?? '',
              accessType: e.accessType ?? '',
              icon: e.icon ?? '',
              exerciseUserStatus: e.exerciseUserStatus ?? '',
              jumlahSoal: e.jumlahSoal ?? '',
              jumlahDone: e.jumlahDone ?? 0,
            ),
          )
          .toList(),
    );

    return data.data;
  }
}
