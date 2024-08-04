import 'dart:ui';

import 'package:get/get.dart';

class PelaporanController extends GetxController {
  var listDataCard = [
    {
      "title": "Lover",
      "description":
      "Pacarmu berani melakukan hal-hal diluar batas? Ragu untuk melaporkan “pacar sendiri”? Tetapkan batasan pada dirimu, ayo sini Cupin bantu.",
      "bgColor": const Color(0xffFAF3EB),
    },
    {
      "title": "Family Member",
      "description":
          "Apakah kamu mengalami pelecehan seksual oleh anggota keluargamu? Memang berat untuk melaporkan orang terdekatmu, tapi jangan khawatir karena Cupin akan bantu.",
      "bgColor": const Color(0xffF2E3D0),
    },
    {
      "title": "Friend",
      "description":
          "Merasa dilecehkan oleh teman dan ragu melapor karena sudah cukup lama berkawan? Hilangkan kegundahanmu, Cupin mengawalmu setiap waktu.",
      "bgColor": const Color(0xffF2E9C8),
    },
    {
      "title": "Stranger",
      "description":
          "Orang yang tak dikenal melakukan perbuatan keji itu terhadapmu? Laporkan kejadian itu, Cupin akan selalu mendukungmu.",
      "bgColor": const Color(0xffFFD8B4),
    },
  ];

  var currentStep = 0.obs;



}
