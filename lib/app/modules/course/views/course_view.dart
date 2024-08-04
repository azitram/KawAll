import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../routes/app_pages.dart';
import '../../../utils/color.dart';
import '../controllers/course_controller.dart';

class CourseView extends GetView<CourseController> {
  const CourseView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark.copyWith(
      statusBarColor: statusBarColor,
    ));
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: 1.sw,
          height: 1.sh,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/background_course.png'),
              fit: BoxFit.fill,
            ),
          ),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // AppBar Section
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
                ).paddingSymmetric(horizontal: 12.w, vertical: 14.h),
                Center(
                  child: Container(
                    width: 381.w,
                    height: 178.h,
                    decoration: BoxDecoration(
                      color: const Color(0xffAFC5A5),
                      borderRadius: BorderRadius.circular(20.r),
                      boxShadow: [
                        BoxShadow(
                          color: const Color(0xff000000).withOpacity(0.25),
                          offset: const Offset(2, 4),
                          blurRadius: 4.r,
                        ),
                      ],
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "What Course Do You Wanna Take?",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 24.sp,
                            fontFamily: 'JosefinSans',
                          ),
                        ).paddingOnly(bottom: 18.h, left: 36.w, right: 36.w),
                        Container(
                          width: 1.sw,
                          height: 46.h,
                          decoration: BoxDecoration(
                            color: const Color(0xffFFFFFF),
                            borderRadius: BorderRadius.circular(50.r),
                            boxShadow: [
                              BoxShadow(
                                color:
                                const Color(0xff000000).withOpacity(0.25),
                                offset: const Offset(1, 1),
                                blurRadius: 2.r,
                              ),
                            ],
                          ),
                          child: Row(
                            children: [
                              const Icon(
                                Icons.search,
                                color: Color.fromARGB(255, 172, 162, 162),
                              ).paddingOnly(left: 16.w),
                              Text(
                                "Search Course",
                                style: TextStyle(
                                  color:
                                  const Color.fromARGB(255, 172, 162, 162),
                                  fontSize: 16.sp,
                                  fontFamily: 'JosefinSans',
                                ),
                              ).paddingOnly(left: 10.w),
                            ],
                          ),
                        ).paddingOnly(left: 36.w, right: 36.w),
                      ],
                    ),
                  ),
                ),
                30.verticalSpace,
                Text(
                  "Popular Course",
                  style: TextStyle(
                    fontSize: 20.sp,
                    fontFamily: 'JosefinSans',
                    shadows: [
                      Shadow(
                        color: const Color(0xff000000).withOpacity(0.25),
                        offset: const Offset(1, 2),
                        blurRadius: 4.r,
                      ),
                    ],
                  ),
                ).paddingOnly(left: 36.w, bottom: 15.h),
                SizedBox(
                  width: 1.sw,
                  height: 200.h,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: controller.courseList.length,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          Get.to(controller.courseList[index]['page']);
                        },
                        child: Container(
                          padding: EdgeInsets.only(left: 10.w, right: 10.w),
                          width: 130.w,
                          height: 159.h,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage(
                                controller.courseList[index]['courseBackground']
                                    .toString(),
                              ),
                              fit: BoxFit.fill,
                            ),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                controller.courseList[index]['courseTitle']
                                    .toString(),
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 12,
                                  fontFamily: 'JosefinSans',
                                  shadows: [
                                    Shadow(
                                      color: const Color(0xff000000)
                                          .withOpacity(0.25),
                                      offset: const Offset(1, 2),
                                      blurRadius: 4,
                                    ),
                                  ],
                                ),
                              ).paddingOnly(left: 15.w, right: 30.w),
                              Image.asset(
                                controller.courseList[index]['courseIcon']
                                    .toString(),
                                height: 110.h,
                              ).paddingOnly(top: 10.h),
                            ],
                          ),
                        ).paddingOnly(left: 5.w, right: 5.w),
                      );
                    },
                  ),
                ).paddingOnly(left: 10.w, right: 10.w, bottom: 15.h),
                Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    "Konten Interaktif",
                    style: TextStyle(
                      color: const Color(0xffA14D4D),
                      fontSize: 20.sp,
                      fontFamily: 'JosefinSans',
                      shadows: [
                        Shadow(
                          color: const Color(0xff000000).withOpacity(0.25),
                          offset: const Offset(1, 2),
                          blurRadius: 4.r,
                        ),
                      ],
                    ),
                  ).paddingOnly(
                      left: 30.w, right: 30.w, top: 5.h, bottom: 15.h),
                ),
                Center(
                  child: SizedBox(
                    height: 250.h,
                    child: PageView(
                      scrollDirection: Axis.vertical,
                      children: [
                        GestureDetector(
                          onTap: () => launchUrl(
                            Uri.parse("https://youtu.be/k9Jn0eP-ZVg"),
                          ),
                          child: Container(
                            width: 370.w,
                            height: 138.h,
                            decoration: BoxDecoration(
                              color: const Color(0xffF5C3B3),
                              borderRadius: BorderRadius.circular(20.r),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 0,
                                  blurRadius: 4,
                                  offset: const Offset(1, 4),
                                ),
                              ],
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Ingin tahu cara meng-smackdown predator? \nYuk kita simak video di bawah!",
                                  style: TextStyle(
                                    color: const Color(0xffB6411C),
                                    fontSize: 12.sp,
                                    fontFamily: 'JosefinSans',
                                  ),
                                ).paddingOnly(left: 36.w, right: 36.w, top: 18.h),
                                FittedBox(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Image.asset(
                                        "assets/images/thumbnail_self_defense.png",
                                        height: 120.w,
                                      ).paddingOnly(right: 20.w),
                                      Image.asset(
                                        "assets/images/maskot_dashboard.png",
                                        width: 59.w,
                                      ).paddingOnly(right: 14.w),
                                      Image.asset(
                                        "assets/images/dot_first.png",
                                        width: 10.w,
                                      ).paddingOnly(right: 7.w),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ).paddingOnly(left: 16.w, right: 16.w, bottom: 16.h),
                        ),
                        GestureDetector(
                          onTap: () => launchUrl(
                            Uri.parse("https://youtu.be/_PfI26tytPI"),
                          ),
                          child: Container(
                            width: 370.w,
                            height: 138.h,
                            decoration: BoxDecoration(
                              color: const Color(0xffDCE3D9),
                              borderRadius: BorderRadius.circular(20.r),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 0,
                                  blurRadius: 4,
                                  offset: const Offset(1, 4),
                                ),
                              ],
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Mungkinkah laki-laki jadi korban pelecehan? Eits, mending tonton video ini dulu deh!",
                                  style: TextStyle(
                                    color: const Color(0xff8D9688),
                                    fontSize: 12.sp,
                                    fontFamily: 'JosefinSans',
                                  ),
                                ).paddingOnly(left: 36.w, right: 36.w, top: 18.h),
                                FittedBox(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Image.asset(
                                        "assets/images/thumbnail_mitos_fakta.png",
                                        height: 120.w,
                                      ).paddingOnly(right: 20.w),
                                      Image.asset(
                                        "assets/images/maskot_ngumpet.png",
                                        width: 59.w,
                                      ).paddingOnly(right: 14.w),
                                      Image.asset(
                                        "assets/images/dot_middle.png",
                                        width: 10.w,
                                      ).paddingOnly(right: 7.w),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ).paddingOnly(left: 16.w, right: 16.w, bottom: 16.h),
                        ),
                        GestureDetector(
                          onTap: () => launchUrl(
                            Uri.parse("https://youtu.be/s0l25LNmYT8"),
                          ),
                          child: Container(
                            width: 370.w,
                            height: 138.h,
                            decoration: BoxDecoration(
                              color: const Color(0xffF2E9C8),
                              borderRadius: BorderRadius.circular(20.r),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 0,
                                  blurRadius: 4,
                                  offset: const Offset(1, 4),
                                ),
                              ],
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Gimana sih, cara melatih response dalam menghadapi situasi mengagetkan seperti pelecehan? Check this out!",
                                  style: TextStyle(
                                    color: const Color(0xffAB9445),
                                    fontSize: 12.sp,
                                    fontFamily: 'JosefinSans',
                                  ),
                                ).paddingOnly(left: 36.w, right: 36.w, top: 18.h),
                                FittedBox(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Image.asset(
                                        "assets/images/thumbnail_freeze_response.png",
                                        height: 120.w,
                                      ).paddingOnly(right: 20.w),
                                      Image.asset(
                                        "assets/images/maskot_freeze.png",
                                        width: 59.w,
                                      ).paddingOnly(right: 14.w),
                                      Image.asset(
                                        "assets/images/dot_last.png",
                                        width: 10.w,
                                      ).paddingOnly(right: 7.w),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ).paddingOnly(left: 16.w, right: 16.w, bottom: 16.h),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 15.h,
                ),
                Stack(
                  children: [
                    Align(
                      alignment: Alignment.centerRight,
                      child: Container(
                        width: 300.w,
                        height: 130.h,
                        decoration: BoxDecoration(
                          color: const Color(0xffF2E3D0),
                          borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(20),
                              bottomLeft: Radius.circular(20)),
                          boxShadow: [
                            BoxShadow(
                              color: const Color(0xff000000).withOpacity(0.25),
                              offset: const Offset(2, 4),
                              blurRadius: 4.r,
                            ),
                          ],
                        ),
                      ),
                    ),
                    Image.asset(
                      "assets/images/img_course_konsul.png",
                      height: 195.h,
                    ).paddingOnly(left: 95.w),
                    GestureDetector(
                      onTap: () {
                        Get.toNamed(Routes.PROFILE_DOKTER);
                      },
                      child: FittedBox(
                        child: Row(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Dok, jadi gini...",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 20.sp,
                                    fontFamily: 'JosefinSans',
                                    shadows: [
                                      Shadow(
                                        color: const Color(0xff000000)
                                            .withOpacity(0.25),
                                        offset: const Offset(1, 2),
                                        blurRadius: 4.r,
                                      ),
                                    ],
                                  ),
                                ).paddingOnly(top: 30.h, bottom: 16.h),
                                Text(
                                  "Dari pada bingung, yuk tanya\nlangsung ke ahlinya!",
                                  style: TextStyle(
                                    color: const Color(0xffB6411C),
                                    fontSize: 10.sp,
                                    fontFamily: 'JosefinSans',
                                  ),
                                ),
                              ],
                            ),
                            Image.asset(
                              "assets/images/arrow_2.png",
                            ).paddingOnly(top: 30.h, left: 10.w),
                          ],
                        ).paddingOnly(left: 215.w),
                      ),
                    ),
                  ],
                ).paddingOnly(bottom: 5.h),
              ],
            ),
          ),
        ),
      ),
    );
  }
}