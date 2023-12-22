// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:edspert_19/datasources/course_remote_datasource.dart';
import 'package:meta/meta.dart';

import 'package:edspert_19/models/exercise_response_model.dart';

part 'exercise_event.dart';
part 'exercise_state.dart';

class ExerciseBloc extends Bloc<ExerciseEvent, ExerciseState> {
  final CourseRemoteDatasource courseRemoteDatasource;
  ExerciseBloc({
    required this.courseRemoteDatasource,
  }) : super(ExerciseInitial()) {
    on<ExerciseEvent>((event, emit) async {
      if (event is GetExerciseListEvent) {
        emit(ExerciseLoading());

        final result = await courseRemoteDatasource.getExercise(event.courseId);

        emit(ExerciseSuccess(exerciseResponse: result));
      }
    });
  }
}
