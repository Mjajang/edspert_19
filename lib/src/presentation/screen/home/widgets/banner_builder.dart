// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:edspert_19/src/domain/entity/banner_response_entity.dart';

class BannerBuilder extends StatelessWidget {
  final List<BannerDataEntity> bannerList;

  const BannerBuilder({
    Key? key,
    required this.bannerList,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 146,
      child: ListView.separated(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: bannerList.length,
        separatorBuilder: (context, index) => const SizedBox(width: 8),
        itemBuilder: (context, index) {
          final banner = bannerList[index];

          return ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: SizedBox(
              width: 284,
              height: 146,
              child: Image.network(
                banner.eventImage,
                fit: BoxFit.cover,
              ),
            ),
          );
        },
      ),
    );
  }
}
