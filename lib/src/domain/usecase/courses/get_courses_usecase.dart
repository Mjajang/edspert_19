import 'package:edspert_19/src/domain/entity/course_list_response_entity.dart';
import 'package:edspert_19/src/domain/repository/course_repository_abs.dart';

class GetCoursesUsecase {
  final CourseRepositoryAbs courseRepositoryAbs;

  GetCoursesUsecase({required this.courseRepositoryAbs});

  Future<List<CourseDataEntity>?> call(String majorName) async =>
      await courseRepositoryAbs.getCourses(majorName);
}
