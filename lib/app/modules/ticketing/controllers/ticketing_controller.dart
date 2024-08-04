import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class TicketingController extends GetxController {
  final date = DateTime.now().obs;
  final day = ''.obs;
  final dayName = ''.obs;
  User? user = FirebaseAuth.instance.currentUser;

  final konselingRef = FirebaseFirestore.instance.collection("konseling");

  final name = Get.arguments["name"].toString();
  final image = Get.arguments["image"].toString();
  final consultTime = [
    "16.00 - 17.00",
    "17.30 - 18.30",
    "19.00 - 20.00",
  ];

  final isBooked = [true, true, true].obs;

  var selectedVal = 0.obs;

  @override
  void onInit() {
    day.value = DateFormat('EEEE, d MMM yyyy').format(date.value);
    dayName.value = DateFormat('EEEE').format(date.value);
  }
}
