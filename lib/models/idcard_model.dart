import 'dart:math';

import 'package:faker_dart/faker_dart.dart';

class IdCardModel {
  String? fullName;
  String? idNumber;
  String? dateOfBirth;
  String? dateOfExpiry;
  String? dateOfGranted;
  String? gender;
  String? nationality;
  String? personalIdentification;
  String? placeOfGranted;
  String? placeOfOrigin;
  String? placeOfResidence;
  String? ethnic;
  String? religion;
  String? image;

  IdCardModel({
    this.fullName,
    this.idNumber,
    this.dateOfBirth,
    this.dateOfExpiry,
    this.dateOfGranted,
    this.gender,
    this.nationality,
    this.personalIdentification,
    this.placeOfGranted,
    this.placeOfOrigin,
    this.placeOfResidence,
    this.ethnic,
    this.religion,
    this.image,
  });

  IdCardModel.fromJson(Map<String, dynamic> json) {
    fullName = json['fullName'];
    idNumber = json['idNumber'];
    dateOfBirth = json['dateOfBirth'];
    dateOfExpiry = json['dateOfExpiry'];
    dateOfGranted = json['dateOfGranted'];
    gender = json['gender'];
    nationality = json['nationality'];
    personalIdentification = json['personalIdentification'];
    placeOfGranted = json['placeOfGranted'];
    placeOfOrigin = json['placeOfOrigin'];
    placeOfResidence = json['placeOfResidence'];
    ethnic = json['ethnic'];
    religion = json['religion'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['fullName'] = fullName;
    data['idNumber'] = idNumber;
    data['dateOfBirth'] = dateOfBirth;
    data['dateOfExpiry'] = dateOfExpiry;
    data['dateOfGranted'] = dateOfGranted;
    data['gender'] = gender;
    data['nationality'] = nationality;
    data['personalIdentification'] = personalIdentification;
    data['placeOfGranted'] = placeOfGranted;
    data['placeOfOrigin'] = placeOfOrigin;
    data['placeOfResidence'] = placeOfResidence;
    data['ethnic'] = ethnic;
    data['religion'] = religion;
    data['image'] = image;
    return data;
  }

  static IdCardModel example() {
    IdCardModel exampleModel = IdCardModel(
      fullName: r'Nguyễn Văn A',
      idNumber: r'123456789',
      dateOfBirth: r'1/1/1990',
      dateOfExpiry: r'1/1/2050',
      dateOfGranted: r'1/1/2022',
      gender: r'Nam',
      nationality: r'Việt Nam',
      personalIdentification: r'Có vết ở mắt',
      placeOfGranted:
          r'Cục trưởng cục cảnh sát quản lý hành chính về trật tự xã hội',
      placeOfOrigin: r'Thành phố Hồ Chí Minh',
      placeOfResidence: r'Bình Dương',
      ethnic: r'Kinh',
      religion: r'Không',
    );
    return exampleModel;
  }

  static IdCardModel createRandomIdCard() {
    final faker = Faker.instance;
    faker.setLocale(FakerLocaleType.vi);
    return IdCardModel(
      idNumber: '${Random().nextDouble() * 1000000000}',
      image: 'https://source.unsplash.com/random/?People',
      fullName: faker.name.fullName(),
      dateOfBirth: faker.date.month(),
      dateOfExpiry: faker.date.month(),
      dateOfGranted: faker.date.month(),
      gender: Random().nextBool() ? 'Nam' : 'Nữ',
      nationality: r'Việt Nam',
      personalIdentification: faker.lorem.text(),
      placeOfGranted: faker.address.cityName(),
      placeOfOrigin: faker.address.cityName(),
      placeOfResidence: faker.address.cityName(),
      ethnic: r'Kinh',
      religion: r'Không',
    );
  }
}
