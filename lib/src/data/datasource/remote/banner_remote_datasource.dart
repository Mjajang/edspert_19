import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:edspert_19/constants/constants.dart';
import 'package:edspert_19/src/data/model/model.dart';

class BannerRemoteDatasource {
  final Dio client;

  BannerRemoteDatasource({required this.client});

  Future<BannerResponseModel> getBanners() async {
    try {
      final url = '${LearningConstants.baseUrl}${LearningConstants.bannerPath}';

      final result = await client.get(
        url,
        options: Options(
          headers: {
            'x-api-key': '18be70c0-4e4d-44ff-a475-50c51ece99a0',
          },
        ),
      );

      final bannerResponse = BannerResponseModel.fromJson(result.data);

      return bannerResponse;
    } catch (e, stacktrace) {
      log(
        e.toString(),
        stackTrace: stacktrace,
        error: e,
      );
      return BannerResponseModel();
    }
  }
}
