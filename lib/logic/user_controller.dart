import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
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

  Future<ResidentModel?> getResidentFromEmail(String email) async {
    CollectionReference residentRef = firestore.collection('residents');
    QuerySnapshot residentSnap =
        await residentRef.where('email', isEqualTo: email).get();
    if (residentSnap.docs.isEmpty) {
      return null;
    }
    String phoneNumber = residentSnap.docs.first.id;
    debugPrint(phoneNumber);
    CollectionReference paperCollection =
        residentRef.doc(phoneNumber).collection('paper');
    DocumentSnapshot idCardSnapshot = await paperCollection.doc('idCard').get();
    Map<String, dynamic> idCardData =
        idCardSnapshot.data() as Map<String, dynamic>;
    debugPrint('$idCardData');
    DocumentSnapshot birthCertificationSnapshot =
        await paperCollection.doc('birthCertification').get();
    Map<String, dynamic> birthCertificationData =
        birthCertificationSnapshot.data() as Map<String, dynamic>;
    debugPrint('$birthCertificationData');
    Map<String, dynamic> residentData =
        residentSnap.docs.first.data() as Map<String, dynamic>;
    debugPrint('$residentData');
    IdCardModel idCardModel = IdCardModel.fromJson(idCardData);
    BirthCertificationModel birthCertificationModel =
        BirthCertificationModel.fromJson(birthCertificationData);
    debugPrint('${residentData['papers']}');
    ResidentModel residentModel = ResidentModel(
      email: residentData['email'],
      papers: residentData['papers'],
      phoneNumber: phoneNumber,
      idCardModel: idCardModel,
      birthCertificationModel: birthCertificationModel,
    );
    debugPrint(
        '$residentData - $phoneNumber - $idCardData - $birthCertificationData');
    return residentModel;
  }
}
