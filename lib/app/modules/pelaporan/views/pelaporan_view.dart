import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

import '../../../routes/app_pages.dart';
import '../controllers/pelaporan_controller.dart';

class PelaporanView extends GetView<PelaporanController> {
  const PelaporanView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: 1.sw,
          height: 1.sh,
          decoration: const BoxDecoration(
            color: Color(0xffE5EAE3),
          ),
          child: SingleChildScrollView(
            child: Stack(
              children: [
                Container(
                  width: 1.sw,
                  height: 266.h,
                  decoration: BoxDecoration(
                    color: const Color(0xffEFCABE),
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(40),
                      bottomRight: Radius.circular(40),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: const Color(0xff000000).withOpacity(0.25),
                        blurRadius: 4,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      // AppBar
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Image.asset(
                            'assets/images/logo.png',
                            width: 42.w,
                          ),
                          Row(
                            children: [
                              Image.asset(
                                'assets/images/icon_more_appbar.png',
                                width: 24.w,
                              ),
                              10.horizontalSpace,
                              Image.asset(
                                'assets/images/profile_picture.png',
                                width: 42.w,
                              ),
                            ],
                          ),
                        ],
                      ).paddingOnly(left: 12.w, right: 12.w, top: 12.h),
                      const Spacer(),
                      Text(
                        "Let's Fill this Out!",
                        style: TextStyle(
                          fontFamily: 'JosefinSans',
                          fontSize: 25.sp,
                          fontWeight: FontWeight.bold,
                          color: const Color(0xffA14D4D),
                          shadows: [
                            Shadow(
                              blurRadius: 4,
                              color: Colors.black.withOpacity(0.25),
                              offset: const Offset(0, 2),
                            ),
                          ],
                        ),
                      ),
                      const Spacer(),
                    ],
                  ),
                ),
                // Body Content
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Column(
                    children: [
                      CustomCard(
                        title: controller.listDataCard[0]["title"],
                        description: controller.listDataCard[0]["description"],
                        bgColor: controller.listDataCard[0]["bgColor"],
                      ),
                      CustomCard(
                        title: controller.listDataCard[1]["title"],
                        description: controller.listDataCard[1]["description"],
                        bgColor: controller.listDataCard[1]["bgColor"],
                      ),
                      CustomCard(
                        title: controller.listDataCard[2]["title"],
                        description: controller.listDataCard[2]["description"],
                        bgColor: controller.listDataCard[2]["bgColor"],
                      ),
                      CustomCard(
                        title: controller.listDataCard[3]["title"],
                        description: controller.listDataCard[3]["description"],
                        bgColor: controller.listDataCard[3]["bgColor"],
                      ),
                    ],
                  ),
                ).paddingOnly(top: 220.h),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CustomCard extends StatelessWidget {
  var title;
  var description;
  var bgColor;

  CustomCard({
    Key? key,
    this.title,
    this.description,
    this.bgColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 351.w,
      height: 260.h,
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: const BorderRadius.all(
          Radius.circular(40),
        ),
        boxShadow: [
          BoxShadow(
            color: const Color(0xff000000).withOpacity(0.25),
            blurRadius: 4,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            title,
            style: TextStyle(
              fontFamily: 'JosefinSans',
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: const Color(0xff585656),
              shadows: [
                Shadow(
                  blurRadius: 4,
                  color: Colors.black.withOpacity(0.25),
                  offset: const Offset(1, 2),
                ),
              ],
            ),
          ).paddingOnly(top: 20.h, left: 26.w),
          Text(
            description,
            style: const TextStyle(
              fontFamily: 'JosefinSans',
              fontSize: 16,
              color: Color(0xff585656),
            ),
          ).paddingOnly(left: 26.w, right: 16.w),
          Align(
            alignment: Alignment.centerRight,
            child: ElevatedButton(
              onPressed: () => Get.toNamed(Routes.COMING_SOON),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xffEC9F87),
                minimumSize: Size(106.w, 40.h),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50),
                ),
              ),
              child: const Text(
                "Pilih",
                style: TextStyle(
                  fontFamily: 'JosefinSans',
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ).paddingOnly(right: 26.w),
          ),
        ],
      ),
    ).paddingOnly(bottom: 20.h);
  }
}
