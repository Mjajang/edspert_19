import 'package:dio/dio.dart';
import 'package:edspert_19/screen/splash_screen.dart';
import 'package:edspert_19/src/data/datasource/remote/banner_remote_datasource.dart';
import 'package:edspert_19/src/data/repository/repositories.dart';
import 'package:edspert_19/src/domain/usecase/banner/get_banners_usecase.dart';
import 'package:edspert_19/src/presentation/blocs/banner/banner_bloc.dart';
import 'package:edspert_19/src/presentation/router/routes.dart';
import 'package:edspert_19/src/presentation/screen/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BannerBloc(
        getBannerUsercase: GetBannerUsercase(
          bannerRepositoryAbs: BannerRepositoryImpl(
            bannerRemoteDatasource: BannerRemoteDatasource(
              client: Dio(),
            ),
          ),
        ),
      ),
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
        },
      ),
    );
  }
}
