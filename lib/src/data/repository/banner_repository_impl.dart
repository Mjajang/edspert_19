import 'package:edspert_19/src/data/datasource/remote/banner_remote_datasource.dart';
import 'package:edspert_19/src/data/model/model.dart';
import 'package:edspert_19/src/domain/entity/banner_response_entity.dart';
import 'package:edspert_19/src/domain/repository/banner_repository_abs.dart';

class BannerRepositoryImpl implements BannerRepositoryAbs {
  final BannerRemoteDatasource bannerRemoteDatasource;

  BannerRepositoryImpl({required this.bannerRemoteDatasource});

  @override
  Future<List<BannerDataEntity>?> getBanners() async {
    BannerResponseModel bannerResponseModel =
        await bannerRemoteDatasource.getBanners();

    List<BannerDataModel>? bannerDataModel = bannerResponseModel.data;

    if (bannerDataModel != null) {
      /// Online
      List<BannerDataEntity> bannerData =
          List<BannerDataModel>.from(bannerDataModel)
              .map(
                (e) => BannerDataEntity(
                  eventImage: e.eventImage ?? '',
                ),
              )
              .toList();

      /// Save to local DB (Backup for Offline-mode)
      /// ... saveToLocal();

      return bannerData;
    } else {
      /// Offline
      /// Get from local DB (Backup for Offline-mode)
      return null;
    }
  }
}
