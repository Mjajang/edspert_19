part of '../banner_bloc.dart';

class GetBannerLoading extends BannerState {}

class GetBannerSuccess extends BannerState {
  final List<BannerDataEntity> banners;

  GetBannerSuccess({required this.banners});
}

class GetBannerError extends BannerState {
  final String errorMessage;

  GetBannerError({required this.errorMessage});
}
