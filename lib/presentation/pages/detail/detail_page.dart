import '../../misc/constants.dart';
import '../../misc/method.dart';
import '../../providers/movie/movie_detail_provider.dart';
import '../../providers/router/page_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../domain/movie.dart';
import '../../../domain/movie_detail.dart';
import '../../widgets/back_navigation_bar.dart';
import 'method/backdrop_image.dart';
import 'method/background.dart';
import 'method/cast_view.dart';
import 'method/movie_short_info.dart';
import 'method/overview.dart';

class DetailPage extends ConsumerStatefulWidget {
  const DetailPage({required this.movie, super.key});
  final Movie movie;

  @override
  ConsumerState<DetailPage> createState() => _DetailPageState(movie: movie);
}

class _DetailPageState extends ConsumerState<DetailPage> {
  final Movie movie;

  _DetailPageState({required this.movie});

  @override
  Widget build(BuildContext context) {
    var asyncMovieDetail = ref.watch(MovieDetailProvider(movie: movie));
    double maxWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Stack(
        children: [
          ...backGround(movie),
          ListView(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(24, 24, 24, 10),
                child: Column(
                  children: [
                    BackNavigationBar(
                      title: movie.title,
                      onTap: () => ref.read(routerProvider).pop(),
                    ),
                    verticalSpace(24),
                    // backDropImage
                    Hero(
                        tag: movie.title,
                        child:
                            backDropImage(maxWidth, asyncMovieDetail, context)),
                    verticalSpace(10),
                    ...movieShortInfo(
                        asycnMovieDetail: asyncMovieDetail, context: context),
                    verticalSpace(20),
                    ...overview(asycnMocieDetail: asyncMovieDetail),
                    verticalSpace(40),
                  ],
                ),
              ),
              ...castView(movie: movie, ref: ref),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 40, horizontal: 24),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: saffron,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  onPressed: () {
                    MovieDetail? movieDetail = asyncMovieDetail.valueOrNull;

                    if (movieDetail != null) {
                      ref
                          .read(routerProvider)
                          .pushNamed('timeBooking', extra: movieDetail);
                    }
                  },
                  child: const Text(
                    'Book this movie',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
