import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';

class DokterHomeController extends GetxController {
  //TODO: Implement DokterHomeController

  final count = 0.obs;
  User? user = FirebaseAuth.instance.currentUser;
  @override
  void onInit() {
    super.onInit();
    FlutterNativeSplash.remove();
  }

  Stream<QuerySnapshot> getChatRoom() {
    return FirebaseFirestore.instance
        .collection('chats')
        .where('users', arrayContains: user?.email)
        .snapshots();
  }



  void increment() => count.value++;
}
