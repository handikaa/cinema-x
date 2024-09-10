import 'package:carousel_slider/carousel_slider.dart';
import 'package:flix_id/data/dio_client/api_constant.dart';

import '../../../widgets/network_image_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../domain/movie.dart';

List<Widget> movieCarousel(
        {required String title,
        int? movieIndex,
        void Function(Movie movie)? onTap,
        required TextTheme textTheme,
        void Function(int, CarouselPageChangedReason)? onPageChanged,
        required AsyncValue<List<Movie>> movies}) =>
    [
      Padding(
        padding: const EdgeInsets.only(bottom: 30),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              title,
              style: textTheme.headlineLarge!.copyWith(fontSize: 22),
            ),
          ],
        ),
      ),
      SizedBox(
        height: 350,
        child: movies.when(
          data: (data) => CarouselSlider.builder(
            itemCount: data.length,
            itemBuilder: (context, index, realIndex) {
              final movie = data[index];
              return NetworkImageCard(
                width: 200,
                height: 290,
                title: movieIndex == index ? movie.title : '',
                onTap: () => onTap?.call(movie),
                imageUrl: '${ApiConstant.baseUrlImage}${movie.posterPath}',
              );
            },
            options: CarouselOptions(
              scrollDirection: Axis.horizontal,
              height: 290,
              enlargeCenterPage: true,
              enlargeStrategy: CenterPageEnlargeStrategy.zoom,
              aspectRatio: 16 / 9,
              viewportFraction: 0.55,
              onPageChanged: onPageChanged,
            ),
          ),
          error: (error, stackTrace) => const SizedBox(),
          loading: () => const Center(
            child: CircularProgressIndicator(),
          ),
        ),
      ),
    ];
