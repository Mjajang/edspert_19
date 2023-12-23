part of '../course_bloc.dart';

class GetExercisesByCourseLoading extends CourseState {}

class GetExercisesByCourseSuccess extends CourseState {
  final List<ExerciseDataEntity>? exerciseResponse;

  GetExercisesByCourseSuccess(this.exerciseResponse);
}

class GetExercisesByCourseError extends CourseState {
  final String errorMessage;

  GetExercisesByCourseError(this.errorMessage);
}
