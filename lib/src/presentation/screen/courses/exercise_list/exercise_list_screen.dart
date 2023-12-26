// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:edspert_19/src/values/margins.dart';
import 'package:flutter/material.dart';

class ExerciseListScreenArgs {
  final String courseId;
  final String courseName;

  ExerciseListScreenArgs({
    required this.courseId,
    required this.courseName,
  });
}

class ExerciseListScreen extends StatefulWidget {
  const ExerciseListScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<ExerciseListScreen> createState() => _ExerciseListScreenState();
}

class _ExerciseListScreenState extends State<ExerciseListScreen> {
  String courseName = '';

  @override
  void didChangeDependencies() {
    final dynamic args = ModalRoute.of(context)?.settings.arguments;
    if (args is ExerciseListScreenArgs) {
      courseName = args.courseName;
    }
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          courseName,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w700,
            fontSize: 18,
          ),
        ),
      ),
      body: GridView.builder(
        padding: Margins.paddingPage,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 12,
          crossAxisSpacing: 12,
          childAspectRatio: 153 / 96,
        ),
        itemCount: 3,
        itemBuilder: (context, index) {
          return const Card();
        },
      ),
    );
  }
}
