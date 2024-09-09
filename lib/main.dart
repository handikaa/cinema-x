import 'data/di/inject_container.dart';
import 'data/dio_client/api_constant.dart';
import 'firebase_options.dart';
import 'presentation/misc/constants.dart';
import 'presentation/providers/router/page_routes.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  await init(
    baseUrl: ApiConstant.baseUrlMovie,
  );

  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp.router(
      theme: ThemeData.from(
        colorScheme: ColorScheme.fromSeed(
          seedColor: saffron,
          brightness: Brightness.dark,
          surface: backgroundColor,
        ),
        useMaterial3: true,
        textTheme: TextTheme(
          bodyMedium: GoogleFonts.poppins(
            color: ghostWhite,
          ), // untuk default text
          bodyLarge:
              GoogleFonts.poppins(color: ghostWhite), // untuk text di textfield
          labelLarge: GoogleFonts.poppins(color: ghostWhite), // untuk button
        ),
      ),
      debugShowCheckedModeBanner: false,
      routeInformationParser: ref.watch(routerProvider).routeInformationParser,
      routeInformationProvider:
          ref.watch(routerProvider).routeInformationProvider,
      routerDelegate: ref.watch(routerProvider).routerDelegate,
    );
  }
}
