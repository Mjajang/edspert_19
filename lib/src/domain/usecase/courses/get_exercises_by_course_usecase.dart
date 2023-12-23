import 'package:edspert_19/src/domain/entity/exercise_list_response_entity.dart';
import 'package:edspert_19/src/domain/repository/course_repository_abs.dart';

class GetExercisesByCourseUsecase {
  final CourseRepositoryAbs courseRepositoryAbs;

  GetExercisesByCourseUsecase({required this.courseRepositoryAbs});

  Future<List<ExerciseDataEntity>?> call(String courseId) async =>
      await courseRepositoryAbs.getExerciseByCourse(courseId);
}
