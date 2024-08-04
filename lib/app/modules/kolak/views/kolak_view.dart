import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../routes/app_pages.dart';

import 'package:get/get.dart';

import '../controllers/kolak_controller.dart';

class KolakView extends GetView<KolakController> {
  const KolakView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: 1.sw,
          height: 1.sh,
          decoration: BoxDecoration(
            color: const Color(0xffF2E9C8).withOpacity(0.5),
          ),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 1.sw,
                  height: 240.h,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(40),
                      bottomRight: Radius.circular(40),
                    ),
                    color: const Color(0xff2D9F76).withOpacity(0.8),
                  ),
                  child: Column(
                    children: [
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
                      Row(
                        children: [
                          35.horizontalSpace,
                          GestureDetector(
                            onTap: () {
                              Get.back();
                            },
                            child: Image.asset(
                              'assets/images/arrow_back.png',
                            ),
                          ),
                          45.horizontalSpace,
                          Text(
                            "Explore More Promo",
                            style: TextStyle(
                              fontFamily: 'JejuGothic',
                              fontSize: 24.sp,
                              color: const Color(0xffDCE3D9),
                            ),
                          ),
                        ],
                      ),
                      42.verticalSpace,
                      Container(
                        alignment: Alignment.centerLeft,
                        width: 260.w,
                        height: 46.h,
                        decoration: const BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Color(0x29000000),
                              offset: Offset(0, 4),
                              blurRadius: 4,
                            ),
                          ],
                          borderRadius: BorderRadius.all(
                            Radius.circular(40),
                          ),
                          color: Color(0xffFFFFFF),
                        ),
                        child: Image.asset(
                          'assets/images/icon_search_2.png',
                          width: 24.w,
                        ).paddingSymmetric(horizontal: 23.w, vertical: 10.h),
                      ),
                    ],
                  ),
                ),
                20.verticalSpace,
                Stack(
                  children: [
                    Center(
                      child: Container(
                        width: 357.w,
                        height: 720.h,
                        decoration: const BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Color(0x29000000),
                              offset: Offset(0, 4),
                              blurRadius: 4,
                            ),
                          ],
                          borderRadius: BorderRadius.all(
                            Radius.circular(40),
                          ),
                          color: Color(0xffF0F3EF),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.asset(
                              'assets/images/img_card_kolak.png',
                              width: 307.w,
                              height: 244.h,
                            ).paddingOnly(top: 54.h, left: 25.w, right: 25.w),
                            Text(
                              "KoLaK",
                              style: TextStyle(
                                fontFamily: 'JosefinSans',
                                fontSize: 30.sp,
                                color: const Color(0xff000000),
                                shadows: [
                                  Shadow(
                                    color: const Color(0xff000000)
                                        .withOpacity(0.25),
                                    offset: const Offset(0, 3),
                                    blurRadius: 4,
                                  ),
                                ],
                              ),
                            ).paddingOnly(top: 60.h, left: 41.w),
                            RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text:
                                        "Sobat KawAll, kira-kira KoLak tuh apa ya?? Nah, buat kalian yang belum tahu KoLak itu singkatan ",
                                    style: TextStyle(
                                      fontFamily: 'JosefinSans',
                                      fontSize: 16.sp,
                                      color: const Color(0xff000000),
                                    ),
                                  ),
                                  TextSpan(
                                    text: "Konseling seharga Ayam Geprek",
                                    style: TextStyle(
                                      fontFamily: 'JosefinSans',
                                      fontSize: 16.sp,
                                      color: const Color(0xffB6411C),
                                    ),
                                  ),
                                  TextSpan(
                                    text:
                                        ". Yup, hanya dengan modal 25k rupiah kalian dapat mendapatkan pengalaman konseling yang bermutu loh. Kami mengerti bahwa konseling kadang menguras dompet kalian, maka dari itu yuk claim voucher kalian! Mental sehat, uang hemat!",
                                    style: TextStyle(
                                      fontFamily: 'JosefinSans',
                                      fontSize: 16.sp,
                                      color: const Color(0xff000000),
                                    ),
                                  ),
                                ],
                              ),
                            ).paddingOnly(
                              left: 41.w,
                              right: 41.w,
                              top: 15.h,
                              bottom: 20.h,
                            ),
                            Align(
                              alignment: Alignment.centerRight,
                              child: GestureDetector(
                                onTap: () => Get.toNamed(Routes.COMING_SOON),
                              child: Container(
                                alignment: Alignment.center,
                                width: 115.w,
                                height: 35.h,
                                decoration: const BoxDecoration(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(40),
                                  ),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Color(0x29000000),
                                      offset: Offset(0, 4),
                                      blurRadius: 4,
                                    ),
                                  ],
                                  color: Color(0xffFFFFFF),
                                ),
                                child: Text(
                                  "Gunakan",
                                  style: TextStyle(
                                    fontFamily: 'JosefinSans',
                                    fontSize: 18.sp,
                                    color: const Color(0xffEC9F87),
                                  ),
                                ),
                              ).paddingOnly(right: 23.w),
                            ),
                            ),
                          ],
                        ),
                      ).paddingOnly(bottom: 50.h),
                    ),
                    Positioned(
                      top: 655.h,
                      left: 40.w,
                      child: Image.asset(
                        'assets/images/maskot2.png',
                        width: 129.w,
                        height: 108.h,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
