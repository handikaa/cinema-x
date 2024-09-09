import '../../../../data/dio_client/api_constant.dart';
import '../../../providers/movie/actors_provider.dart';
import '../../../widgets/network_image_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../domain/movie.dart';

List<Widget> castView({required Movie movie, required WidgetRef ref}) => [
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.fromLTRB(24, 0, 24, 10),
            child: Text(
              'Actor',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.baseline,
              textBaseline: TextBaseline.ideographic,
              children: [
                ...(ref.watch(actorsProvider(movieId: movie.id)).whenOrNull(
                          data: (actors) => actors
                              .where((element) => element.profilePath != null)
                              .map(
                                (e) => Container(
                                  margin: EdgeInsets.only(
                                      left: e == actors.first ? 24 : 10,
                                      right: e == actors.last ? 24 : 10),
                                  width: 150,
                                  // height: 230,
                                  child: NetworkImageCard(
                                    width: 150,
                                    height: 200,
                                    title: e.name,
                                    imageUrl:
                                        '${ApiConstant.baseUrlImage}${e.profilePath}',
                                  ),
                                ),
                              ),
                        ) ??
                    []),
              ],
            ),
          )
        ],
      )
    ];
