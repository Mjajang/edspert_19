// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:edspert_19/src/presentation/router/routes.dart';
import 'package:edspert_19/src/presentation/screen/courses/exercise_list/exercise_list_screen.dart';
import 'package:edspert_19/src/values/colors.dart';
import 'package:flutter/material.dart';

import 'package:edspert_19/src/domain/entity/course_list_response_entity.dart';

class CourseListItemWidget extends StatelessWidget {
  const CourseListItemWidget({
    Key? key,
    required this.data,
  }) : super(key: key);

  final CourseDataEntity data;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).pushNamed(
          Routes.exerciseListScreen,
          arguments: ExerciseListScreenArgs(
            courseId: data.courseId,
            courseName: data.majorName,
          ),
        );
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 14),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(10),
              ),
              child: Image.network(
                data.urlCover,
                width: 28,
                height: 28,
                errorBuilder: (context, err, _) => Container(
                  height: 28,
                  width: 28,
                  color: Colors.grey,
                ),
              ),
            ),
            const SizedBox(
              width: 8,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    data.majorName,
                    style: const TextStyle(
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Text(
                    '${data.jumlahDone}/${data.jumlahMateri}',
                    style: TextStyle(
                      color: AppColors.grey,
                      fontSize: 12,
                    ),
                  ),
                  const SizedBox(
                    height: 11,
                  ),
                  LinearProgressIndicator(
                    value: data.jumlahDone /
                        (data.jumlahMateri == 0 ? 1 : data.jumlahMateri),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
