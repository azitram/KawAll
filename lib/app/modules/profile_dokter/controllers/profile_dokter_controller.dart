import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../pilih_psikolog/models/psikolog_model.dart';

class ProfileDokterController extends GetxController {
  final focusItemCard = 0.obs;
  final color = const Color(0xFF000000).obs;
  final chatId = "chatId".obs;

  final name = "".obs;
  final price = 0.obs;
  final image = "".obs;
  final satisfied = 0.obs;
  final unsatisfied = 0.obs;
  final totalFeedBack = 0.obs;
  final age = 0.obs;
  final specialist = "".obs;
  final experience = "".obs;

  @override
  void onInit() {
    super.onInit();
    name.value = data[0].name;
    price.value = data[0].price;
    image.value = data[0].image;
    satisfied.value = data[0].satisfied;
    unsatisfied.value = data[0].unsatisfied;
    totalFeedBack.value = data[0].totalFeedBack;
    age.value = data[0].age;
    specialist.value = data[0].specialist;
    experience.value = data[0].experience;

    // initWordChatCount();
  }

  final data = [
    Psikolog(
      name: "Dr. Muhammad Habibul Ihsan",
      price: 130000,
      image: "assets/images/psikolog3.png",
      satisfied: 95,
      unsatisfied: 5,
      totalFeedBack: 100,
      age: 30,
      specialist: "Umum",
      experience: "6 Tahun",
    ),
  ].obs;

  // final docRef = FirebaseFirestore.instance.collection('users');
  User? user = FirebaseAuth.instance.currentUser;

  // // untuk cek apakah user sudah top up atau belum
  // var wordChatCount = 0.obs;

  // void initWordChatCount() {
  //   // Get wordChatCount from user collection reference
  //   FirebaseFirestore.instance.collection('users').doc(user!.uid).get().then(
  //     (value) {
  //       wordChatCount.value = int.parse(value.data()!['wordChatCount']);
  //     },
  //   );
  // }

  uploadChat() async {
    List<dynamic> messages = [];
    List<String?> users = [];

    users = [user?.email, "dokter@gmail.com"];
    var id = "${user?.email}|dokter@gmail.com";

    Map<String, dynamic> chatMap = {
      'users': users,
      'messages': messages,
      'id': id,
    };
    chatId.value = id;
    var chat =
        await FirebaseFirestore.instance.collection('chats').doc(id).get();

    if (!chat.exists) {
      FirebaseFirestore.instance.collection('chats').doc(id).set(chatMap);
    }
  }
}
