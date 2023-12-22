// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:edspert_19/widgets/course_list_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:edspert_19/bloc/course/course_bloc.dart';

class AllCourseScreen extends StatelessWidget {
  final CourseBloc courseBloc;

  const AllCourseScreen({
    Key? key,
    required this.courseBloc,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => courseBloc,
      child: Scaffold(
        backgroundColor: Colors.grey[200],
        appBar: AppBar(
          backgroundColor: const Color(0xff357AD4),
          automaticallyImplyLeading: false,
          leading: IconButton(
              onPressed: () => Navigator.pop(context),
              icon: const Icon(
                Icons.arrow_back,
                color: Colors.white,
                size: 18,
              )),
          title: const Text(
            "Pilih pelajaran",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w700,
              fontSize: 18,
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.only(
            top: 12.0,
            bottom: 30.0,
            left: 22.0,
            right: 22.0,
          ),
          child: BlocBuilder<CourseBloc, CourseState>(
            builder: (context, state) {
              if (state is CourseFailed) {
                return Center(
                  child: Text(state.message ?? ''),
                );
              }

              if (state is CourseSuccess) {
                return CourseListWidget(
                  courseList: state.courseResponse.data ?? [],
                  isHomescreen: false,
                );
              }

              return const Center(
                child: CircularProgressIndicator(),
              );
            },
          ),
        ),
      ),
    );
  }
}
