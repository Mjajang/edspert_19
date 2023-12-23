part of '../course_bloc.dart';

class GetCoursesLoading extends CourseState {}

class GetCoursesSuccess extends CourseState {
  final List<CourseDataEntity>? courseResponse;

  GetCoursesSuccess({required this.courseResponse});
}

class GetCoursesError extends CourseState {
  final String? errorMessage;

  GetCoursesError({this.errorMessage});
}
