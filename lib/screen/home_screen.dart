import 'package:edspert_19/datasources/banner_remote_datasource.dart';
import 'package:edspert_19/datasources/course_remote_datasource.dart';
import 'package:edspert_19/models/banner_response_model.dart';
import 'package:edspert_19/models/course_response_model.dart';
import 'package:edspert_19/widgets/banner_list_widget.dart';
import 'package:flutter/material.dart';

import '../widgets/course_list_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final bannerRemoteDatasource = BannerRemoteDatasource();
  final courseRemoteDatasource = CourseRemoteDatasource();
  BannerResponse? bannerResponse;
  CourseResponse? courseResponse;

  @override
  void initState() {
    getBanner();
    getCourse();
    super.initState();
  }

  Future<void> getBanner() async {
    bannerResponse = await bannerRemoteDatasource.getBanners();

    setState(() {});
  }

  Future<void> getCourse() async {
    courseResponse = await courseRemoteDatasource.getCourse();

    setState(() {});
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
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Pilih Pelajaran",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "Lihat Semua",
                      style: TextStyle(
                        color: Color(0xff357AD4),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                courseResponse == null
                    ? const Center(
                        child: CircularProgressIndicator(),
                      )
                    : CourseListWidget(
                        courseList: courseResponse?.data ?? [],
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
                bannerResponse == null
                    ? const Center(
                        child: CircularProgressIndicator(),
                      )
                    : BannerListWidget(bannerList: bannerResponse?.data ?? []),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
