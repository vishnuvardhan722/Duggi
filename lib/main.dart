import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:paxzadmin/app/constants/constants.dart';
import 'package:paxzadmin/app/routes/app_route_config.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return
        // MultiBlocProvider(
        //   providers: providers,
        //   child: const Core(
        //       //! The root widget of the app that can access the provided data
        //       ),
        // );

        const Core(
            //! The root widget of the app that can access the provided data
            );
  }
}

class Core extends StatelessWidget {
  const Core({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Pax-z admin',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: BconstantColors.basecolor,
        ),
        fontFamily: GoogleFonts.poppins().fontFamily,
        useMaterial3: true,
      ),
      //! Go Router config
      routerConfig: MyAppRouteConfig().router,
    );
  }
}
