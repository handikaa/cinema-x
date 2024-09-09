import '../../../../domain/movie_detail.dart';
import '../../../misc/method.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

List<Widget> overview({required AsyncValue<MovieDetail?> asycnMocieDetail}) => [
      Column(
        children: [
          const Row(
            children: [
              Text(
                'Overview',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          verticalSpace(10),
          Text(
            asycnMocieDetail.valueOrNull?.overview != null
                ? asycnMocieDetail.valueOrNull!.overview
                : '-',
            textAlign: TextAlign.left,
          ),
        ],
      )
    ];
