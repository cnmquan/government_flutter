import 'dart:math';

import 'package:faker_dart/faker_dart.dart';

class BirthCertificationModel {
  final String? id;
  final String? fullName;
  final String? gender;
  final String? dateOfBirth;
  final String? dateOfBirthText;
  final String? placeOfBirth;
  final String? ethnic;
  final String? nationality;
  final String? placeOfOrigin;
  final String? fatherFullName;
  final String? fatherEthnic;
  final String? fatherNationality;
  final String? motherFullName;
  final String? motherEthnic;
  final String? motherNationality;
  final String? declarerFullName;
  final String? declarerRelationship;
  final String? dateOfRegistration;
  final String? placeOfRegistration;

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'fullName': fullName,
      'gender': gender,
      'dateOfBirth': dateOfBirth,
      'dateOfBirthText': dateOfBirthText,
      'placeOfBirth': placeOfBirth,
      'ethnic': ethnic,
      'nationality': nationality,
      'placeOfOrigin': placeOfOrigin,
      'fatherFullName': fatherFullName,
      'fatherEthnic': fatherEthnic,
      'fatherNationality': fatherNationality,
      'motherFullName': motherFullName,
      'motherEthnic': motherEthnic,
      'motherNationality': motherNationality,
      'declarerFullName': declarerFullName,
      'declarerRelationship': declarerRelationship,
      'dateOfRegistration': dateOfRegistration,
      'placeOfRegistration': placeOfRegistration,
    };
  }

  const BirthCertificationModel({
    this.id,
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
    this.placeOfRegistration,
  });

  static BirthCertificationModel example() {
    BirthCertificationModel exampleModel = const BirthCertificationModel(
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
