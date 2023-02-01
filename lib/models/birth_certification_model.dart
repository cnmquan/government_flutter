import 'dart:math';

import 'package:faker_dart/faker_dart.dart';

class BirthCertificationModel {
  String? id;
  String? fullName;
  String? gender;
  String? dateOfBirth;
  String? dateOfBirthText;
  String? placeOfBirth;
  String? ethnic;
  String? nationality;
  String? placeOfOrigin;
  String? fatherFullName;
  String? fatherEthnic;
  String? fatherNationality;
  String? motherFullName;
  String? motherEthnic;
  String? motherNationality;
  String? declarerFullName;
  String? declarerRelationship;
  String? dateOfRegistration;
  String? placeOfRegistration;

  BirthCertificationModel(
      {this.id,
      this.fullName,
      this.gender,
      this.dateOfBirth,
      this.dateOfBirthText,
      this.placeOfBirth,
      this.ethnic,
      this.nationality,
      this.placeOfOrigin,
      this.fatherFullName,
      this.fatherEthnic,
      this.fatherNationality,
      this.motherFullName,
      this.motherEthnic,
      this.motherNationality,
      this.declarerFullName,
      this.declarerRelationship,
      this.dateOfRegistration,
      this.placeOfRegistration});

  BirthCertificationModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    fullName = json['fullName'];
    gender = json['gender'];
    dateOfBirth = json['dateOfBirth'];
    dateOfBirthText = json['dateOfBirthText'];
    placeOfBirth = json['placeOfBirth'];
    ethnic = json['ethnic'];
    nationality = json['nationality'];
    placeOfOrigin = json['placeOfOrigin'];
    fatherFullName = json['fatherFullName'];
    fatherEthnic = json['fatherEthnic'];
    fatherNationality = json['fatherNationality'];
    motherFullName = json['motherFullName'];
    motherEthnic = json['motherEthnic'];
    motherNationality = json['motherNationality'];
    declarerFullName = json['declarerFullName'];
    declarerRelationship = json['declarerRelationship'];
    dateOfRegistration = json['dateOfRegistration'];
    placeOfRegistration = json['placeOfRegistration'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['fullName'] = fullName;
    data['gender'] = gender;
    data['dateOfBirth'] = dateOfBirth;
    data['dateOfBirthText'] = dateOfBirthText;
    data['placeOfBirth'] = placeOfBirth;
    data['ethnic'] = ethnic;
    data['nationality'] = nationality;
    data['placeOfOrigin'] = placeOfOrigin;
    data['fatherFullName'] = fatherFullName;
    data['fatherEthnic'] = fatherEthnic;
    data['fatherNationality'] = fatherNationality;
    data['motherFullName'] = motherFullName;
    data['motherEthnic'] = motherEthnic;
    data['motherNationality'] = motherNationality;
    data['declarerFullName'] = declarerFullName;
    data['declarerRelationship'] = declarerRelationship;
    data['dateOfRegistration'] = dateOfRegistration;
    data['placeOfRegistration'] = placeOfRegistration;
    return data;
  }

  static BirthCertificationModel example() {
    BirthCertificationModel exampleModel = BirthCertificationModel(
      id: r'012345678',
      fullName: r'Nguyễn Văn A',
      gender: r'Nam',
      dateOfBirth: r'1/1/2001',
      dateOfBirthText: r'Ngày một tháng một năm hai nghìn lẻ một',
      placeOfBirth: r'Bệnh viện đại học Y Dược',
      ethnic: r'Kinh',
      nationality: r'Việt Nam',
      placeOfOrigin: r'Thành phố Hồ Chí Minh',
      fatherFullName: r'Nguyễn Văn B',
      fatherEthnic: r'Kinh',
      fatherNationality: r'Việt Nam',
      motherFullName: r'Nguyễn Văn C',
      motherEthnic: r'Kinh',
      motherNationality: r'Việt Nam',
      declarerFullName: r'Nguyễn Văn B',
      declarerRelationship: r'Cha đẻ',
      dateOfRegistration: r'1/2/2001',
      placeOfRegistration: r'Ủy ban nhân dân Thành phố Hồ Chí Minh',
    );
    return exampleModel;
  }

  static BirthCertificationModel createRandomBirthCertification() {
    final faker = Faker.instance;
    faker.setLocale(FakerLocaleType.vi);
    BirthCertificationModel exampleModel = BirthCertificationModel(
      id: '${Random().nextDouble() * 1000000000}',
      fullName: faker.name.fullName(),
      gender: Random().nextBool() ? 'Nam' : 'Nữ',
      dateOfBirth: faker.date.month(),
      dateOfBirthText: r'Ngày một tháng một năm hai nghìn lẻ một',
      placeOfBirth: faker.company.companyName(),
      ethnic: r'Kinh',
      nationality: r'Việt Nam',
      placeOfOrigin: faker.address.cityName(),
      fatherFullName: faker.name.fullName(),
      fatherEthnic: r'Kinh',
      fatherNationality: r'Việt Nam',
      motherFullName: faker.name.fullName(),
      motherEthnic: r'Kinh',
      motherNationality: r'Việt Nam',
      declarerFullName: faker.name.fullName(),
      declarerRelationship: Random().nextBool() ? r'Dì ruột' : r'Cậu ruột',
      dateOfRegistration: faker.date.month(),
      placeOfRegistration: 'Ủy ban nhân dân ${faker.address.cityName()}',
    );
    return exampleModel;
  }
}
