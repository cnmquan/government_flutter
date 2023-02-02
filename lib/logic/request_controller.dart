import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:goverment_flutter_system/logic/firebase_controller.dart';
import 'package:goverment_flutter_system/models.dart';

class RequestController extends FirebaseController {
  Future<void> sendRequestResident(RequestModel request) async {
    CollectionReference requestRef = firestore.collection('requests');
    await requestRef
        .doc(
            '${request.phoneNumber}${DateTime.now().millisecondsSinceEpoch.toString()}')
        .set(
          request.toJson(),
        );
  }

  Future<List<RequestModel?>?> getAllRequestResident() async {
    CollectionReference requestRef = firestore.collection('requests');
    QuerySnapshot requestSnap = await requestRef.get();
    if (requestSnap.docs.isEmpty) {
      debugPrint('Is Empty');
      return null;
    }
    List<RequestModel?>? requests = [];
    for (var querySnapshot in requestSnap.docs) {
      var requestData = querySnapshot.data() as Map<String, dynamic>;
      RequestModel requestModel = RequestModel(
        fullName: requestData['fullName'],
        phoneNumber: requestData['phoneNumber'],
        requests: requestData['requests'],
        requestType: requestData['requestType'],
        status: requestData['status'],
        acceptPerson: requestData['acceptPerson'],
        dateRequest: requestData['dateRequest'],
        dateAccept: requestData['dateAccept'],
      );
      requests.add(requestModel);
    }
    return requests;
  }

  Future<void> updateRequestResident(
    RequestModel requestModel,
    String acceptPerson,
    String status,
  ) async {
    CollectionReference requestRef = firestore.collection('requests');
    QuerySnapshot requestSnap = await requestRef
        .where('phoneNumber', isEqualTo: requestModel.phoneNumber)
        .where('dateRequest', isEqualTo: requestModel.dateRequest)
        .get();

    String requestId = requestSnap.docs.first.id;
    requestModel.acceptPerson = acceptPerson;
    requestModel.status = status;
    DateTime now = DateTime.now();
    requestModel.dateAccept =
        '${now.hour}:${now.minute}:${now.second} ${now.day}/${now.month}/${now.year}';
    await requestRef
        .doc(requestId)
        .update(requestModel.toJson())
        .then((value) => debugPrint('success'))
        .catchError((error) => debugPrint('error'));
  }

  Future<List<RequestModel?>?> getRequestResidents(String phoneNumber) async {
    CollectionReference requestRef = firestore.collection('requests');
    QuerySnapshot requestSnap =
        await requestRef.where('phoneNumber', isEqualTo: phoneNumber).get();
    debugPrint('${requestSnap.docs.length}');
    if (requestSnap.docs.isEmpty) {
      return null;
    }
    List<RequestModel?> requests = [];
    for (var querySnapshot in requestSnap.docs) {
      var requestData = querySnapshot.data() as Map<String, dynamic>;
      debugPrint('$requestData');
      RequestModel requestModel = RequestModel.fromJson(requestData);
      requests.add(requestModel);
      debugPrint('$requestModel');
    }
    return requests;
  }
}
