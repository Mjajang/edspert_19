part of 'course_bloc.dart';

@immutable
sealed class CourseEvent {}

class GetCourseListEvent extends CourseEvent {
  final String majorName;

  GetCourseListEvent({required this.majorName});
}

class GetExercisesByCourseEvent extends CourseEvent {
  final String courseId;

  GetExercisesByCourseEvent({required this.courseId});
}
