import 'package:edspert_19/src/domain/entity/course_list_response_entity.dart';
import 'package:edspert_19/src/domain/entity/exercise_list_response_entity.dart';

abstract class CourseRepositoryAbs {
  ////Course List
  Future<List<CourseDataEntity>?> getCourses(String majorName);

  ////Exercise List
  Future<List<ExerciseDataEntity>?> getExerciseByCourse(String courseId);
}
