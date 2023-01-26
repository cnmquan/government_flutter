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
}
