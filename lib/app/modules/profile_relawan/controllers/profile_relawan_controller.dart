import 'package:flutter/animation.dart';
import 'package:get/get.dart';

import '../../pilih_psikolog/models/psikolog_model.dart';

class ProfileRelawanController extends GetxController {
  final focusItemCard = 0.obs;
  final color = const Color(0xFF000000).obs;

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
  }

  final data = [
    Psikolog(
      name: "Example",
      price: 21000,
      image: "assets/images/default_profile_img.png",
      satisfied: 95,
      unsatisfied: 5,
      totalFeedBack: 100,
      age: 22,
      specialist: "-",
      experience: "Mahasiswa",
    ),
  ].obs;
}
