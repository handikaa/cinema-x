import 'package:flix_id/presentation/pages/update_profile/update_profile_page.dart';
import 'package:flix_id/presentation/pages/welcome_page/welcome_page.dart';

import '../../../domain/movie_detail.dart';
import '../../pages/booking_confirmation/booking_confirmatio_page.dart';
import '../../pages/detail/detail_page.dart';
import '../../pages/home/my_home_page.dart';
import '../../pages/login/login_page.dart';
import '../../pages/register/register_page.dart';
import '../../pages/seat_booking/seat_booking_page.dart';
import '../../pages/splash/splash_screen.dart';
import '../../pages/time_booking/time_booking_page.dart';
import '../../pages/wallet_page/wallet_page.dart';
import '../../widgets/video_playe_trailer.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../domain/movie.dart';
import '../../../domain/transaction.dart';

part 'page_routes.g.dart';

@Riverpod(keepAlive: true)
Raw<GoRouter> router(RouterRef ref) => GoRouter(
      routes: [
        GoRoute(
          path: '/main',
          name: 'main',
          builder: (context, state) => const MyHomePage(title: 'Home'),
        ),
        GoRoute(
          path: '/login',
          name: 'login',
          builder: (context, state) => const LoginPage(),
        ),
        GoRoute(
          path: '/register',
          name: 'register',
          builder: (context, state) => const RegisterPage(),
        ),
        GoRoute(
          path: '/',
          name: 'splash',
          builder: (context, state) => const SplashScreen(),
        ),
        GoRoute(
          path: '/detailMovie',
          name: 'detailMovie',
          builder: (context, state) => DetailPage(
            movie: state.extra as Movie,
          ),
        ),
        GoRoute(
          path: '/timeBooking',
          name: 'timeBooking',
          builder: (context, state) => TimeBookingPage(
            state.extra as MovieDetail,
          ),
        ),
        GoRoute(
          path: '/trailer',
          name: 'trailer',
          builder: (context, state) => const VideoPlayeTrailer(),
        ),
        GoRoute(
          path: '/seatBooking',
          name: 'seatBooking',
          builder: (context, state) => SeatBookingPage(
            transactionDetail: state.extra as (MovieDetail, Transaction),
          ),
        ),
        GoRoute(
          path: '/confirmation',
          name: 'confirmation',
          builder: (context, state) => BookingConfirmatioPage(
            transactionDetail: state.extra as (MovieDetail, Transaction),
          ),
        ),
        GoRoute(
          path: '/wallet-page',
          name: 'wallet-page',
          builder: (context, state) => const WalletPage(),
        ),
        GoRoute(
          path: '/update-profile',
          name: 'update-profile',
          builder: (context, state) => const UpdateProfilePage(),
        ),
        GoRoute(
          path: '/welcome',
          name: 'welcome',
          builder: (context, state) => const WelcomePage(),
        ),
        GoRoute(
          path: '/video-player',
          name: 'video-player',
          builder: (context, state) => const VideoPlayeTrailer(),
        ),
      ],
      initialLocation: '/',
      debugLogDiagnostics: false,
    );
