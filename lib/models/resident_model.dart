import '../models.dart';

class ResidentModel {
  final String? email;
  final String? phoneNumber;
  final dynamic papers;
  final IdCardModel? idCardModel;
  final BirthCertificationModel? birthCertificationModel;

  const ResidentModel({
    this.email,
    this.birthCertificationModel,
    this.phoneNumber,
    this.idCardModel,
    this.papers,
  });
}
