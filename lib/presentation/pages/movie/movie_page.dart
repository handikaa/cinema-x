import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../misc/assets.dart';
import '../../misc/method.dart';
import '../../providers/movie/now_playing_provider.dart';
import '../../providers/movie/upcoming_provider.dart';
import '../../providers/router/page_routes.dart';
import 'method/movie_carousel.dart';
import 'method/movie_list.dart';
import 'method/promotion_list.dart';
import 'method/search_bar.dart';
import 'method/user_info.dart';

class MoviePage extends ConsumerStatefulWidget {
  const MoviePage({super.key});

  @override
  ConsumerState<MoviePage> createState() => _MoviePageState();
}

class _MoviePageState extends ConsumerState<MoviePage> {
  int indexMovie = 0;

  // @override
  // void initState() {
  //   super.initState();
  //   Future.delayed(const Duration(seconds: 4), () {
  //     dialogPromotion(context);
  //   });
  // }

  // Future<void> dialogPromotion(BuildContext context) {
  //   double maxWidth = MediaQuery.of(context).size.width;

  //   return showDialog<void>(
  //     context: context,
  //     builder: (BuildContext context) {
  //       return AlertDialog(
  //         contentPadding: const EdgeInsets.all(0),
  //         content: Container(
  //           width: (maxWidth - 68) * 0.6,
  //           height: maxWidth - 60,
  //           decoration: BoxDecoration(
  //             borderRadius: BorderRadius.circular(20),
  //             image: const DecorationImage(
  //                 image: AssetImage('assets/images/banner.jpg'),
  //                 fit: BoxFit.cover),
  //           ),
  //         ),
  //       );
  //     },
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    List<String> promotionImage = [
      promoImage1,
      promoImage2,
      promoImage3,
      promoImage4,
      promoImage5,
    ];

    return Stack(
      children: [
        ListView(
          children: [
            userInfo(ref, context),
            verticalSpace(40),
            searchBar(context, theme),
            verticalSpace(40),
            ...movieCarousel(
              movieIndex: indexMovie,
              onPageChanged: (index, reason) {
                setState(() {
                  indexMovie = index;
                });
              },
              title: 'Now Playing',
              movies: ref.watch(nowPlayingProvider),
              onTap: (movie) {
                ref.read(routerProvider).pushNamed('detailMovie', extra: movie);
              },
              textTheme: textTheme,
            ),
            verticalSpace(20),
            ...promotionList(promotionImage),
            verticalSpace(40),
            ...movieList(
              title: 'Upcoming',
              movies: ref.watch(upcomingProvider),
              onTap: (movie) {},
            ),
            verticalSpace(80),
          ],
        ),
      ],
    );
  }
}
