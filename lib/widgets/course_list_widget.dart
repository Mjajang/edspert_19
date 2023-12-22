import 'package:edspert_19/models/course_response_model.dart';
import 'package:edspert_19/screen/all_exercise_screen.dart';
import 'package:flutter/material.dart';

class CourseListWidget extends StatelessWidget {
  const CourseListWidget({
    super.key,
    required this.courseList,
    this.isHomescreen = true,
  });

  final List<CourseData> courseList;
  final bool isHomescreen;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      itemCount: isHomescreen ? 3 : courseList.length,
      physics: isHomescreen
          ? const NeverScrollableScrollPhysics()
          : const BouncingScrollPhysics(),
      separatorBuilder: (context, index) => const SizedBox(height: 15),
      itemBuilder: ((context, index) {
        final course = courseList[index];

        return InkWell(
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AllExerciseScreen(
                courseId: course.courseId ?? '',
                majorTitle: course.majorName ?? '',
              ),
            ),
          ),
          child: Container(
            height: 96,
            padding: const EdgeInsets.symmetric(vertical: 22, horizontal: 12),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(13),
                  decoration: BoxDecoration(
                    color: const Color(0xffF3F7F8),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Image.network(
                    course.urlCover ?? '',
                    width: 28,
                    height: 28,
                    errorBuilder: (context, error, stackTrace) => Container(
                      height: 28,
                      width: 28,
                      color: Colors.redAccent,
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(course.majorName ?? 'No Course'),
                      Text(
                        "${course.jumlahDone} / ${course.jumlahMateri} Paket latihan soal",
                      ),
                      const SizedBox(height: 4),
                      const LinearProgressIndicator(
                        value: 0.5,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}
