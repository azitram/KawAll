import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:kaw_all/app/modules/order_history/views/order_history_view.dart';

import '../../kolak/views/kolak_view.dart';
import '../../panas/views/panas_view.dart';
import '../controllers/mentimeter_controller.dart';

class MentimeterView extends GetView<MentimeterController> {
  const MentimeterView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: 1.sw,
          height: 1.sh,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/background_mentimeter.png'),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            children: [
              Stack(
                children: [
                  Container(
                    width: 1.sw,
                    height: 250.h,
                    decoration: BoxDecoration(
                      color: const Color(0xffE7D69C),
                      borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(40),
                        bottomRight: Radius.circular(40),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: const Color(0xff000000).withOpacity(0.25),
                          spreadRadius: 0,
                          blurRadius: 4,
                          offset:
                              const Offset(0, 2), // changes position of shadow
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
                        Center(
                          child: Text(
                            "Scroll down for promos!",
                            style: TextStyle(
                              fontFamily: 'JosefinSans',
                              fontSize: 20.sp,
                              fontWeight: FontWeight.bold,
                              color: const Color(0xffD80000),
                              shadows: [
                                Shadow(
                                  color: const Color(0xff000000)
                                      .withOpacity(0.25),
                                  offset: const Offset(1, 3),
                                  blurRadius: 4,
                                ),
                              ],
                            ),
                          ),
                        ),
                        const Spacer(),
                        SizedBox(
                          height: 120.w,
                          width: 330.w,
                          child: PageView(
                            scrollDirection: Axis.vertical,
                            children: [
                              GestureDetector(
                                onTap: (){
                                  Get.to(const PanasView());
                                },
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
                                        flex: 2,
                                        child: Container(
                                          decoration: const BoxDecoration(
                                            color: Color(0xffEEBBB0),
                                            borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(25),
                                              bottomLeft: Radius.circular(25),
                                            ),
                                          ),
                                          child: Center(
                                            child: Text(
                                                "PaNas",
                                              style: TextStyle(
                                              fontFamily: 'JosefinSans',
                                              fontSize: 30.sp,
                                              fontWeight: FontWeight.bold,
                                              color: const Color(0xffD80000),
                                              shadows: [
                                                Shadow(
                                                  color: const Color(0xff000000)
                                                      .withOpacity(0.25),
                                                  offset: const Offset(1, 3),
                                                  blurRadius: 4,
                                                ),
                                              ],
                                            ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        flex: 2,
                                        child: FittedBox(
                                          child: Row(
                                            crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                "Paket\nNanya\nSepuasnya!",
                                                style: TextStyle(
                                                  fontFamily: 'JosefinSans',
                                                  fontSize: 20.sp,
                                                  fontWeight: FontWeight.bold,
                                                  shadows: [
                                                    Shadow(
                                                      color: const Color(0xff000000)
                                                          .withOpacity(0.25),
                                                      offset: const Offset(1, 3),
                                                      blurRadius: 4,
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              5.verticalSpace,
                                              Image.asset(
                                                'assets/images/panas_figure.png',
                                                width: 70.w,
                                              ),
                                            ],
                                          ).paddingOnly(
                                            top: 10.h,
                                            bottom: 10.h,
                                            left: 15.w,
                                            right: 25.w,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              GestureDetector(
                                onTap: (){
                                  Get.to(const KolakView());
                                },
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
                                        flex: 2,
                                        child: Container(
                                          decoration: const BoxDecoration(
                                            color: Color(0xffEDC741),
                                            borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(25),
                                              bottomLeft: Radius.circular(25),
                                            ),
                                          ),
                                          child: Center(
                                            child: Text(
                                              "Konseling Harga Ayam Geprek",
                                              style: TextStyle(
                                                fontFamily: 'JosefinSans',
                                                fontSize: 17.sp,
                                                fontWeight: FontWeight.bold,
                                                color: const Color(0xffFFFEFD),
                                                shadows: [
                                                  Shadow(
                                                    color: const Color(0xff000000)
                                                        .withOpacity(0.25),
                                                    offset: const Offset(1, 3),
                                                    blurRadius: 4,
                                                  ),
                                                ],
                                              ),
                                            ).paddingOnly(left: 10.w, top: 10.w, bottom: 10.w),
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        flex: 2,
                                        child: FittedBox(
                                          child: Row(
                                            crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                            children: [
                                              Column(
                                                children: [
                                                  Text(
                                                    "25k",
                                                    style: TextStyle(
                                                      fontFamily: 'JosefinSans',
                                                      fontSize: 50.sp,
                                                      fontWeight: FontWeight.bold,
                                                      color: const Color(0xffF90000),
                                                      shadows: [
                                                        Shadow(
                                                          color: const Color(0xff000000)
                                                              .withOpacity(0.25),
                                                          offset: const Offset(1, 3),
                                                          blurRadius: 4,
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  Text(
                                                    "kolAK",
                                                    style: TextStyle(
                                                      fontFamily: 'JosefinSans',
                                                      fontSize: 14.sp,
                                                      fontWeight: FontWeight.bold,
                                                      shadows: [
                                                        Shadow(
                                                          color: const Color(0xff000000)
                                                              .withOpacity(0.25),
                                                          offset: const Offset(1, 3),
                                                          blurRadius: 4,
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              5.verticalSpace,
                                              Image.asset(
                                                'assets/images/kolak_figure.png',
                                                width: 70.w,
                                              ),
                                            ],
                                          ).paddingOnly(
                                            top: 10.h,
                                            bottom: 10.h,
                                            left: 15.w,
                                            right: 25.w,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const Spacer(),
                      ],
                    ),
                  ),
                ],
              ),
              const Spacer(),
              Text(
                "Rate Your Experience!",
                style: TextStyle(
                  fontFamily: 'JosefinSans',
                  fontSize: 20.sp,
                  fontWeight: FontWeight.bold,
                  color: const Color(0xffFFFFFF),
                  shadows: [
                    Shadow(
                      color: const Color(0xff000000)
                          .withOpacity(0.25),
                      offset: const Offset(1, 3),
                      blurRadius: 4,
                    ),
                  ],
                ),
              ).paddingOnly(left: 10.w),
              const Spacer(),
              Container(
                  width: 355.w,
                  height: 235.h,
                  decoration: BoxDecoration(
                    color: const Color(0xffF7F7F7),
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: ClipRRect(
                          borderRadius: const BorderRadius.only(
                            bottomLeft: Radius.circular(25),
                            bottomRight: Radius.circular(25),
                            topRight: Radius.circular(25),
                            topLeft: Radius.circular(25),
                          ),
                          child: Image.asset(
                            'assets/images/review_prev.png',
                            width: 370.w,
                            height: 180.h,
                            fit: BoxFit.fill,
                          ),
                        ),
                ),
              const Spacer(),
              Stack(
                children: [
                  Container(
                    width: 1.sw,
                    height: 180.h,
                    decoration: BoxDecoration(
                      color: const Color(0xffD8E6D2),
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(40),
                        topRight: Radius.circular(40),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: const Color(0xff000000).withOpacity(0.25),
                          spreadRadius: 0,
                          blurRadius: 4,
                          offset: const Offset(0, 2), // changes position of shadow
                        ),
                      ],
                    ),
                  ),
                  Center(
                    child: Container(
                      width: 350.w,
                      height: 60.h,
                      decoration: BoxDecoration(
                        color: const Color(0xffED9478),
                        borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(25),
                            bottomLeft: Radius.circular(25),
                            bottomRight: Radius.circular(25),
                            topRight: Radius.circular(25),
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: const Color(0xff000000).withOpacity(0.25),
                            offset: const Offset(2, 4),
                            blurRadius: 4.r,
                          ),
                        ],
                      ),
                      child: GestureDetector(
                        onTap: (){
                          Get.to(const OrderHistoryView());
                        },
                        child: FittedBox(
                          child: Row(
                            children: [
                                Center(
                                  child: Text(
                                    "Tap Here For Full History",
                                    style: TextStyle(
                                      color: const Color(0xffFFFFFF),
                                      fontSize: 15.sp,
                                      fontFamily: 'JosefinSans',
                                      fontWeight: FontWeight.bold,
                                      shadows: [
                                        Shadow(
                                          color: const Color(0xff000000)
                                              .withOpacity(0.25),
                                          offset: const Offset(1, 2),
                                          blurRadius: 4.r,
                                        ),
                                      ],
                                    ),
                                  ).paddingOnly(left: 10.w),
                                ),
                              Image.asset(
                                "assets/images/arrow_2.png",
                              ).paddingOnly(top: 10.h, left: 20.w, right: 10.w,),
                            ],
                          ).paddingOnly(left: 2.w),
                        ),
                      ),
                    ).paddingOnly(top: 20.h,),
                  ).paddingOnly(top: 30.h,),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
