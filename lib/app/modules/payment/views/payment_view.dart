import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

import '../controllers/payment_controller.dart';

class PaymentView extends GetView<PaymentController> {
  const PaymentView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xffE7D69C),
        appBar: AppBar(
          title: const Text(
            'Pembayaran',
            style: TextStyle(
              color: Color(0xff5B6656),
              fontFamily: 'Montserrat',
              fontSize: 16,
              fontWeight: FontWeight.w700,
            ),
          ),
          backgroundColor: const Color(0xffD9D9D9),
          centerTitle: true,
          elevation: 1,
          leading: GestureDetector(
            onTap: () => Get.back(),
            child: Transform.rotate(
              angle: 180 * 3.14 / 180,
              child: Image.asset(
                'assets/images/arrow_2.png',
              ),
            ),
          ),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 351.w,
              height: 120.h,
              decoration: BoxDecoration(
                color: const Color(0xffFAEBE6),
                borderRadius: BorderRadius.circular(30),
                boxShadow: [
                  BoxShadow(
                    color: const Color(0xff000000).withOpacity(0.25),
                    blurRadius: 4,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Selesaikan pembayaran dalam waktu",
                    style: TextStyle(
                      fontSize: 14,
                      fontFamily: 'JosefinSans',
                      fontWeight: FontWeight.w700,
                      shadows: [
                        BoxShadow(
                          color: const Color(0xff000000).withOpacity(0.25),
                          blurRadius: 4,
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                  ).paddingOnly(top: 20.h, left: 30.w),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        '00:45:00',
                        style: TextStyle(
                          fontSize: 25.sp,
                          fontFamily: 'JosefinSans',
                          fontWeight: FontWeight.w700,
                          shadows: [
                            BoxShadow(
                              color: const Color(0xff000000).withOpacity(0.25),
                              blurRadius: 4,
                              offset: const Offset(0, 3),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ).paddingOnly(top: 15.h, left: 30.w, right: 30.w),
                ],
              ),
            ).paddingOnly(top: 20.h, bottom: 30.h, left: 30.w, right: 30.w),
            Center(
              child: Container(
                  child: Image.asset(
                      "assets/images/before_payment_review.png"
                  )
              ),
            ).paddingOnly(bottom: 30.h,),
            Text(
              "Apply Voucher",
              style: TextStyle(
                fontSize: 16,
                fontFamily: 'JosefinSans',
                fontWeight: FontWeight.w700,
                shadows: [
                  BoxShadow(
                    color: const Color(0xff000000).withOpacity(0.25),
                    blurRadius: 4,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
            ).paddingOnly(left: 30.w, bottom: 20.h),
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
                              controller.whatsNewList[index]['image'].toString(),
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
                                controller.whatsNewList[index]['description']
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
            ).paddingOnly(left: 10.w, right: 30.w),
          ],
        ),
      );
  }
}
