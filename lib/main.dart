import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/date_symbol_data_local.dart';

import 'package:get/get.dart';

import 'app/routes/app_pages.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await initializeDateFormatting('en_US', null);
  User? user = FirebaseAuth.instance.currentUser;


  String routesLogin() {
    if (user == null) {
      return AppPages.INITIAL;
    } else {
      if (user.email == "dokter@gmail.com") {
        return Routes.DOKTER_HOME;
      } else {
        return Routes.NAVIGATION_BAR;
      }
    }
  }

  runApp(
    ScreenUtilInit(
      designSize: const Size(414, 896),
      builder: (_, __) => GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Application",
        initialRoute: routesLogin(),
        getPages: AppPages.routes,
        theme: ThemeData(
          primarySwatch: Colors.blue,
          fontFamily: 'Monsterrat',
        ),
      ),
    ),
  );
}
