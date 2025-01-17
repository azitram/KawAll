import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../routes/app_pages.dart';

class PaymentController extends GetxController {
  final whatsNewList = <Map<String, dynamic>>[
    {
      'title': 'KoLaK',
      'description': 'Konseling Serasa Jajan Ayam Geprek',
      'image': 'assets/images/img_kolak_dashboard.png',
      'onTap': Routes.KOLAK,
      'bgColor': const Color(0xFFFAEBE6),
      'titleColor': const Color(0xFFB6411C),
      'descColor': const Color(0xFF877878),
    },
    {
      'title': 'PaNaS',
      'description': 'Paket Nanya Sepuasnya',
      'image': 'assets/images/img_panas_dashboard.png',
      'onTap': Routes.PANAS, // Routes.COMING_SOON
      'bgColor': const Color(0xFFEDD4D4),
      'titleColor': const Color(0xFFB6411C),
      'descColor': const Color(0xFF877878),
    },
  ];

  void openBottomSheet() {
    Get.bottomSheet(
      isDismissible: false,
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              GestureDetector(
                onTap: () => Get.back(),
                child: const Icon(Icons.close),
              ),
              const Expanded(
                child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    'Metode Pembayaran',
                    style: TextStyle(
                      color: Color(0xff5B6656),
                      fontFamily: 'Montserrat',
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ).paddingOnly(top: 15, left: 15, right: 15),
          20.verticalSpace,
          Column(
            children: [
              ListTile(
                leading: Image.asset(
                  'assets/images/gopay_logo.png',
                  width: 90.w,
                  height: 33.h,
                ),
                trailing: const Icon(Icons.arrow_forward_ios),
                title: const Text(
                  'Gopay',
                  style: TextStyle(
                    color: Color(0xff5B6656),
                    fontFamily: 'Montserrat',
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                onTap: () {
                  if (psikolog != "") {
                    createKonseling();
                    Get.toNamed(Routes.RECEIPT);
                  } else {
                    Get.until(
                            (route) => Get.currentRoute == Routes.PROFILE_DOKTER);
                  }
                },
                shape: const Border(
                  top: BorderSide(
                    color: Colors.black26,
                  ),
                ),
              ),
              ListTile(
                leading: Image.asset(
                  'assets/images/bri_logo.png',
                  width: 90.w,
                  height: 33.h,
                ),
                trailing: const Icon(Icons.arrow_forward_ios),
                title: const Text(
                  'BRI Bank Transfer',
                  style: TextStyle(
                    color: Color(0xff5B6656),
                    fontFamily: 'Montserrat',
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                onTap: () {
                  if (psikolog != "") {
                    createKonseling();
                    Get.toNamed(Routes.RECEIPT);
                  } else {
                    Get.until(
                        (route) => Get.currentRoute == Routes.PROFILE_DOKTER);
                  }
                },
                shape: const Border(
                  top: BorderSide(
                    color: Colors.black26,
                  ),
                ),
              ),
              ListTile(
                leading: Image.asset(
                  'assets/images/bni_logo.webp',
                  width: 90.w,
                  height: 33.h,
                ),
                trailing: const Icon(Icons.arrow_forward_ios),
                title: const Text(
                  'BNI Bank Transfer',
                  style: TextStyle(
                    color: Color(0xff5B6656),
                    fontFamily: 'Montserrat',
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                //jangan dirubah
                onTap: () {
                  if (psikolog != "") {
                    createKonseling();
                    Get.toNamed(Routes.RECEIPT);
                  } else {
                    Get.until(
                        (route) => Get.currentRoute == Routes.PROFILE_DOKTER);
                  }
                },
                shape: const Border(
                  bottom: BorderSide(
                    color: Colors.black26,
                  ),
                  top: BorderSide(
                    color: Colors.black26,
                  ),
                ),
              ),
              ListTile(
                leading: Image.asset(
                  'assets/images/bca_logo.webp',
                  width: 90.w,
                  height: 33.h,
                ),
                trailing: const Icon(Icons.arrow_forward_ios),
                title: const Text(
                  'BCA Bank Transfer',
                  style: TextStyle(
                    color: Color(0xff5B6656),
                    fontFamily: 'Montserrat',
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                onTap: () {
                  if (psikolog != "") {
                    createKonseling();
                    Get.toNamed(Routes.RECEIPT);
                  } else {
                    Get.until(
                        (route) => Get.currentRoute == Routes.PROFILE_DOKTER);
                  }
                },
                shape: const Border(
                  bottom: BorderSide(
                    color: Colors.black26,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
      backgroundColor: Colors.white,
      elevation: 0,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
    );
  }

  final konselingRef = FirebaseFirestore.instance.collection('konseling');

  late bool isPsikolog;
  late String jadwal;
  late String psikolog = "";
  late String user;
  late String jam;

  void createKonseling() {
    var chatId = konselingRef.doc().id;
    konselingRef.doc(chatId).set({
      'chatId': chatId,
      'jadwal': jadwal,
      'jam': jam,
      'pemesan': user,
      'psikolog': psikolog,
      'status': 'paid',
    });
  }

  @override
  void onInit() {
    super.onInit();
    if (Get.arguments != null) {
      isPsikolog = Get.arguments[5] == 'psikolog';
      jadwal = Get.arguments[2];
      psikolog = Get.arguments[0];
      user = Get.arguments[4];
      jam = Get.arguments[3];
    }
  }

  @override
  void onReady() {
    super.onReady();
    openBottomSheet();
  }
}
