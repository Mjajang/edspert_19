import 'package:edspert_19/src/domain/entity/banner_response_entity.dart';

abstract class BannerRepositoryAbs {
  Future<List<BannerDataEntity>> getBanners();
}
