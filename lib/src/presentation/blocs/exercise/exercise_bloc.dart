// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:edspert_19/src/data/model/model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:edspert_19/src/data/datasource/remote/course_remote_datasource.dart';
import 'package:meta/meta.dart';

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

        final result =
            await courseRemoteDatasource.getExercises(event.courseId);

        emit(ExerciseSuccess(exerciseResponse: result));
      }
    });
  }
}
