class RequestModel {
  String? phoneNumber;
  String? fullName;
  String? requestType;
  List<dynamic>? requests;
  String? dateRequest;
  String? status;
  String? dateAccept;
  String? acceptPerson;

  RequestModel({
    this.phoneNumber,
    this.fullName,
    this.requests,
    this.requestType,
    this.status,
    this.acceptPerson,
    this.dateAccept,
    this.dateRequest,
  });

  RequestModel.fromJson(Map<String, dynamic> json) {
    phoneNumber = json['phoneNumber'];
    fullName = json['fullName'];
    requests = json['requests'];
    requestType = json['requestType'];
    dateRequest = json['dateRequest'];
    status = json['status'];
    dateAccept = json['dateAccept'];
    acceptPerson = json['acceptPerson'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['phoneNumber'] = phoneNumber;
    data['fullName'] = fullName;
    data['requestType'] = requestType;
    data['requests'] = requests;
    data['dateRequest'] = dateRequest;
    data['status'] = status;
    data['dateAccept'] = dateAccept;
    data['acceptPerson'] = acceptPerson;
    return data;
  }
}
