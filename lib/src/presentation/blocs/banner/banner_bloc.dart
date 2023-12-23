// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:edspert_19/src/domain/entity/banner_response_entity.dart';
import 'package:edspert_19/src/domain/usecase/banner/get_banners_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'banner_event.dart';
part 'banner_state.dart';
part 'states/get_banner_states.dart';

class BannerBloc extends Bloc<BannerEvent, BannerState> {
  final GetBannerUsercase getBannerUsercase;

  BannerBloc({
    required this.getBannerUsercase,
  }) : super(BannerInitial()) {
    on<BannerEvent>((event, emit) async {
      if (event is GetBannerListEvent) {
        emit(GetBannerLoading());

        List<BannerDataEntity>? data = await getBannerUsercase();

        if (data == null) {
          emit(GetBannerError(errorMessage: 'Something went wrong'));
        } else {
          emit(GetBannerSuccess(banners: data));
        }
      }
    });
  }
}
