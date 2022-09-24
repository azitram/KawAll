import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  //TODO: Implement HomeController

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
    FlutterNativeSplash.remove();
  }

  void increment() => count.value++;
}
