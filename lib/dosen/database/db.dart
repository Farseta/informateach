import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
// import 'package:informateach/createTicket.dart';

User? user = FirebaseAuth.instance.currentUser;

late Map<String, dynamic> currentDosen;

Future getCurrentDosen() async {
  try {
    var dosenQuery = await FirebaseFirestore.instance
        .collection('users')
        .where('Email', isEqualTo: user?.email)
        .get();
    if (dosenQuery.docs.isNotEmpty) {
      var dosenData = dosenQuery.docs.first.data();
      currentDosen = dosenData;
    } else {
      print('Data kosong');
    }
  } catch (e) {
    print(e);
  }
}

Future createTicket(String date, String time) async {
  try {} catch (e) {
    print(e);
  }
}
