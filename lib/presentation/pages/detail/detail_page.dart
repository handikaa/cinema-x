import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../domain/movie.dart';
import '../../../domain/movie_detail.dart';
import '../../misc/method.dart';
import '../../providers/movie/movie_detail_provider.dart';
import '../../providers/router/page_routes.dart';
import '../../widgets/back_navigation_bar.dart';
import '../../widgets/button/elevated_button_extra_lage.dart';
import '../../widgets/button/outline_button_extra_large.dart';
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
    final theme = Theme.of(context);
    final TextTheme = theme.textTheme;

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
                    backDropImage(maxWidth, asyncMovieDetail, context),
                    verticalSpace(10),
                    ...movieShortInfo(
                        asycnMovieDetail: asyncMovieDetail,
                        context: context,
                        theme: theme),
                    verticalSpace(20),
                    Row(
                      children: [
                        SizedBox(
                          width: 115,
                          child: OutlineButtonExtraLarge(
                            icon: Icons.play_arrow,
                            text: 'Trailer',
                            onPressed: () {
                              ref
                                  .read(routerProvider)
                                  .pushNamed('video-player');
                            },
                          ),
                        ),
                        horizontalSpace(30),
                        Expanded(
                          child: SizedBox(
                            child: CustomElevatedButton(
                              buttonType: ButtonType.extraLarge,
                              onPressed: () {
                                MovieDetail? movieDetail =
                                    asyncMovieDetail.valueOrNull;

                                if (movieDetail != null) {
                                  ref.read(routerProvider).pushNamed(
                                      'timeBooking',
                                      extra: movieDetail);
                                }
                              },
                              text: 'Buy Ticket Now',
                            ),
                          ),
                        ),
                      ],
                    ),
                    verticalSpace(30),
                    ...overview(asycnMocieDetail: asyncMovieDetail),
                    verticalSpace(30),
                  ],
                ),
              ),
              ...castView(movie: movie, ref: ref),
              verticalSpace(50),
            ],
          ),
        ],
      ),
    );
  }
}
