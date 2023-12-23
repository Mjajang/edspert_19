part of 'exercise_bloc.dart';

@immutable
sealed class ExerciseEvent {}

class GetExerciseListEvent extends ExerciseEvent {
  final String courseId;

  GetExerciseListEvent({required this.courseId});
}
