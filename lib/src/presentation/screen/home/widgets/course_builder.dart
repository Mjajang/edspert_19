// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:edspert_19/src/presentation/screen/courses/widgets/course_list_item_widget.dart';
import 'package:flutter/material.dart';

import 'package:edspert_19/src/domain/entity/course_list_response_entity.dart';

class CourseBuilder extends StatelessWidget {
  final List<CourseDataEntity> courseList;

  const CourseBuilder({
    Key? key,
    required this.courseList,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: courseList.length > 5 ? 5 : courseList.length,
      separatorBuilder: (context, index) => const SizedBox(height: 8),
      itemBuilder: (context, index) {
        return CourseListItemWidget(data: courseList[index]);
      },
    );
  }
}
