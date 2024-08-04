import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:horizontal_calendar/horizontal_calendar.dart';
import 'package:intl/intl.dart';

import '../../../routes/app_pages.dart';
import '../controllers/ticketing_controller.dart';


class TicketingView extends GetView<TicketingController> {
  const TicketingView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffDCE3D9),
      body: SafeArea(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  height: 315.h,
                  width: 1.sw,
                  decoration: BoxDecoration(
                    color: const Color(0xffF5C3B3),
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(40),
                      bottomRight: Radius.circular(40),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.25),
                        blurRadius: 4,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                ).paddingOnly(bottom: 10.h),
                Positioned(
                  top: 77.h,
                  right: 0.w,
                  left: 0.w,
                  child: Image.asset(
                    'assets/images/top_ticketing_bg.png',
                    fit: BoxFit.fill,
                  ),
                ),
                // AppBar Section
                Align(
                  alignment: Alignment.topLeft,
                  child: Image.asset(
                    'assets/images/logo.png',
                    width: 42.w,
                  ),
                ).paddingOnly(left: 20.w, top: 20.h),
                Align(
                  alignment: Alignment.topCenter,
                  child: Text(
                    'Konseling Psikolog',
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'Montserrat',
                      fontSize: 18.sp,
                      fontWeight: FontWeight.bold,
                      shadows: [
                        Shadow(
                          color: Colors.black.withOpacity(0.25),
                          offset: const Offset(0, 4),
                          blurRadius: 4,
                        ),
                      ],
                    ),
                  ).paddingOnly(top: 20.h),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
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
                ).paddingSymmetric(horizontal: 12.w, vertical: 10.h),
                // Detail Psikolog
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Column(
                    children: [
                      // Psikolog Image
                      Container(
                        width: 151.w,
                        height: 194.h,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.r),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 0,
                              blurRadius: 4,
                              offset: const Offset(
                                  0, 4), // changes position of shadow
                            ),
                          ],
                          image: DecorationImage(
                            image:
                                AssetImage(controller.image), // Psikolog Image
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      // Psikolog Name
                      Text(
                        controller.name,
                        style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontSize: 18.sp,
                          fontWeight: FontWeight.bold,
                          color: const Color(0xff444941),
                        ),
                      ).paddingOnly(top: 11.h),
                    ],
                  ),
                ).marginOnly(top: 70.h),
              ],
            ),
            // Calendar Section
            HorizontalCalendar(
              date: DateTime.now(),
              initialDate: DateTime.now(),
              textColor: Colors.black54,
              backgroundColor: const Color(0xffDCE3D9),
              selectedColor: const Color(0xffA39E9E),
              onDateSelected: (date) {
                controller.date.value = date;
                controller.day.value = DateFormat('EEEE, d MMM yyyy')
                    .format(date);
                controller.dayName.value =
                    DateFormat('EEEE').format(date);
              },
            ),
            const Spacer(),
            // Date Section
            Obx(() {
              return Text(
                controller.day.value,
                style: TextStyle(
                  color: Colors.black,
                  fontFamily: 'Montserrat',
                  fontSize: 20.sp,
                  fontWeight: FontWeight.bold,
                  shadows: [
                    Shadow(
                      color: Colors.black.withOpacity(0.25),
                      offset: const Offset(0, 3),
                      blurRadius: 4,
                    ),
                  ],
                ),
              );
            }),
            const Spacer(),
            // Ticket Section
            Obx(
              () => StreamBuilder<QuerySnapshot>(
                  stream: FirebaseFirestore.instance
                      .collection('konseling')
                      .where('jadwal', isEqualTo: controller.day.value)
                      .where('psikolog', isEqualTo: controller.name)
                      .snapshots(),
                  builder: (context, snapshot) {
                    //print(snapshot.data?.docs.length);
                    return Container(
                      height: 400.h,
                      width: 1.sw,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(
                            'assets/images/bottom_ticketing.png',
                          ),
                          fit: BoxFit.fill,
                        ),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30),
                          topRight: Radius.circular(30),
                        ),
                      ),
                      child: (controller.dayName.value == "Sunday" ||
                              controller.dayName.value == "Saturday")
                          ? const Center(
                              child: Text(
                                "Tidak ada jadwal",
                                style: TextStyle(
                                  color: Colors.black54,
                                  fontFamily: 'Montserrat',
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            )
                          : Column(
                              children: [
                                const Spacer(),
                                // Schedule Section
                                ListView.builder(
                                  shrinkWrap: true,
                                  itemBuilder: (context, index) {
                                    try {
                                      controller.isBooked[index] =
                                          snapshot.data?.docs[index]['jam'] ==
                                              controller.consultTime[index];
                                      if (snapshot.data?.docs[index]['jam'] ==
                                          controller.consultTime[2]) {
                                        controller.isBooked[2] = true;
                                      }
                                    } catch (e) {
                                      controller.isBooked[index] = false;
                                    }
                                    return GestureDetector(
                                      onTap: () {
                                        controller.selectedVal.value = index;
                                      },
                                      child: !controller.isBooked[index]
                                          ? Obx(
                                              () => ScheduleButton(
                                                time: controller
                                                    .consultTime[index],
                                                color: controller.selectedVal
                                                            .value ==
                                                        index
                                                    ? const Color.fromARGB(
                                                        255, 212, 183, 103)
                                                    : const Color(0xff9ECC88),
                                                textColor: controller
                                                            .selectedVal
                                                            .value ==
                                                        index
                                                    ? const Color(0xff908784)
                                                    : Colors.black,
                                              ).paddingOnly(
                                                  bottom: 15.h,
                                                  left: 80.w,
                                                  right: 80.w),
                                            )
                                          : ScheduleButton(
                                              time: snapshot.data!.docs[index]
                                                  ['jam'],
                                              color: const Color(0xffDCE3D9),
                                              textColor:
                                                  const Color(0xff908784),
                                            ).paddingOnly(
                                              bottom: 15.h,
                                              left: 80.w,
                                              right: 80.w),
                                    );
                                  },
                                  itemCount: controller.consultTime.length,
                                ),

                                const Spacer(),
                                // Submit button
                                GestureDetector(
                                  onTap: () =>
                                      Get.toNamed(Routes.PAYMENT, arguments: [
                                    controller.name,
                                    controller.date.value,
                                    controller.day.value,
                                    controller.consultTime[
                                        controller.selectedVal.value],
                                    controller.user?.email,
                                    "psikolog"
                                  ]),
                                  child: Container(
                                    height: 53.h,
                                    width: 230.w,
                                    decoration: BoxDecoration(
                                      color: const Color(0xff647C59),
                                      borderRadius: const BorderRadius.all(
                                        Radius.circular(30),
                                      ),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.black.withOpacity(0.25),
                                          blurRadius: 4,
                                          offset: const Offset(0, 3),
                                        ),
                                      ],
                                    ),
                                    child: Center(
                                      child: Text(
                                        'Schedule Now',
                                        style: TextStyle(
                                          fontFamily: 'Montserrat',
                                          fontSize: 16.sp,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                const Spacer(),
                              ],
                            ),
                    );
                  }),
            )
          ],
        ),
      ),
    );
  }
}

class ScheduleButton extends StatelessWidget {
  final time;
  final color;
  final textColor;

  const ScheduleButton({
    Key? key,
    required this.time,
    required this.color,
    required this.textColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60.h,
      width: 150.w,
      decoration: BoxDecoration(
        color: color,
        border: Border.all(color: Colors.white, width: 2.w),
        borderRadius: const BorderRadius.all(
          Radius.circular(10),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.25),
            blurRadius: 4,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Center(
        child: Text(
          time,
          style: TextStyle(
            fontFamily: 'Montserrat',
            fontSize: 20.sp,
            fontWeight: FontWeight.bold,
            color: textColor,
          ),
        ),
      ),
    );
  }
}
