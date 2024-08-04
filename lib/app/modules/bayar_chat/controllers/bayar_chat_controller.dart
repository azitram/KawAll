import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class BayarChatController extends GetxController {
  var selectedVal = 0.obs;
  final data = [
    {
      "jmlKata": "75",
      "harga": "24000",
    },
    {
      "jmlKata": "100",
      "harga": "40000",
    },
    {
      "jmlKata": "125",
      "harga": "56000",
    },
    {
      "jmlKata": "150",
      "harga": "66000",
    },
    {
      "jmlKata": "175",
      "harga": "82000",
    },
    {
      "jmlKata": "200",
      "harga": "98000",
    },
  ];




  final docRef = FirebaseFirestore.instance.collection('users');
  User? user = FirebaseAuth.instance.currentUser;

  void updateWordChatCount() {
    var oldWordChatCount = 0;

    docRef.doc(user!.uid).get().then((value) {
      oldWordChatCount = value.data()!['wordChatCount'];

      docRef.doc(user!.uid).update({
        'wordChatCount':
            oldWordChatCount + int.parse(data[selectedVal.value]['jmlKata']!)
      });
    });
  }
}
