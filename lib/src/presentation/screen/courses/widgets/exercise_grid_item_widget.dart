// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class ExerciseListItemWidget extends StatelessWidget {
  const ExerciseListItemWidget({
    Key? key,
    // required this.data,
  }) : super(key: key);

  // final ExerciseDataEntity data;

  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      child: InkWell(
        onTap: () {},
        child: Ink(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
          ),
          child: const Column(
            children: [
              // Image.network(
              //   data.icon,
              //   width: 50,
              //   height: 50,
              //   errorBuilder: (context, err, _) => Container(
              //     height: 50,
              //     width: 50,
              //     color: Colors.grey,
              //   ),
              // ),
              // Text(
              //   data.exerciseTitle,
              //   maxLines: 1,
              //   overflow: TextOverflow.ellipsis,
              // ),
              // Text('${data.jumlahDone}/${data.jumlahSoal} Soal'),
            ],
          ),
        ),
      ),
    );
  }
}
