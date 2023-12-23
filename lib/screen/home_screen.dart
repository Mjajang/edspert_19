import 'package:dio/dio.dart';
import 'package:edspert_19/src/data/datasource/remote/banner_remote_datasource.dart';
import 'package:edspert_19/src/data/datasource/remote/course_remote_datasource.dart';
import 'package:edspert_19/screen/all_course_screen.dart';
import 'package:edspert_19/src/presentation/blocs/banner/banner_bloc.dart';
import 'package:edspert_19/src/presentation/blocs/course/course_bloc.dart';
import 'package:edspert_19/widgets/banner_list_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../widgets/course_list_widget.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final courseBloc =
      CourseBloc(courseRemoteDatasource: CourseRemoteDatasource(client: Dio()));

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => BannerBloc(
            bannerRemoteDatasource: BannerRemoteDatasource(client: Dio()),
          )..add(GetBannerListEvent()),
        ),
        BlocProvider(
          create: (context) =>
              courseBloc..add(GetCourseListEvent(majorName: 'IPA')),
        ),
      ],
      child: Scaffold(
        backgroundColor: Colors.grey[200],
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 22.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Hi, Altop",
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            "Selamat Datang",
                            style: TextStyle(
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                      CircleAvatar(
                        radius: 17.5,
                        backgroundImage: AssetImage(
                          'assets/images/profile.jpeg',
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Container(
                    height: 147,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: const Color(0xff357AD4),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(top: 26.0, left: 20),
                          child: Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              "Mau kerjain\nLatihan soal\napa hari ini?",
                              style: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 20,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.bottomRight,
                          child: Image.asset(
                            'assets/images/banner.png',
                            scale: 2,
                            height: 70,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 27),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Pilih Pelajaran",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextButton(
                        onPressed: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => AllCourseScreen(
                              courseBloc: courseBloc,
                            ),
                          ),
                        ),
                        child: const Text(
                          "Lihat Semua",
                          style: TextStyle(
                            color: Color(0xff357AD4),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  BlocBuilder<CourseBloc, CourseState>(
                    builder: (context, state) {
                      if (state is CourseFailed) {
                        return Center(
                          child: Text(state.message ?? ''),
                        );
                      }

                      if (state is CourseSuccess) {
                        return CourseListWidget(
                          courseList: state.courseResponse.data ?? [],
                        );
                      }

                      return const Center(child: CircularProgressIndicator());
                    },
                  ),
                  const SizedBox(height: 27),
                  const Text(
                    "Terbaru",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 12),
                  BlocBuilder<BannerBloc, BannerState>(
                    builder: (context, state) {
                      // print("//${state.runtimeType}");

                      if (state is BannerFailed) {
                        return Center(
                          child: Text(state.message ?? ''),
                        );
                      } else if (state is BannerSuccess) {
                        return BannerListWidget(
                          bannerList: state.bannerResponse.data ?? [],
                        );
                      }

                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
