import 'package:bookly/Features/home/presentation/views/home_view.dart';
import 'package:bookly/core/utils/app_router.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'constants.dart';
import 'Features/splash/presentation/views/splash_view.dart';
import 'package:go_router/go_router.dart';
void main() {
  runApp(
    DevicePreview(
      enabled: true,
      builder: (context) => BooklyApp(), // Wrap your app
    ),
  );
}

class BooklyApp extends StatelessWidget {
  const BooklyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp.router(
      useInheritedMediaQuery: true,
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
      routerConfig: AppRouter.router,
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(scaffoldBackgroundColor: kPrimaryColor,
       textTheme: GoogleFonts.montserratTextTheme(ThemeData.dark().textTheme)
      ),

    );
  }
}

