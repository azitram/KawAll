import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:kaw_all/app/modules/course/views/course_view.dart';
import 'package:kaw_all/app/modules/mentimeter/views/mentimeter_view.dart';
import 'package:kaw_all/app/utils/auth.dart';

import '../../dashboard/views/dashboard_view.dart';

class NavigationBarController extends GetxController {
  final selectedIndex = 0.obs;
  final List<Widget> widgetOptions = [
    const DashboardView(),
    const MentimeterView(),
    const CourseView(),
    TextButton(
        onPressed: () {
          Authentication.signOut();
        },
        child: const Text('Logout'))
  ];

  @override
  void onInit() async {
    super.onInit();
    FlutterNativeSplash.remove();
  }
}
