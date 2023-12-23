// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:edspert_19/src/domain/entity/course_list_response_entity.dart';
import 'package:edspert_19/src/presentation/blocs/course/course_bloc.dart';
import 'package:edspert_19/src/presentation/screen/courses/widgets/course_list_item_widget.dart';
import 'package:edspert_19/src/values/strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CourseListScreen extends StatefulWidget {
  const CourseListScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<CourseListScreen> createState() => _CourseListScreenState();
}

class _CourseListScreenState extends State<CourseListScreen> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      context.read<CourseBloc>().add(GetCourseListEvent(majorName: 'IPA'));
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CourseBloc, CourseState>(
      buildWhen: (prev, next) =>
          next is GetCoursesLoading ||
          prev is GetCoursesLoading && next is GetCoursesSuccess ||
          prev is GetCoursesLoading && next is GetCoursesError,
      builder: (context, courseState) {
        Widget body = const SizedBox();

        if (courseState is GetCoursesLoading) {
          body = const Center(child: CircularProgressIndicator());
        }

        if (courseState is GetCoursesSuccess) {
          body = Padding(
            padding: const EdgeInsets.symmetric(horizontal: 22.0, vertical: 12),
            child: ListView.separated(
              itemBuilder: (context, index) {
                CourseDataEntity data = courseState.courseResponse![index];
                return CourseListItemWidget(data: data);
              },
              separatorBuilder: ((context, index) => const SizedBox(
                    height: 15,
                  )),
              itemCount: courseState.courseResponse!.length,
            ),
          );
        }

        return Scaffold(
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
              Strings.pilihPelajaran,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w700,
                fontSize: 18,
              ),
            ),
          ),
          body: body,
        );
      },
    );
  }
}
