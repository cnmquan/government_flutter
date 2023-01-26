import 'package:equatable/equatable.dart';

class IdCardModel extends Equatable {
  final String? id;
  final String? idNumber;
  final String? fullName;
  final String? dateOfBirth;
  final String? gender;
  final String? nationality;
  final String? placeOfOrigin;
  final String? placeOfResidence;
  final String? dateOfExpiry;
  final String? personalIdentification;
  final String? dateOfGranted;
  final String? placeOfGranted;
  final String? ethnic;
  final String? religion;

  const IdCardModel({
    this.id,
    this.idNumber,
    this.fullName,
    this.dateOfBirth,
    this.gender,
    this.nationality,
    this.placeOfOrigin,
    this.placeOfResidence,
    this.dateOfExpiry,
    this.personalIdentification,
    this.dateOfGranted,
    this.placeOfGranted,
    this.ethnic,
    this.religion,
  });
  static IdCardModel example() {
    IdCardModel exampleModel = const IdCardModel(
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

  @override
  List<Object?> get props => [];

  @override
  bool? get stringify => true;
}
