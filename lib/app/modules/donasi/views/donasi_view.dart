import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

import '../controllers/donasi_controller.dart';

class DonasiView extends GetView<DonasiController> {
  const DonasiView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: 1.sw,
          height: 1.sh,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/background_donasi.png"),
              fit: BoxFit.fill,
            ),
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
              Text(
                "Let’s Donate to Support Us!",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'Montserrat',
                  fontSize: 35.sp,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  shadows: [
                    Shadow(
                      blurRadius: 4,
                      color: Colors.black.withOpacity(0.25),
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
              ),
              const Spacer(),
              Image.asset(
                "assets/images/donasi_img.png",
                width: 260.w,
              ),
              const Spacer(),
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: "Ingin ",
                      style: TextStyle(
                        fontFamily: 'Montserrat',
                        fontSize: 14.sp,
                        color: const Color(0xff292D32),
                      ),
                    ),
                    TextSpan(
                      text: "berkontribusi ",
                      style: TextStyle(
                        fontFamily: 'Montserrat',
                        fontSize: 14.sp,
                        fontWeight: FontWeight.bold,
                        color: const Color(0xff292D32),
                      ),
                    ),
                    TextSpan(
                      text:
                          " tapi belum cukup umur untuk volunteer atau ga ada waktu? Yuk berikan ",
                      style: TextStyle(
                        fontFamily: 'Montserrat',
                        fontSize: 14.sp,
                        color: const Color(0xff292D32),
                      ),
                    ),
                    TextSpan(
                      text: "donasimu",
                      style: TextStyle(
                        fontFamily: 'Montserrat',
                        fontSize: 14.sp,
                        fontWeight: FontWeight.bold,
                        color: const Color(0xff292D32),
                      ),
                    ),
                    TextSpan(
                      text:
                      " untuk bersama kembangkan KawAll!",
                      style: TextStyle(
                        fontFamily: 'Montserrat',
                        fontSize: 14.sp,
                        color: const Color(0xff292D32),
                      ),
                    ),
                  ],
                ),
              ).paddingSymmetric(horizontal: 51.w),
              const Spacer(),
              ElevatedButton(
                onPressed: () {
                  launchUrl(
                    Uri.parse("https://sociabuzz.com/dyanettanr/tribe"),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xffBE5F5F),
                  minimumSize: Size(165.w, 60.h),
                  elevation: 0,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(30),
                    ),
                  ),
                ),
                child: Text(
                  "Donate here",
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'Montserrat',
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
