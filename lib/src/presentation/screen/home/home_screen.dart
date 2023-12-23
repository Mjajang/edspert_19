import 'package:edspert_19/src/presentation/blocs/banner/banner_bloc.dart';
import 'package:edspert_19/src/presentation/blocs/course/course_bloc.dart';
import 'package:edspert_19/src/presentation/router/routes.dart';
import 'package:edspert_19/src/presentation/screen/home/widgets/course_builder.dart';
import 'package:edspert_19/src/presentation/screen/home/widgets/widgets.dart';
import 'package:edspert_19/src/values/strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void didChangeDependencies() {
    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
      context.read<CourseBloc>().add(GetCourseListEvent(majorName: 'IPA'));
      context.read<BannerBloc>().add(GetBannerListEvent());
    });
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                      Strings.pilihPelajaran,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextButton(
                      onPressed: () => Navigator.of(context).pushNamed(
                        Routes.courseListScreen,
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
                  builder: (context, courseState) {
                    if (courseState is GetCoursesLoading) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }

                    if (courseState is GetCoursesSuccess) {
                      return CourseBuilder(
                        courseList: courseState.courseResponse ?? [],
                      );
                    }

                    return const SizedBox.shrink();
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
                  builder: (context, bannerState) {
                    // print("//${bannerState.runtimeType}");

                    if (bannerState is GetBannerLoading) {
                      return const Center(child: CircularProgressIndicator());
                    }

                    if (bannerState is GetBannerSuccess) {
                      return BannerBuilder(
                        bannerList: bannerState.banners,
                      );
                    }

                    if (bannerState is GetBannerError) {
                      return Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(bannerState.errorMessage),
                            const SizedBox(height: 10),
                            IconButton(
                              onPressed: () {
                                context
                                    .read<BannerBloc>()
                                    .add(GetBannerListEvent());
                              },
                              icon: const Icon(Icons.refresh),
                            ),
                          ],
                        ),
                      );
                    }

                    return const SizedBox.shrink();
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
