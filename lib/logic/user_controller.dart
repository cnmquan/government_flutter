import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:faker_dart/faker_dart.dart';
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
      debugPrint('Phone Number exist');
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

  Future<List<ResidentModel?>?> getResidentsFromSearch({String? text}) async {
    CollectionReference residentRef = firestore.collection('residents');
    QuerySnapshot residentSnap = await residentRef.limit(50).get();
    if (residentSnap.docs.isEmpty) {
      debugPrint('Is Empty');
      return null;
    }
    List<ResidentModel?> residents = [];
    for (var querySnapshot in residentSnap.docs) {
      String phoneNumber = querySnapshot.id;
      debugPrint(phoneNumber);
      CollectionReference paperCollection =
          residentRef.doc(phoneNumber).collection('paper');
      DocumentSnapshot idCardSnapshot =
          await paperCollection.doc('idCard').get();
      Map<String, dynamic> idCardData =
          idCardSnapshot.data() as Map<String, dynamic>;
      debugPrint('$idCardData');
      DocumentSnapshot birthCertificationSnapshot =
          await paperCollection.doc('birthCertification').get();
      Map<String, dynamic> birthCertificationData =
          birthCertificationSnapshot.data() as Map<String, dynamic>;
      debugPrint('$birthCertificationData');
      Map<String, dynamic> residentData =
          querySnapshot.data() as Map<String, dynamic>;
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
      residents.add(residentModel);
    }

    return residents;
  }

  static Future create100Account() async {
    final fakerDart = Faker.instance;
    fakerDart.setLocale(FakerLocaleType.vi);
    for (int i = 0; i < 100; i++) {
      String phoneNumber =
          fakerDart.phoneNumber.phoneNumber().replaceAll(' ', '');
      debugPrint('$i - $phoneNumber');
      await UserController().createResidentAccount(
          phoneNumber: phoneNumber, email: fakerDart.internet.email());
    }
  }
}
