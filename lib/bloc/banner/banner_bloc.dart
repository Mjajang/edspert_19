// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import 'package:edspert_19/datasources/banner_remote_datasource.dart';
import 'package:edspert_19/models/banner_response_model.dart';

part 'banner_event.dart';
part 'banner_state.dart';

class BannerBloc extends Bloc<BannerEvent, BannerState> {
  final BannerRemoteDatasource bannerRemoteDatasource;
  BannerBloc({
    required this.bannerRemoteDatasource,
  }) : super(BannerInitial()) {
    on<BannerEvent>((event, emit) async {
      if (event is GetBannerListEvent) {
        emit(BannerLoading());

        final result = await bannerRemoteDatasource.getBanners();

        emit(BannerSuccess(bannerResponse: result));
      }
    });
  }
}
