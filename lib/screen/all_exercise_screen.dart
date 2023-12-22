// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:edspert_19/bloc/exercise/exercise_bloc.dart';
import 'package:edspert_19/datasources/course_remote_datasource.dart';

class AllExerciseScreen extends StatelessWidget {
  final String courseId;
  final String majorTitle;

  const AllExerciseScreen({
    Key? key,
    required this.courseId,
    required this.majorTitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          ExerciseBloc(courseRemoteDatasource: CourseRemoteDatasource())
            ..add(
              GetExerciseListEvent(courseId: courseId),
            ),
      child: Scaffold(
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
          title: Text(
            majorTitle,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w700,
              fontSize: 18,
            ),
          ),
        ),
        body: BlocBuilder<ExerciseBloc, ExerciseState>(
          builder: (context, state) {
            if (state is ExerciseFailed) {
              return Center(
                child: Text(state.message ?? ''),
              );
            }

            if (state is ExerciseSuccess) {
              return GridView.builder(
                shrinkWrap: true,
                itemCount: state.exerciseResponse.data?.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 1.35,
                ),
                itemBuilder: (context, index) {
                  final exercise = state.exerciseResponse.data?[index];

                  return Card(
                    child: Padding(
                      padding: const EdgeInsets.all(12),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: 36,
                            height: 36,
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.grey[350],
                            ),
                            child: Image.network(
                              exercise?.icon ?? '',
                              height: 16,
                              errorBuilder: (context, error, stackTrace) =>
                                  const Placeholder(),
                            ),
                          ),
                          const SizedBox(
                            height: 7,
                          ),
                          Text(
                            exercise?.exerciseTitle ?? ' No title',
                            style: const TextStyle(
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          Text(
                            "${exercise?.jumlahSoal} / ${exercise?.jumlahDone} Soal",
                            style: const TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              color: Color(0xff8E8E8E),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            }

            return const Center(
              child: CircularProgressIndicator(),
            );
          },
        ),
      ),
    );
  }
}
