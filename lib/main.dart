import 'package:dio/dio.dart';
import 'package:edspert_19/firebase_options.dart';
import 'package:edspert_19/src/data/datasource/remote/course_remote_datasource.dart';
import 'package:edspert_19/src/domain/repository/course_repository_abs.dart';
import 'package:edspert_19/src/domain/usecase/courses/get_courses_usecase.dart';
import 'package:edspert_19/src/domain/usecase/courses/get_exercises_by_course_usecase.dart';
import 'package:edspert_19/src/presentation/blocs/course/course_bloc.dart';
import 'package:edspert_19/src/presentation/screen/auth/splash_screen.dart';
import 'package:edspert_19/src/data/datasource/remote/banner_remote_datasource.dart';
import 'package:edspert_19/src/data/repository/repositories.dart';
import 'package:edspert_19/src/domain/usecase/banner/get_banners_usecase.dart';
import 'package:edspert_19/src/presentation/blocs/banner/banner_bloc.dart';
import 'package:edspert_19/src/presentation/blocs/home_nav/home_nav_cubit.dart';
import 'package:edspert_19/src/presentation/router/routes.dart';
import 'package:edspert_19/src/presentation/screen/courses/course_list/course_list_screen.dart';
import 'package:edspert_19/src/presentation/screen/courses/exercise_list/exercise_list_screen.dart';
import 'package:edspert_19/src/presentation/screen/home/home_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => BannerBloc(
            getBannerUsercase: GetBannerUsercase(
              bannerRepositoryAbs: BannerRepositoryImpl(
                bannerRemoteDatasource: BannerRemoteDatasource(
                  client: Dio(),
                ),
              ),
            ),
          ),
        ),
        BlocProvider(
          create: (context) => HomeNavCubit(),
        ),
        BlocProvider(create: (context) {
          CourseRepositoryAbs courseRepositoryAbs = CourseRepositoryImpl(
            courseRemoteDatasource: CourseRemoteDatasource(
              client: Dio(),
            ),
          );

          return CourseBloc(
            GetCoursesUsecase(courseRepositoryAbs: courseRepositoryAbs),
            GetExercisesByCourseUsecase(
                courseRepositoryAbs: courseRepositoryAbs),
          );
        }),
      ],
      child: MaterialApp(
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
          fontFamily: 'OpenSans',
        ),
        initialRoute: '/',
        routes: {
          Routes.splashScreen: (context) => const SplashScreen(),
          Routes.homeScreen: (context) => const HomeScreen(),
          Routes.courseListScreen: (context) => const CourseListScreen(),
          Routes.exerciseListScreen: (context) => const ExerciseListScreen(),
        },
      ),
    );
  }
}
