import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

import 'package:google_nav_bar/google_nav_bar.dart';

import '../controllers/navigation_bar_controller.dart';

class NavigationBarView extends GetView<NavigationBarController> {
  const NavigationBarView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Obx(() {
        return Center(
          child: controller.widgetOptions
              .elementAt(controller.selectedIndex.value),
        );
      }),
      bottomNavigationBar: Obx(() {
        return Container(
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                blurRadius: 20,
                color: Colors.black.withOpacity(.1),
              )
            ],
          ),
          child: SafeArea(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
              child: GNav(
                rippleColor: Colors.grey[300]!,
                hoverColor: Colors.grey[100]!,
                gap: 8.w,
                activeColor: Colors.black,
                iconSize: 24,
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                duration: const Duration(milliseconds: 400),
                tabBackgroundColor: Colors.grey[100]!,
                color: Colors.black,
                tabs: const [
                  GButton(
                    icon: Icons.home,
                    iconColor: Color(0xff5B6656),
                    text: 'Home',
                  ),
                  GButton(
                    icon: Icons.add_road_outlined,
                    iconColor: Color(0xff5B6656),
                    text: 'KawAll Zone',
                  ),
                  GButton(
                    icon: Icons.search_rounded,
                    iconColor: Color(0xff5B6656),
                    text: 'Cari Tahu',
                  ),
                  GButton(
                    icon: Icons.volume_down_rounded,
                    iconColor: Color(0xff5B6656),
                    text: 'Profile',
                  ),
                ],
                selectedIndex: controller.selectedIndex.value,
                onTabChange: (index) {
                  controller.selectedIndex.value = index;
                },
              ),
            ),
          ),
        );
      }),
    );
  }
}
