import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

import '../controllers/volunteer_hiring_controller.dart';

class VolunteerHiringView extends GetView<VolunteerHiringController> {
  const VolunteerHiringView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: 1.sh,
          width: 1.sw,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/background_volunteer.png"),
              fit: BoxFit.fill,
            ),
          ),
          child: Column(
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: Image.asset(
                  'assets/images/logo.png',
                  width: 42.w,
                ),
              ).paddingOnly(top: 20.h, left: 20.w),
              const Spacer(),
              Text(
                "Yuk Volunteer!",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 35.sp,
                  shadows: const [
                    Shadow(
                      blurRadius: 10.0,
                      color: Colors.grey,
                      offset: Offset(1.0, 5.0),
                    ),
                  ],
                  fontWeight: FontWeight.w700,
                ),
              ),
              const Spacer(),
              Image.asset(
                "assets/images/volunteer_img.png",
                width: 322.w,
                height: 353.h,
              ),
              25.verticalSpace,
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: "Ingin ",
                      style: TextStyle(
                        color: const Color(0xff292D32),
                        fontFamily: 'Montserrat',
                        fontSize: 14.sp,
                      ),
                    ),
                    TextSpan(
                      text: "berkontribusi",
                      style: TextStyle(
                        color: const Color(0xff292D32),
                        fontFamily: 'Montserrat',
                        fontSize: 14.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextSpan(
                      text:
                          " tapi nggak tahu bagaimana? Nah, KawAll punya solusinya nih. Yuk ikuti program",
                      style: TextStyle(
                        color: const Color(0xff292D32),
                        fontFamily: 'Montserrat',
                        fontSize: 14.sp,
                      ),
                    ),
                    TextSpan(
                      text: " volunteer",
                      style: TextStyle(
                        color: const Color(0xff292D32),
                        fontFamily: 'Montserrat',
                        fontSize: 14.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextSpan(
                      text:
                          " KawAll dan dapatkan berbagai pengalaman yang menarik!",
                      style: TextStyle(
                        color: const Color(0xff292D32),
                        fontFamily: 'Montserrat',
                        fontSize: 14.sp,
                      ),
                    ),
                  ],
                ),
              ).paddingOnly(left: 51.w, right: 51.w),
              const Spacer(),
              ElevatedButton(
                onPressed: () => launchUrl(
                  Uri.parse("https://nffoq0ghbqu.typeform.com/to/fmMMUMrk"),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xffBE5F5F),
                  minimumSize: Size(225.w, 61.h),
                  elevation: 0,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(30),
                    ),
                  ),
                ),
                child: Text(
                  "Daftar Sekarang",
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
