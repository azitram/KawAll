import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../routes/app_pages.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double screenheight=MediaQuery.of(context).size.height;
    final double screenwidth=MediaQuery.of(context).size.width;
    return Stack(
      children: <Widget>[
        Image.asset(
          "assets/images/about_page.png",
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          fit: BoxFit.cover,
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: Column(
            children: [
              SizedBox(
                height: screenheight*(3.75/25),
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: screenwidth*(1/10),
                  right: screenwidth*(1/10),
                ),
                child: Container(
                  height: screenheight*(16/25),
                  width: screenwidth*(8/10),
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(40)),
                    color: Color(0xffFFFFFF),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: screenheight*(1/25),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          left: screenwidth*(0.5/10),
                          right: screenwidth*(0.5/10),
                        ),
                        child: Text(
                          "Get to know me",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontSize: 20,
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.w700,
                            color: const Color(0xff5B6656),
                            shadows: [
                              Shadow(
                                blurRadius: 4,
                                color: Colors.black.withOpacity(0.25),
                                offset: const Offset(0, 4),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: screenheight*(1/25),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          left: screenwidth*(0.5/10),
                          right: screenwidth*(0.5/10),
                        ),
                        child: const Text(
                          "Hello world!\n"
                              "My parents named me Martiza Hanim Tsurayya, and my friends call me \"Tija,\" although I prefer \"Hanim.\" I'm currently studying at SMA Pradita Dirgantara in Solo. So far, I've learned six programming languages: HTML, CSS, JavaScript, C++, Java, and Dart, as well as certain paths like front-end, back-end, and multi-platform app development. I intend to focus on machine learning; hence, I'll be learning Python very soon.",
                          style: TextStyle(
                            height: 1.5,
                            fontSize: 13,
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.w600,
                            color: Color(0xff5B6656),
                          ),
                          textAlign: TextAlign.justify,
                        ),
                      ),
                      SizedBox(
                        height: screenheight*(1/25),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          right: screenwidth*(0.5/10),
                        ),
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: GestureDetector(
                            onTap: () => Get.toNamed(Routes.WELCOME),
                            child: Container(
                              alignment: Alignment.center,
                              width: 115,
                              height: 35,
                              decoration: const BoxDecoration(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(30),
                                ),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.white,
                                    offset: Offset(3.0, 3.0),
                                    blurRadius: 15.0,
                                  ),
                                ],
                                color: Color(0xff788372),
                              ),
                              child: const Text(
                                "next",
                                style: TextStyle(
                                  fontFamily: 'Montserrat',
                                  fontSize: 15,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xffFFFFFF),
                                ),
                              ),
                            ),
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
      ],
    );
  }
}
