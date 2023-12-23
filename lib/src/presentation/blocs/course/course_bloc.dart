// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:edspert_19/src/domain/entity/course_list_response_entity.dart';
import 'package:edspert_19/src/domain/entity/exercise_list_response_entity.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:edspert_19/src/domain/usecase/courses/get_courses_usecase.dart';
import 'package:edspert_19/src/domain/usecase/courses/get_exercises_by_course_usecase.dart';
import 'package:meta/meta.dart';

part 'course_event.dart';
part 'course_state.dart';
part 'states/get_courses_states.dart';
part 'states/get_exercise_by_course_states.dart';

class CourseBloc extends Bloc<CourseEvent, CourseState> {
  final GetCoursesUsecase getCoursesUsecase;
  final GetExercisesByCourseUsecase getExercisesByCourseUsecase;

  CourseBloc(
    this.getCoursesUsecase,
    this.getExercisesByCourseUsecase,
  ) : super(CourseInit()) {
    on<CourseEvent>((event, emit) async {
      if (event is GetCourseListEvent) {
        emit(GetCoursesLoading());

        final List<CourseDataEntity>? getCourses =
            await getCoursesUsecase(event.majorName);

        if (getCourses == null) {
          emit(GetCoursesError(errorMessage: 'Something wrong'));
        } else {
          emit(GetCoursesSuccess(courseResponse: getCourses));
        }
      }

      if (event is GetExercisesByCourseEvent) {
        emit(GetExercisesByCourseLoading());

        final List<ExerciseDataEntity>? getExercises =
            await getExercisesByCourseUsecase(event.courseId);

        if (getExercises == null) {
          emit(GetExercisesByCourseError('Something wrong'));
        } else {
          emit(GetExercisesByCourseSuccess(getExercises));
        }
      }
    });
  }
}
