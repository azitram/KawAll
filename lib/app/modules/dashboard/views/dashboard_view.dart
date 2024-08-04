import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../routes/app_pages.dart';
import '../../../utils/color.dart';
import '../../fake_call/fake_call_menu/fake_call_menu_page.dart';
import '../controllers/dashboard_controller.dart';

class DashboardView extends GetView<DashboardController> {
  const DashboardView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark.copyWith(
      statusBarColor: statusBarColor,
    ));
    return Scaffold(
      backgroundColor: const Color(0xffF7F6F6),
      body: SafeArea(
        child: Stack(
          children: [
            Image.asset(
              "assets/images/homescreen_bg.png",
              fit: BoxFit.fill,
              height: double.infinity,
              width: double.infinity,
              alignment: Alignment.center,
            ),
            SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    children: [
                      Container(
                        width: 1.sw,
                        height: 265.h,
                        decoration: BoxDecoration(
                          color: const Color(0xffEFCABE),
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(40.r),
                            bottomRight: Radius.circular(40.r),
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.topRight,
                        child: Image.asset(
                          'assets/images/item_background_dashboard.png',
                          fit: BoxFit.fill,
                          width: 360.w,
                          height: 268.h,
                        ),
                      ),
                      // AppBar Section
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Image.asset(
                            'assets/images/maskot_dashboard.png',
                            width: 91.w,
                            height: 145.h,
                          ).paddingOnly(top: 64.h, left: 30.w),
                          30.horizontalSpace,
                          GestureDetector(
                            onTap: () => launchUrl(
                              Uri.parse("https://74eiy4z0wez.typeform.com/to/Lbm0P2oW"),
                            ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              70.verticalSpace,
                              Obx(() {
                                return Text(
                                  "Hi, ${controller.nama.value}!\nHow are you?",
                                  style: TextStyle(
                                    fontSize: 24.sp,
                                    fontFamily: 'Montserrat',
                                  ),
                                );
                              }),
                              15.verticalSpace,
                              Text(
                                "Take our quiz here to express\nyourself!",
                                style: TextStyle(
                                  fontSize: 10.sp,
                                  fontFamily: 'Montserrat',
                                  fontWeight: FontWeight.bold,
                                  color: const Color(0xffB6411C),
                                ),
                              ),
                              10.verticalSpace,
                              Image.asset(
                                'assets/images/arrow.png',
                                width: 36.w,
                                height: 20.h,
                              ),
                            ],
                          ),),
                        ],
                      ),
                    ],
                  ),
                  15.verticalSpace,
                  Text(
                    "Jalan Yuk",
                    style: TextStyle(
                      color: const Color(0xffA14D4D),
                      fontSize: 20.sp,
                      fontFamily: 'JosefinSans',
                      shadows: [
                        Shadow(
                          color: Colors.grey.withOpacity(0.5),
                          offset: const Offset(1, 2),
                          blurRadius: 4,
                        ),
                      ],
                    ),
                  ).paddingOnly(left: 36.w, bottom: 10.h),
                  SizedBox(
                    height: 150.h,
                     child: PageView(
                      scrollDirection: Axis.vertical,
                      children: [
                        GestureDetector(
                          onTap: (){
                            Get.to(const FakeCallMenu());
                          },
                        child: Container(
                          width: 370.w,
                          height: 138.h,
                          decoration: BoxDecoration(
                            color: const Color(0xffDBEAD5),
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
                          child: Row(
                            children: [
                              Container(
                                width: 100.w,
                                height: 107.h,
                                decoration: BoxDecoration(
                                  color: const Color(0xffD9D9D9),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.5),
                                      spreadRadius: 0,
                                      blurRadius: 4,
                                      offset: const Offset(2, 4),
                                    ),
                                  ],
                                ),
                                child: Align(
                                  alignment: Alignment.center,
                                  child: Image.asset(
                                    'assets/images/call_dashboard.png',
                                    width: 78.w,
                                    height: 78.h,
                                  ),
                                ),
                              ).paddingSymmetric(
                                  horizontal: 23.w, vertical: 19.h),
                              Flexible(
                                child: const Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Text(
                                      "Mau jalan sendirian tapi takut?",
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontFamily: 'JosefinSans',
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      "Yuk kami temani!",
                                      style: TextStyle(
                                        fontSize: 10,
                                        fontFamily: 'JosefinSans',
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ).paddingOnly(
                                  top: 10,
                                  right: 59.w,
                                ),
                              ),
                               Container(
                                child: Image.asset('assets/images/dot_first.png'),
                              ).paddingOnly(right: 20.w,),
                            ],
                          ),
                        ).paddingOnly(left: 16.w, right: 16.w, bottom: 16.h),
                      ),
                       GestureDetector(
                         onTap: () => launchUrl(
                           Uri.parse("https://app.sli.do/event/sbYeqP86DZudiZKcQ1Qqkr/live/polls"),
                         ),
                        child: Container(
                          width: 370.w,
                          height: 138.h,
                          decoration: BoxDecoration(
                            color: const Color(0xffBDE0A7),
                            borderRadius: BorderRadius.circular(20.r),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.25),
                                spreadRadius: 0,
                                blurRadius: 4,
                                offset: const Offset(1, 4),
                              ),
                            ],
                          ),
                          child: Container(
                            width: 328.w,
                            height: 130.h,
                            decoration: BoxDecoration(
                              color: const Color(0xffF7F7F7),
                              borderRadius: BorderRadius.circular(25),
                              boxShadow: [
                                BoxShadow(
                                  color:
                                      const Color(0xff000000).withOpacity(0.25),
                                  spreadRadius: 0,
                                  blurRadius: 2,
                                  offset: const Offset(
                                      0, 2), // changes position of shadow
                                ),
                              ],
                            ),
                            child: Row(
                              children: [
                                Expanded(
                                  flex: 1,
                                  child: Container(
                                    padding: const EdgeInsets.all(10),
                                    decoration: const BoxDecoration(
                                      color: Color(0xffACBCA5),
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(25),
                                        bottomLeft: Radius.circular(25),
                                      ),
                                    ),
                                    child: Image.asset(
                                      'assets/images/img_card_daerah_rawan.png',
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 2,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      10.verticalSpace,
                                      Text(
                                        "Tau daerah yang rawan? Share it here!",
                                        style: TextStyle(
                                          fontFamily: 'JosefinSans',
                                          fontSize: 14.sp,
                                        ),
                                      ),
                                    ],
                                  ).paddingOnly(
                                    top: 10.h,
                                    bottom: 10.h,
                                    left: 15.w,
                                    right: 20.w,
                                  ),
                                ),
                                Container(
                                  child: Image.asset('assets/images/dot_middle.png'),
                                ).paddingOnly(right: 20.w,),
                              ],
                            ),
                          ).paddingAll(15.w),
                        ).paddingOnly(left: 16.w, right: 16.w, bottom: 16.h),
                        ),
                        GestureDetector(
                          onTap: () => Get.toNamed(Routes.PELAPORAN),
                        child: Container(
                          width: 370.w,
                          height: 138.h,
                          decoration: BoxDecoration(
                            color: const Color(0xffF2C2B3),
                            borderRadius: BorderRadius.circular(20.r),
                            boxShadow: const [
                              BoxShadow(
                                color: Colors.black38,
                                spreadRadius: 0,
                                blurRadius: 4,
                                offset: Offset(1, 4),
                              ),
                            ],
                          ),
                          child: Container(
                            width: 328.w,
                            height: 130.h,
                            decoration: BoxDecoration(
                              color: const Color(0xffF7F7F7),
                              borderRadius: BorderRadius.circular(25),
                              boxShadow: [
                                BoxShadow(
                                  color:
                                      const Color(0xff000000).withOpacity(0.25),
                                  spreadRadius: 0,
                                  blurRadius: 2,
                                  offset: const Offset(
                                      0, 2), // changes position of shadow
                                ),
                              ],
                            ),
                            child: Row(
                              children: [
                                Expanded(
                                  flex: 1,
                                  child: Container(
                                    padding: const EdgeInsets.all(10),
                                    decoration: const BoxDecoration(
                                      color: Color(0xffEC9F87),
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(25),
                                        bottomLeft: Radius.circular(25),
                                      ),
                                    ),
                                    child: Image.asset(
                                      'assets/images/img_card_berani_melapor.png',
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 2,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      10.verticalSpace,
                                      Text(
                                        "Experiencing something weird? Yuk Lapor!!",
                                        style: TextStyle(
                                          fontFamily: 'JosefinSans',
                                          fontSize: 14.sp,
                                        ),
                                      ),
                                    ],
                                  ).paddingOnly(
                                    top: 10.h,
                                    bottom: 10.h,
                                    left: 15.w,
                                    right: 20.w,
                                  ),
                                ),
                                Container(
                                  child: Image.asset('assets/images/dot_last.png'),
                                ).paddingOnly(right: 20.w,),
                              ],
                            ),
                          ).paddingAll(15.w),
                        ).paddingOnly(right: 16.w, left: 16.w, bottom: 10.h),
                      ),
                      ],
                    ),
                  ),
                  Text(
                    "Konseling",
                    style: TextStyle(
                      color: const Color(0xffA14D4D),
                      fontSize: 20.sp,
                      fontFamily: 'JosefinSans',
                      shadows: [
                        Shadow(
                          color: Colors.grey.withOpacity(0.5),
                          offset: const Offset(1, 2),
                          blurRadius: 4,
                        ),
                      ],
                    ),
                  ).paddingOnly(left: 36.w, top: 10.h, bottom: 5.h),
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      Image.asset(
                        'assets/images/konseling_card.png',
                        width: 1.sw,
                        height: 200.h,
                      ).paddingOnly(bottom: 10.h),
                      Column(
                        children: [
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xffA14D4D),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30.r),
                              ),
                              padding: EdgeInsets.symmetric(
                                horizontal: 30.w,
                                vertical: 15.h,
                              ),
                              minimumSize: Size(200.w, 33.h),
                            ),
                            onPressed: () {
                              Get.toNamed(Routes.PILIH_PSIKOLOG);
                            },
                            child: const Text(
                              "Lihat List Psikolog",
                              style: TextStyle(
                                fontFamily: 'JosefinSans',
                                color: Color(0xFFFFFFFF),
                              ),
                            ),
                          ).paddingOnly(left: 36.w),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xffA14D4D),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30.r),
                              ),
                              padding: EdgeInsets.symmetric(
                                horizontal: 30.w,
                                vertical: 15.h,
                              ),
                              minimumSize: Size(200.w, 33.h),
                            ),
                            onPressed: () {
                              Get.toNamed(Routes.PROFILE_RELAWAN);
                            },
                            child: const Text(
                              "Lihat Konselor Relawan",
                              style: TextStyle(
                                fontFamily: 'JosefinSans',
                                color: Color(0xFFFFFFFF),
                              ),
                            ),
                          ).paddingOnly(left: 36.w),
                        ],
                      ).paddingOnly(top: 10.h),
                    ],
                  ),
                  Text(
                    "What's New?",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20.sp,
                      fontFamily: 'JosefinSans',
                      shadows: [
                        Shadow(
                          color: Colors.grey.withOpacity(0.5),
                          offset: const Offset(1, 2),
                          blurRadius: 4,
                        ),
                      ],
                    ),
                  ).paddingOnly(top: 20.h, left: 36.w, bottom: 10.h),
                  SizedBox(
                    height: 160.h,
                    width: 1.sw,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: controller.whatsNewList.length,
                      padding: EdgeInsets.symmetric(horizontal: 20.w),
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            Get.toNamed(
                              controller.whatsNewList[index]['onTap'],
                            );
                          },
                          child: Container(
                            width: 120.w,
                            height: 150.h,
                            decoration: BoxDecoration(
                              color: controller.whatsNewList[index]['bgColor'],
                              borderRadius: BorderRadius.circular(30.r),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 0,
                                  blurRadius: 4,
                                  offset: const Offset(2, 4),
                                ),
                              ],
                            ),
                            child: Stack(
                              alignment: Alignment.center,
                              children: [
                                Align(
                                  alignment: Alignment.bottomCenter,
                                  child: Image.asset(
                                    controller.whatsNewList[index]['image']
                                        .toString(),
                                    height: 88.h,
                                  ),
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      controller.whatsNewList[index]['title']
                                          .toString(),
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: controller.whatsNewList[index]
                                        ['titleColor'],
                                        fontSize: 14.sp,
                                        fontFamily: 'JosefinSans',
                                      ),
                                    ).paddingOnly(top: 15.h, bottom: 7.h),
                                    Text(
                                      controller.whatsNewList[index]
                                      ['description']
                                          .toString(),
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: controller.whatsNewList[index]
                                        ['descColor'],
                                        fontSize: 8.sp,
                                        fontFamily: 'JosefinSans',
                                      ),
                                    ).paddingOnly(
                                        bottom: 15.h, left: 10.w, right: 10.w),
                                  ],
                                ),
                              ],
                            ),
                          ).paddingOnly(right: 10.w, bottom: 10.h),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}