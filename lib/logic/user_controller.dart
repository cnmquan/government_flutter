import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:goverment_flutter_system/logic/firebase_controller.dart';

import '../models.dart';

class UserController extends FirebaseController {
  Future<void> createResidentAccount({
    required String phoneNumber,
    required String email,
    String? idCardId,
  }) async {
    CollectionReference residentsRef = firestore.collection('residents');
    DocumentSnapshot phoneSnap = await residentsRef.doc(phoneNumber).get();
    if (phoneSnap.exists) {
      return;
    }
    await residentsRef.doc(phoneNumber).set(
      {
        'email': email,
        'papers': ['idCard', 'birthCertification'],
      },
    );
    CollectionReference paperCollection =
        residentsRef.doc(phoneNumber).collection('paper');
    await paperCollection.doc('idCard').set(
          IdCardModel.createRandomIdCard().toJson(),
        );
    await paperCollection.doc('birthCertification').set(
          BirthCertificationModel.createRandomBirthCertification().toJson(),
        );
  }

  Future<Map<String, String?>> getResidentEmail(String phoneNumber) async {
    CollectionReference residentsRef = firestore.collection('residents');
    DocumentSnapshot phoneDoc = await residentsRef.doc(phoneNumber).get();
    if (phoneDoc.exists) {
      var phoneData = phoneDoc.data() as Map<String, dynamic>;
      return {'email': phoneData['email']};
    } else {
      return {
        'email': null,
        'error': r'Số điện thoại chưa được đăng ký',
      };
    }
  }
}
