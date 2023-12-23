import 'package:edspert_19/src/domain/entity/banner_response_entity.dart';
import 'package:edspert_19/src/domain/repository/banner_repository_abs.dart';

class GetBannerUsercase {
  final BannerRepositoryAbs bannerRepositoryAbs;

  GetBannerUsercase({required this.bannerRepositoryAbs});

  Future<List<BannerDataEntity>?> call() async =>
      await bannerRepositoryAbs.getBanners();
}
