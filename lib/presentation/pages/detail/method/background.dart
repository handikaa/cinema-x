import '../../../../data/dio_client/api_constant.dart';
import '../../../misc/constants.dart';
import 'package:flutter/material.dart';

import '../../../../domain/movie.dart';

List<Widget> backGround(Movie movie) => [
      Stack(
        children: [
          Hero(
            tag: movie.id,
            child: Image(
              image: NetworkImage(
                  '${ApiConstant.baseUrlImage}${movie.posterPath}'),
              width: double.infinity,
              height: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  ThemeColor.darkBackground.withOpacity(1),
                  ThemeColor.darkBackground.withOpacity(0.7),
                ],
                begin: const Alignment(0, 0.4),
                end: Alignment.topCenter,
              ),
            ),
          )
        ],
      )
    ];
