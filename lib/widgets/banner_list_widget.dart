// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:edspert_19/src/data/model/model.dart';
import 'package:flutter/material.dart';

class BannerListWidget extends StatelessWidget {
  final List<BannerDataModel> bannerList;

  const BannerListWidget({
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
        separatorBuilder: (context, index) => const SizedBox(width: 10),
        itemBuilder: (context, index) {
          final banner = bannerList[index];

          return ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: SizedBox(
              width: 284,
              height: 146,
              child: Image.network(
                banner.eventImage ?? 'No Image',
                fit: BoxFit.cover,
              ),
            ),
          );
        },
      ),
    );
  }
}
