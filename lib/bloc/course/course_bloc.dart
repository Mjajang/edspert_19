// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc/bloc.dart';
import 'package:edspert_19/src/data/model/model.dart';
import 'package:meta/meta.dart';

import 'package:edspert_19/datasources/course_remote_datasource.dart';

part 'course_event.dart';
part 'course_state.dart';

class CourseBloc extends Bloc<CourseEvent, CourseState> {
  final CourseRemoteDatasource courseRemoteDatasource;
  CourseBloc({
    required this.courseRemoteDatasource,
  }) : super(CourseInitial()) {
    on<CourseEvent>((event, emit) async {
      if (event is GetCourseListEvent) {
        emit(CourseLoading());
        final result = await courseRemoteDatasource.getCourse();

        emit(CourseSuccess(courseResponse: result));
      }
    });
  }
}
